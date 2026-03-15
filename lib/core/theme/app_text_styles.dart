import 'package:easy_order/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.roboto(
    color: AppColors.primaryText,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    letterSpacing: 0.2,
  );

  static final TextStyle subtitle = GoogleFonts.roboto(
    color: AppColors.primaryText,
    fontSize: 14,
    letterSpacing: 0.2,
  );

  static final fieldLabel = GoogleFonts.getFont(
    'Nunito Sans',
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );

  static final inputLabel = GoogleFonts.getFont(
    'Nunito Sans',
    color: Color(0xFF7F909F),
    fontSize: 14,
    letterSpacing: 0.1,
    height: 1.7,
  );
}
