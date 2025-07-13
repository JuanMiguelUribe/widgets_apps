import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false, // <-- Aquí centramos el título
      elevation: 0,
      backgroundColor: AppColors.primaryLight,
      foregroundColor: AppColors.textLight, // Color del texto/íconos
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false, // <-- También aquí
      elevation: 0,
      backgroundColor: AppColors.primaryDark,
      foregroundColor: AppColors.textDark,
    ),
  );
}
