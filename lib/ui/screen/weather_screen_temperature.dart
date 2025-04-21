import 'package:flutter/material.dart';

class WeatherScreenTemperature extends StatelessWidget {
  const WeatherScreenTemperature({
    required int? maxTemperature,
    required int? minTemperature,
    super.key,
  })  : _maxTemperature = maxTemperature,
        _minTemperature = minTemperature;

  final int? _maxTemperature;
  final int? _minTemperature;

  @override
  Widget build(BuildContext context) {
    final labelLarge = Theme.of(context).textTheme.labelLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            _minTemperature == null ? '** ℃' : '$_minTemperature ℃',
            textAlign: TextAlign.center,
            style: labelLarge?.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
        Expanded(
          child: Text(
            _maxTemperature == null ? '** ℃' : '$_maxTemperature ℃',
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
