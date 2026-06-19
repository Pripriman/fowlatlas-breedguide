import 'package:flutter/material.dart';
import '../theme/field_type.dart';

class HardinessBadge extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;

  const HardinessBadge({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 5),
          ],
          Text(label, style: FieldType.label(color: color)),
        ],
      ),
    );
  }
}
