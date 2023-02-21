import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../core/constants/themes/colors.dart';

class Styles {
  static TextStyle smallFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 13.5.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.normal,
        height: height ?? 1.24,
      );

  static TextStyle normalFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 15.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.normal,
        height: height ?? 1.24,
      );

        static TextStyle mediumFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 16.5.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.normal,
        height: height ?? 1.24,
      );

  static TextStyle largeFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 18.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.normal,
        height: height ?? 1.24,
      );
      static TextStyle largeWhiteFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 21.5.sp,
        color: color ?? AppColors.white,
        fontWeight: FontWeight.normal,
        height: height ?? 1.24,
      );

  static TextStyle smallBoldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 13.5.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.bold,
        height: height ?? 1.24,
      );

  static TextStyle normalBoldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 15.sp,
        color: color ?? AppColors.black.withOpacity(0.65),
        fontWeight: FontWeight.w600,
        height: height ?? 1.24,
      );

  static TextStyle normalWhiteBoldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        letterSpacing: 0.7,
        fontSize: fontSize ?? 16.sp,
        color: color ?? AppColors.white,
        fontWeight: FontWeight.w600,
        height: height ?? 1.24,
      );    

  static TextStyle largeBoldFontStyle(
          {double? fontSize, Color? color, double? height}) =>
      GoogleFonts.tinos(
        fontSize: fontSize ?? 19.sp,
        letterSpacing: .5.w,
        color: color ?? AppColors.themeColor,
        fontWeight: FontWeight.w900,
        height: height ?? 1.24,
        
      );
}
