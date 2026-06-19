import 'package:flutter/material.dart';

import 'domain/roster_repository.dart';
import 'screens/boot_gate_screen.dart';
import 'state/roster_scope.dart';
import 'theme/field_theme.dart';

class BreedGuideApp extends StatelessWidget {
  final RosterRepository roster;
  const BreedGuideApp({super.key, required this.roster});

  @override
  Widget build(BuildContext context) {
    return RosterScope(
      roster: roster,
      child: MaterialApp(
        title: 'Chicken Breed Guide',
        debugShowCheckedModeBanner: false,
        theme: FieldTheme.build(),
        home: const BootGateScreen(),
      ),
    );
  }
}
