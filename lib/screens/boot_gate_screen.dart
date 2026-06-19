import 'package:flutter/material.dart';

import '../runtime/gate_router.dart';
import '../runtime/trace_beacon.dart';
import '../theme/field_palette.dart';
import '../theme/field_type.dart';
import '../widgets/breed_portrait.dart';
import 'bad_connection_screen.dart';
import 'content/breed_compendium_view.dart';
import 'native_root.dart';

class BootGateScreen extends StatefulWidget {
  const BootGateScreen({super.key});

  @override
  State<BootGateScreen> createState() => _BootGateScreenState();
}

class _BootGateScreenState extends State<BootGateScreen>
    with SingleTickerProviderStateMixin {
  late Future<GateResult> _future;
  late final AnimationController _pulse;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
    _future = CompendiumGate.resolve();
  }

  void _retry() {
    setState(() {
      _future = CompendiumGate.resolve();
    });
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GateResult>(
      future: _future,
      builder: (context, snap) {
        if (snap.connectionState != ConnectionState.done) {
          return _splash();
        }
        final result = snap.data ?? const GateResult(GateOutcome.native);
        switch (result.outcome) {
          case GateOutcome.badConnection:
            return BadConnectionScreen(onRetry: _retry);
          case GateOutcome.compendium:
            TraceBeacon.contentOpen();
            return BreedCompendiumView(endpoint: result.endpoint!);
          case GateOutcome.native:
            return const NativeRoot();
        }
      },
    );
  }

  Widget _splash() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: FieldPalette.meadowGradient),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: Tween<double>(begin: 0.94, end: 1.06).animate(
                  CurvedAnimation(parent: _pulse, curve: Curves.easeInOut),
                ),
                child: const BreedPortrait(
                  label: 'CB',
                  accent: FieldPalette.forest,
                  size: 104,
                ),
              ),
              const SizedBox(height: 26),
              Text('Leafing through the flock…',
                  style: FieldType.heading(color: FieldPalette.forestDeep)),
            ],
          ),
        ),
      ),
    );
  }
}
