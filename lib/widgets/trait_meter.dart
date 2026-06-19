import 'package:flutter/material.dart';
import '../domain/breed_traits.dart';
import '../theme/field_palette.dart';
import '../theme/field_type.dart';

class TraitMeter extends StatelessWidget {
  final Trait trait;
  final int score;
  final Color accent;

  const TraitMeter({
    super.key,
    required this.trait,
    required this.score,
    this.accent = FieldPalette.forest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(trait.icon, size: 17, color: accent),
          const SizedBox(width: 10),
          SizedBox(
            width: 104,
            child: Text(trait.label, style: FieldType.bodyStrong()),
          ),
          Expanded(
            child: Row(
              children: List.generate(5, (i) {
                final filled = i < score;
                return Expanded(
                  child: Container(
                    height: 9,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: filled
                          ? accent
                          : FieldPalette.paperDeep,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
