import 'package:flutter/material.dart';

class WeatherScreenTemperature extends StatelessWidget {
  const WeatherScreenTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    final labelLarge = Theme.of(context).textTheme.labelLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            '** ℃',
            textAlign: TextAlign.center,
            style: labelLarge?.copyWith(
              color: Colors.blue,
            ), // TextStyle(color: Colors.blue),
          ),
        ),
        Expanded(
          child: Text(
            '** ℃',
            textAlign: TextAlign.center,
            style: labelLarge?.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
