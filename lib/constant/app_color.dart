import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF3D3B8E);
  static const primaryLight = Color(0xFF6C63FF);
  static const background = Color(0xFFEEEEF8);
  static const secondaryText = Color(0xFF6A7282);
  static const mutedText = Color(0xFF99A1AF);
  static final primaryMuted = primary.withValues(alpha: 0.5);
  static const cardBackground = Colors.white;
  static final shadow = primary.withValues(alpha: 0.08);
  static final buttonShadow = primary.withValues(alpha: 0.3);
  static final inputBorder = primary.withValues(alpha: 0.19);
  static final dividerColor = primary.withValues(alpha: 0.07);
  static final iconBackground = primary.withValues(alpha: 0.1);
  static final badgeBackground = primaryLight.withValues(alpha: 0.082);
}
