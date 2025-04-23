import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:flutter_training/screen/weather_icon.dart';
import 'package:flutter_training/screen/weather_screen_buttons.dart';
import 'package:flutter_training/screen/weather_screen_temperature.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _repository = WeatherRepository();
  WeatherInfo? _weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherIcon(condition: _weatherInfo?.weatherCondition),
              const SizedBox(height: 16),
              WeatherScreenTemperature(
                maxTemperature: _weatherInfo?.maxTemperature,
                minTemperature: _weatherInfo?.minTemperature,
              ),
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
                            _weatherInfo = _repository.getWeatherInfo();
                          });
                        } on AppException catch (error) {
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
