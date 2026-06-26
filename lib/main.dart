import 'package:flutter/material.dart';
import 'package:codealpha_fitness_tracker/core/theme/app_theme.dart';
import 'package:codealpha_fitness_tracker/screens/splash/splash_screen.dart';

void main() {
  runApp(const FitPulseApp());
}

class FitPulseApp extends StatelessWidget {
  const FitPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FitPulse",
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}