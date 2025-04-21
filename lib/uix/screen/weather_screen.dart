import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/ui/provider/weather_info_notifier_provider.dart';
import 'package:flutter_training/ui/screen/weather_icon.dart';
import 'package:flutter_training/ui/screen/weather_screen_buttons.dart';
import 'package:flutter_training/ui/screen/weather_screen_temperature.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherInfo = ref.watch(weatherInfoNotifierProvider);

    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              WeatherIcon(condition: weatherInfo?.weatherCondition),
              const SizedBox(height: 16),
              WeatherScreenTemperature(
                maxTemperature: weatherInfo?.maxTemperature,
                minTemperature: weatherInfo?.minTemperature,
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
                          ref
                              .read(weatherInfoNo≥tifierProvider.notifier)
                              .fetch();
                        } on WeatherAP≥IError catch (error) {
                          unawaited(_showErrorDialog(context, error.message));
                        } on WeatherRepositoryError catch (error) {
                          unawaited(_showErrorDialog(context, error.message));
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

  Future<void> _showErrorDialog(BuildContext context, String message) async {
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
