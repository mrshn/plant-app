import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static String appFont = 'Georgia';

  static ThemeData appTheme = ThemeData(
    primarySwatch: Colors.blue,

    // Define the default font family.
    fontFamily: appFont,

    textTheme: _appTextTheme,
  );

  static const _appTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    displayMedium: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: AppColors.normalTextColor,
    ),
  );
}
