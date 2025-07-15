import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryLight,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textLight),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false, // <-- Aquí centramos el título
      elevation: 0, // Color del texto/íconos
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.primaryDark,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.textDark),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false, // <-- También aquí
      elevation: 0,
    ),
  );
}
