import 'dart:async';
import 'dart:ffi';
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

    unawaited(_navigateToWeatherScreen());
  }

  Future<void> _navigateToWeatherScreen() async {
    await SchedulerBinding.instance.endOfFrame;
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
      unawaited(_navigateToWeatherScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
    );
  }
}
