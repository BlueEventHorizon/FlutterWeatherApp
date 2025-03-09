import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/data/weather_api.dart';
import 'package:flutter_training/screen/weather_icon.dart';
import 'package:flutter_training/screen/weather_screen_buttons.dart';
import 'package:flutter_training/screen/weather_screen_temperature.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _api = WeatherAPI();
  String? _weatherCondition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherIcon(condition: _weatherCondition),
              const SizedBox(height: 16),
              const WeatherScreenTemperature(),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    WeatherScreenButtons(
                      close: () {
                        Navigator.pop(context);
                      },
                      reload: () {
                        try {
                          setState(() {
                            _weatherCondition = _api.fetchWeatherCondition();
                          });
                        } on WeatherAPIError catch (error) {
                          unawaited(_showErrorDialog(error.message));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showErrorDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
