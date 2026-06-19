import 'package:flutter/material.dart';
import '../theme/field_palette.dart';
import '../theme/field_type.dart';
import '../widgets/sprout_button.dart';

class BadConnectionScreen extends StatelessWidget {
  final VoidCallback onRetry;
  const BadConnectionScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: FieldPalette.meadowGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: const BoxDecoration(
                    color: FieldPalette.clayWash,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.cloud_off_rounded,
                      size: 38, color: FieldPalette.clayDeep),
                ),
                const SizedBox(height: 24),
                Text('No connection to the coop',
                    style: FieldType.title(), textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(
                  'We could not reach the guide right now. Check your network and try again.',
                  style: FieldType.body(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),
                SproutButton(
                  label: 'Try again',
                  icon: Icons.refresh_rounded,
                  expand: false,
                  onPressed: onRetry,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
