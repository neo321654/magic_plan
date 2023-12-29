import 'package:flutter/material.dart';
import 'package:magic_plan/resources/resources.dart';

abstract class AppTextStyles {
  static TextStyle bodyBold = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 17.toFigma,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subheadline = TextStyle(
    color: AppColors.primaryButtons,
    fontSize: 15.toFigma,
    fontWeight: FontWeight.w500,
  );
  static TextStyle t3Bold = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 20.toFigma,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.8,
  );
  static TextStyle calloutBlue = TextStyle(
    color: AppColors.accentsPrimary,
    fontSize: 16.toFigma,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.8,
  );
  static TextStyle callout = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 16.toFigma,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.02,
  );
  static TextStyle foontoneBold = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 13.toFigma,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.8,
  );
  static TextStyle caption1 = TextStyle(
    color: AppColors.primaryButtons,
    fontSize: 12.toFigma,
    fontWeight: FontWeight.w500,
    // letterSpacing: -0.8,
  );
  static TextStyle caption2bold = TextStyle(
    color: AppColors.primaryButtons,
    fontSize: 11.toFigma,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.6,
  );
  static TextStyle proDisplay = TextStyle(
    color: AppColors.primaryTexts,
    fontSize: 28.toFigma,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.6,
  );
}

abstract class AppBoxDecorations {
  static BoxDecoration editTextDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(13),
    color: AppColors.primaryMainBackground,
  );
}
