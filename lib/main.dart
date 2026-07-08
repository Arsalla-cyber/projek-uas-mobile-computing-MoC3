import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CineGoApp());
}

class CineGoApp extends StatelessWidget {
  const CineGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineGo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
