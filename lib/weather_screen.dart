import 'package:flutter/material.dart';
import 'package:flutter_training/weather_screen_buttons.dart';
import 'package:flutter_training/weather_screen_temperature.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              Spacer(),
              AspectRatio(
                aspectRatio: 1,
                child: Placeholder(),
              ),
              SizedBox(height: 16),
              WeatherScreenTemperature(),
              SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    WeatherScreenButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
