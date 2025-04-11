import 'package:flutter/material.dart';
import 'package:flutter_training/UI/screen/mixin/after_layout_mixin.dart';
import 'package:flutter_training/UI/screen/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }

  @override
  Future<void> actionAfterLayout() async {
    await _navigateToWeatherScreen();
  }

  Future<void> _navigateToWeatherScreen() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) {
            return const WeatherScreen();
          },
        ),
      );

      await _navigateToWeatherScreen();
    }
  }
}
