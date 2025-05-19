import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/api/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

part 'weather_api.g.dart';

@riverpod
WeatherAPI weatherAPI(Ref ref) {
  final yumemiWeather = ref.watch(yumemiWeatherProvider);
  return WeatherAPI(yumemiWeather: yumemiWeather);
}

class WeatherAPI {
  WeatherAPI({
    required YumemiWeather yumemiWeather,
  }) : _yumemiWeather = yumemiWeather;

  final YumemiWeather _yumemiWeather;

  Future<String> fetchWeatherInfo({
    String area = 'tokyo',
    DateTime? dateTime,
  }) async {
    final dateTimeLocal = dateTime ?? DateTime.now();

    final request = jsonEncode(toJson((area: area, dateTime: dateTimeLocal)));

    try {
      return await compute(_yumemiWeather.syncFetchWeather, request);
    } on YumemiWeatherError catch (error) {
      switch (error) {
        case YumemiWeatherError.invalidParameter:
          throw const InvalidParameter();
        case YumemiWeatherError.unknown:
          throw const Unknown();
      }
    }
  }

  Map<String, String> toJson(({String area, DateTime dateTime}) value) {
    return {
      'area': value.area,
      'date': value.dateTime.toString(),
    };
  }
}
