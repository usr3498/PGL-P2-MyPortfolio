import 'package:flutter/material.dart';
import 'package:ud2_t2_usr3498_navegacion/shared/styles/app_drawer_dark.dart';

class AuthFormStyles {
  AuthFormStyles._();

  static const Color accent = AppDrawerDark.background;
  static const Color onAccent = Color.fromRGBO(4, 31, 28, 1);
  static const Color textColor = Color.fromRGBO(255, 255, 255, 1);

  static OutlineInputBorder _border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color, width: width),
      );

  static InputDecoration inputDecoration({
    required String label,
    required IconData icon,
    String? helperText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      helperText: helperText,
      helperMaxLines: 2,
      labelStyle: const TextStyle(color: textColor),
      helperStyle: const TextStyle(color: Color.fromRGBO(154, 155, 154, 0.965)),
      prefixIcon: Icon(icon, color: accent),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: const Color.fromRGBO(255, 255, 255, 0.06),
      enabledBorder: _border(accent),
      focusedBorder: _border(accent, 2),
      errorBorder: _border(Colors.redAccent),
      focusedErrorBorder: _border(Colors.redAccent, 2),
    );
  }

  static final ButtonStyle primaryButton = FilledButton.styleFrom(
    backgroundColor: accent,
    foregroundColor: onAccent,
    minimumSize: const Size.fromHeight(48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  static final ButtonStyle secondaryButton = OutlinedButton.styleFrom(
    foregroundColor: accent,
    side: const BorderSide(color: accent),
    minimumSize: const Size.fromHeight(48),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    textStyle: const TextStyle(fontSize: 16),
  );
}