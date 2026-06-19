import 'package:flutter/material.dart';
import '../theme/field_palette.dart';
import '../theme/field_type.dart';

class BreedPortrait extends StatelessWidget {
  final String label;
  final Color accent;
  final double size;

  const BreedPortrait({
    super.key,
    required this.label,
    required this.accent,
    this.size = 56,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            Color.alphaBlend(accent.withValues(alpha: 0.18), FieldPalette.card),
            Color.alphaBlend(accent.withValues(alpha: 0.34), FieldPalette.card),
          ],
        ),
        border: Border.all(color: accent.withValues(alpha: 0.55), width: 2),
      ),
      alignment: Alignment.center,
      child: CustomPaint(
        size: Size(size, size),
        painter: _HenPainter(accent),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: size * 0.46),
            child: Text(
              label,
              style: FieldType.label(color: accent).copyWith(
                fontSize: size * 0.17,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HenPainter extends CustomPainter {
  final Color color;
  _HenPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()
      ..color = color.withValues(alpha: 0.85)
      ..style = PaintingStyle.fill;

    final body = Path();
    body.moveTo(w * 0.30, h * 0.42);
    body.cubicTo(w * 0.18, h * 0.30, w * 0.30, h * 0.16, w * 0.46, h * 0.20);
    body.cubicTo(w * 0.52, h * 0.10, w * 0.62, h * 0.12, w * 0.60, h * 0.22);
    body.cubicTo(w * 0.74, h * 0.22, w * 0.82, h * 0.34, w * 0.72, h * 0.44);
    body.cubicTo(w * 0.66, h * 0.40, w * 0.42, h * 0.40, w * 0.30, h * 0.42);
    body.close();
    canvas.drawPath(body, paint);

    final comb = Paint()..color = color;
    canvas.drawCircle(Offset(w * 0.52, h * 0.13), w * 0.03, comb);
    canvas.drawCircle(Offset(w * 0.58, h * 0.12), w * 0.03, comb);
  }

  @override
  bool shouldRepaint(covariant _HenPainter old) => old.color != color;
}
