import 'package:flutter/material.dart';

/// Central palette pulled from the HEIMDALL Figma frames.
/// Keep every hardcoded color in the app referencing this file so the
/// theme can be retuned from one place once real assets land.
class AppColors {
  AppColors._();

  static const Color background = Color(0xFF161616);
  static const Color cardBackground = Color(0xFF242424);
  static const Color cardBackgroundAlt = Color(0xFF2B2B2B);
  static const Color panelBackground = Color(0xFF1E1E1E);

  static const Color inputFill = Color(0xFFE9E9E9);
  static const Color inputHint = Color(0xFF8A8A8A);

  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFB9B9B9);
  static const Color textMuted = Color(0xFF7C7C7C);

  static const Color barTrack = Color(0xFF4A4A4A);
  static const Color barFill = Color(0xFFE07B2C);

  static const Color statusOk = Color(0xFF3DDC5B);
  static const Color statusWarn = Color(0xFFF5C542);
  static const Color statusAlert = Color(0xFFFF5C5C);

  static const Color placeholderBox = Color(0xFFD9D9D9);

  static const Color mapWaterDeep = Color(0xFF0E2A33);
  static const Color mapIce = Color(0xFF2C6E72);
}