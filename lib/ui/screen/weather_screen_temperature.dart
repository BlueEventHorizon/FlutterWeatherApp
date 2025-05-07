import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/ui/provider/weather_info_notifier_provider.dart';

class WeatherScreenTemperature extends ConsumerWidget {
  const WeatherScreenTemperature({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxTemperature = ref.watch(
      weatherInfoNotifierProvider
          .select((weatherInfo) => weatherInfo?.maxTemperature),
    );
    final minTemperature = ref.watch(
      weatherInfoNotifierProvider
          .select((weatherInfo) => weatherInfo?.minTemperature),
    );

    final labelLarge = Theme.of(context).textTheme.labelLarge;

    return Row(
      children: [
        Expanded(
          child: Text(
            minTemperature == null ? '** ℃' : '$minTemperature ℃',
            textAlign: TextAlign.center,
            style: labelLarge?.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
        Expanded(
          child: Text(
            maxTemperature == null ? '** ℃' : '$maxTemperature ℃',
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
