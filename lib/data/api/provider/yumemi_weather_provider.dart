import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'yumemi_weather_provider.g.dart';

@riverpod
YumemiWeather yumemiWeather(Ref ref) {
  return YumemiWeather();
}
