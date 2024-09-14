import 'package:flutter/material.dart';
import 'package:music_player/core/config/theme/app_theme.dart';
import 'package:music_player/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
