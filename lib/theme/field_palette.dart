import 'package:flutter/material.dart';

class FieldPalette {
  static const Color paper = Color(0xFFF6F1E4);
  static const Color paperDeep = Color(0xFFEBE3D1);
  static const Color hairline = Color(0xFFDCD2BB);
  static const Color card = Color(0xFFFFFCF4);

  static const Color bark = Color(0xFF22311F);
  static const Color barkSoft = Color(0xFF4E5C45);
  static const Color barkFaint = Color(0xFF8C937C);

  static const Color forest = Color(0xFF3F7D4E);
  static const Color forestDeep = Color(0xFF2A5C38);
  static const Color forestWash = Color(0xFFDFEBD9);

  static const Color clay = Color(0xFFC8703B);
  static const Color clayDeep = Color(0xFFA85522);
  static const Color clayWash = Color(0xFFF6E2CF);

  static const Color wheat = Color(0xFFD9A441);
  static const Color wheatWash = Color(0xFFF6E8C8);

  static const Color robust = Color(0xFF4F8A5B);
  static const Color watchful = Color(0xFFC9962F);
  static const Color tender = Color(0xFFCB5B45);

  static const List<Color> accentRing = [
    Color(0xFF3F7D4E),
    Color(0xFFC8703B),
    Color(0xFF6E8FB8),
    Color(0xFFB2772C),
    Color(0xFF8A6FB0),
    Color(0xFF4E9C8E),
    Color(0xFFB5564E),
    Color(0xFF7B8B3E),
  ];

  static Color accentFor(String seed) =>
      accentRing[seed.hashCode.abs() % accentRing.length];

  static const LinearGradient meadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFE6EAD3), Color(0xFFF7F2E6)],
  );
}
