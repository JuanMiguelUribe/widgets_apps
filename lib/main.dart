import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_app/config/theme/theme_notifier.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const HomeScreen(),
    );
  }
}
