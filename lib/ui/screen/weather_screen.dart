import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/ui/provider/weather_info_notifier_provider.dart';
import 'package:flutter_training/ui/screen/weather_icon.dart';
import 'package:flutter_training/ui/screen/weather_screen_buttons.dart';
import 'package:flutter_training/ui/screen/weather_screen_temperature.dart';
import 'package:flutter_training/ui/utils/async_task_indicator.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.5,
          child: Column(
            children: [
              const Spacer(),
              const WeatherIcon(),
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
                      reload: () async {
                        try {
                          await performTaskWithLoadingIndicator(
                            context: context,
                            task: () => ref
                                .read(weatherInfoNotifierProvider.notifier)
                                .fetch(),
                          );
                        } on AppException catch (error) {
                          if (context.mounted) {
                            unawaited(_showErrorDialog(context, error.message));
                          }
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
