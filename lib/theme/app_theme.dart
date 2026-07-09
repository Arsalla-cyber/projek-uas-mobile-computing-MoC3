// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppColors {
  AppColors._();

  static const background = Color(0xFF0A0A0B);
  static const surface = Color(0xFF131314);
  static const surfaceContainer = Color(0xFF1F1F23);
  static const surfaceContainerHigh = Color(0xFF2A2A2B);
  static const surfaceContainerLowest = Color(0xFF0E0E0F);

  static const onSurface = Color(0xFFE5E2E3);
  static const onSurfaceVariant = Color(0xFFE9BCB6);

  static const primary = Color(0xFFE50914);
  static const onPrimary = Color(0xFFFFF7F6);
  static const gold = Color(0xFFE9C400);

  static const borderSubtle = Color(0x1AFFFFFF);
}

/// Skala tipografi aplikasi.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle displayLg = GoogleFonts.bebasNeue(
    fontSize: 44,
    height: 1.1,
    letterSpacing: 1,
    color: AppColors.onSurface,
  );

  static TextStyle headlineLg = GoogleFonts.bebasNeue(
    fontSize: 32,
    height: 1.2,
    letterSpacing: 0.5,
    color: AppColors.onSurface,
  );

  static TextStyle titleMd = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: AppColors.onSurface,
  );

  static TextStyle bodyLg = GoogleFonts.inter(
    fontSize: 16,
    height: 1.5,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle bodySm = GoogleFonts.inter(
    fontSize: 13,
    height: 1.4,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelCaps = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: AppColors.onSurface,
  );
}

/// Konstanta jarak (spacing).
class AppSpacing {
  AppSpacing._();
  static const unit = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 32.0;
  static const containerPadding = 20.0;
}

/// Konstanta radius sudut.
class AppRadius {
  AppRadius._();
  static const sm = 4.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const full = 999.0;
}
