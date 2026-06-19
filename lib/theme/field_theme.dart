import 'package:flutter/material.dart';
import 'field_palette.dart';
import 'field_type.dart';

class FieldTheme {
  static ThemeData build() {
    final scheme = ColorScheme.fromSeed(
      seedColor: FieldPalette.forest,
      primary: FieldPalette.forestDeep,
      secondary: FieldPalette.clay,
      surface: FieldPalette.card,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: FieldPalette.paper,
      splashFactory: InkRipple.splashFactory,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        foregroundColor: FieldPalette.bark,
      ),
      cardTheme: CardThemeData(
        color: FieldPalette.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: FieldPalette.hairline,
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: FieldPalette.card,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: FieldType.body(color: FieldPalette.barkFaint),
        border: _inputBorder(FieldPalette.hairline),
        enabledBorder: _inputBorder(FieldPalette.hairline),
        focusedBorder: _inputBorder(FieldPalette.forest),
        errorBorder: _inputBorder(FieldPalette.tender),
        focusedErrorBorder: _inputBorder(FieldPalette.tender),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: FieldPalette.bark,
        contentTextStyle: FieldType.bodyStrong(color: Colors.white),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color c) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: c, width: 1.4),
      );
}
