import 'package:flutter/material.dart';
import 'field_palette.dart';

class FieldType {
  static TextStyle _t(
    FontWeight weight,
    double size, {
    double? height,
    double? spacing,
    Color? color,
  }) {
    return TextStyle(
      fontWeight: weight,
      fontSize: size,
      height: height,
      letterSpacing: spacing,
      color: color ?? FieldPalette.bark,
    );
  }

  static TextStyle display({Color? color}) =>
      _t(FontWeight.w700, 28, height: 1.12, spacing: -0.2, color: color);
  static TextStyle title({Color? color}) =>
      _t(FontWeight.w700, 21, height: 1.18, spacing: -0.1, color: color);
  static TextStyle heading({Color? color}) =>
      _t(FontWeight.w700, 16.5, height: 1.22, color: color);
  static TextStyle body({Color? color}) =>
      _t(FontWeight.w400, 15, height: 1.46, color: color ?? FieldPalette.barkSoft);
  static TextStyle bodyStrong({Color? color}) =>
      _t(FontWeight.w600, 15, height: 1.46, color: color);
  static TextStyle label({Color? color}) =>
      _t(FontWeight.w700, 12.5, spacing: 0.6, color: color);
  static TextStyle caption({Color? color}) =>
      _t(FontWeight.w600, 12, spacing: 0.2, color: color ?? FieldPalette.barkFaint);
  static TextStyle numeral(double size, {Color? color, FontWeight? weight}) =>
      TextStyle(
        fontFeatures: const [FontFeature.tabularFigures()],
        fontWeight: weight ?? FontWeight.w700,
        fontSize: size,
        height: 1.0,
        letterSpacing: 0.2,
        color: color ?? FieldPalette.bark,
      );
}
