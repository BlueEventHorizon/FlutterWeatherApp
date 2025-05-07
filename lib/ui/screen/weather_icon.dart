import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/ui/provider/weather_info_notifier_provider.dart';

class WeatherIcon extends ConsumerWidget {
  const WeatherIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherCondition = ref.watch(
      weatherInfoNotifierProvider
          .select((weatherInfo) => weatherInfo?.weatherCondition),
    );

    return AspectRatio(
      aspectRatio: 1,
      child: weatherCondition == null
          ? const Placeholder()
          : SvgPicture.asset('assets/${weatherCondition.name}.svg'),
    );
  }
}
