import 'package:flutter/material.dart';

import '../../config/app_env.dart';
import '../../runtime/backend_link.dart';
import '../../runtime/signal_relay.dart';
import '../../runtime/trace_beacon.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/field_card.dart';
import '../../widgets/sprout_button.dart';

class FlockAccessScreen extends StatefulWidget {
  final VoidCallback onDone;
  const FlockAccessScreen({super.key, required this.onDone});

  @override
  State<FlockAccessScreen> createState() => _FlockAccessScreenState();
}

class _FlockAccessScreenState extends State<FlockAccessScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _createMode = false;
  bool _busy = false;

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  void _toast(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _submit() async {
    if (!AppEnv.hasSupabase) {
      _toast('Accounts are unavailable right now.');
      return;
    }
    if (!_formKey.currentState!.validate()) return;
    setState(() => _busy = true);
    try {
      if (_createMode) {
        final res = await BackendLink.enroll(_email.text.trim(), _pass.text);
        TraceBeacon.registration();
        final uid = res.user?.id;
        if (uid != null) await SignalRelay.bindUser(uid);
        _toast('Account created. Check your inbox to confirm.');
      } else {
        final res = await BackendLink.signIn(_email.text.trim(), _pass.text);
        TraceBeacon.login();
        final uid = res.user?.id;
        if (uid != null) await SignalRelay.bindUser(uid);
      }
      if (!mounted) return;
      widget.onDone();
    } catch (e) {
      _toast(_humanError(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _humanError(Object e) {
    final s = e.toString();
    if (s.contains('Invalid login')) return 'Wrong email or password.';
    if (s.contains('already registered')) {
      return 'This email is already registered.';
    }
    return 'Something went wrong. Please try again.';
  }

  Future<void> _forgotPassword() async {
    final email = _email.text.trim();
    if (email.isEmpty) {
      _toast('Enter your email first, then tap reset.');
      return;
    }
    try {
      await BackendLink.resetPassword(email);
      _toast('Password reset link sent.');
    } catch (_) {
      _toast('Could not send reset link.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: FieldPalette.meadowGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: QuietLink(
                    label: 'Skip for now',
                    onPressed: _busy ? null : widget.onDone,
                  ),
                ),
                const SizedBox(height: 8),
                const Icon(Icons.eco_outlined,
                    size: 44, color: FieldPalette.forestDeep),
                const SizedBox(height: 14),
                Text(_createMode ? 'Start your roster' : 'Welcome back',
                    style: FieldType.title()),
                const SizedBox(height: 8),
                Text(
                  'An account syncs your favourites and notes across devices. It is optional — the guide works fully offline.',
                  style: FieldType.body(),
                ),
                const SizedBox(height: 24),
                FieldCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.mail_outline_rounded),
                          ),
                          validator: (v) {
                            final t = (v ?? '').trim();
                            if (t.isEmpty || !t.contains('@')) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14),
                        TextFormField(
                          controller: _pass,
                          obscureText: true,
                          autofillHints: const [AutofillHints.password],
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                          ),
                          validator: (v) {
                            if ((v ?? '').length < 6) {
                              return 'At least 6 characters';
                            }
                            return null;
                          },
                        ),
                        if (!_createMode) ...[
                          Align(
                            alignment: Alignment.centerRight,
                            child: QuietLink(
                              label: 'Forgot password?',
                              onPressed: _busy ? null : _forgotPassword,
                            ),
                          ),
                        ],
                        const SizedBox(height: 8),
                        SproutButton(
                          label: _createMode ? 'Create account' : 'Sign in',
                          busy: _busy,
                          onPressed: _busy ? null : _submit,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _busy
                      ? null
                      : () => setState(() => _createMode = !_createMode),
                  child: Text(
                    _createMode
                        ? 'I already have an account'
                        : 'New here? Create an account',
                    style: FieldType.label(color: FieldPalette.forestDeep),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
