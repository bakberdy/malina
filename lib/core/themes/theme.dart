import 'package:flutter/material.dart';
import 'package:malina/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.bgColor,
    bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.bottomNavigationBarColor
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.whiteTextColor,
      error: Colors.red,
      onError: AppColors.whiteTextColor,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.inactiveIcon,
    ),
  );
}
