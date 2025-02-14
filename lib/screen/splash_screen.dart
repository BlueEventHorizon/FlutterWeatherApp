import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_training/screen/weather_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await SchedulerBinding.instance.endOfFrame;
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return const WeatherScreen();
          },
        ),
      );
      unawaited(_navigateToNextScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
