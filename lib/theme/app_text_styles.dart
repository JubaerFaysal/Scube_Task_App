import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle title = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle cardTitle = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle small = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle status = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
}
