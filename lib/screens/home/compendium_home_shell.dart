import 'package:flutter/material.dart';

import '../../runtime/backend_link.dart';
import '../../runtime/signal_relay.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../access/flock_access_screen.dart';
import 'breed_roster_view.dart';
import 'compare_bench_view.dart';
import 'match_quiz_view.dart';
import 'saved_roster_view.dart';

class CompendiumHomeShell extends StatefulWidget {
  const CompendiumHomeShell({super.key});

  @override
  State<CompendiumHomeShell> createState() => _CompendiumHomeShellState();
}

class _CompendiumHomeShellState extends State<CompendiumHomeShell> {
  int _tab = 0;

  static const _titles = [
    'Breed catalog',
    'Find your breed',
    'Compare breeds',
    'Saved & notes',
  ];

  void _openAccount() {
    final signedIn = BackendLink.signedIn;
    showModalBottomSheet(
      context: context,
      backgroundColor: FieldPalette.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetCtx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account', style: FieldType.heading()),
                const SizedBox(height: 6),
                Text(
                  signedIn
                      ? (BackendLink.currentUser?.email ?? 'Signed in')
                      : 'You are browsing as a guest.',
                  style: FieldType.body(),
                ),
                const SizedBox(height: 16),
                if (signedIn)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.logout_rounded,
                        color: FieldPalette.clayDeep),
                    title: Text('Sign out',
                        style: FieldType.bodyStrong(
                            color: FieldPalette.clayDeep)),
                    onTap: () async {
                      await SignalRelay.unbindUser();
                      await BackendLink.signOut();
                      if (sheetCtx.mounted) Navigator.pop(sheetCtx);
                      if (mounted) setState(() {});
                    },
                  )
                else
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.login_rounded,
                        color: FieldPalette.forestDeep),
                    title: Text('Sign in or create account',
                        style: FieldType.bodyStrong(
                            color: FieldPalette.forestDeep)),
                    onTap: () {
                      Navigator.pop(sheetCtx);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => FlockAccessScreen(
                            onDone: () {
                              Navigator.of(context).maybePop();
                              if (mounted) setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;
    switch (_tab) {
      case 0:
        body = const BreedRosterView();
        break;
      case 1:
        body = const MatchQuizView();
        break;
      case 2:
        body = const CompareBenchView();
        break;
      case 3:
        body = const SavedRosterView();
        break;
      default:
        body = const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: FieldPalette.paper,
      appBar: AppBar(
        titleSpacing: 20,
        title: Text(_titles[_tab], style: FieldType.title()),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline_rounded),
            color: FieldPalette.bark,
            onPressed: _openAccount,
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: body,
      bottomNavigationBar: _BottomBar(
        index: _tab,
        onChanged: (i) => setState(() => _tab = i),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;
  const _BottomBar({required this.index, required this.onChanged});

  static const _items = [
    (Icons.grid_view_rounded, 'Catalog'),
    (Icons.tune_rounded, 'Match'),
    (Icons.insights_rounded, 'Compare'),
    (Icons.bookmark_border_rounded, 'Saved'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: FieldPalette.card,
        border: Border(top: BorderSide(color: FieldPalette.hairline)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: List.generate(_items.length, (i) {
              final selected = i == index;
              final item = _items[i];
              return Expanded(
                child: InkResponse(
                  onTap: () => onChanged(i),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.$1,
                        size: 23,
                        color: selected
                            ? FieldPalette.forestDeep
                            : FieldPalette.barkFaint,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.$2,
                        style: FieldType.caption(
                          color: selected
                              ? FieldPalette.forestDeep
                              : FieldPalette.barkFaint,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
