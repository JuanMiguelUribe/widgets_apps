import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores Inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

// Un objeto de tipo AppThe,e (
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //State = estado = nueva instancia del AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
