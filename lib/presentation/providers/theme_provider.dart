import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores Inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);
