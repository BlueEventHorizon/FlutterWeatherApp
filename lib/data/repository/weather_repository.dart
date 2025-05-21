import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repository.g.dart';

@riverpod
WeatherRepository weatherRepository(Ref ref) {
  final weatherAPI = ref.watch(weatherAPIProvider);
  return WeatherRepository(weatherAPI: weatherAPI);
}

class WeatherRepository {
  WeatherRepository({
    required WeatherAPI weatherAPI,
  }) : _weatherAPI = weatherAPI;

  final WeatherAPI _weatherAPI;

  Future<WeatherInfo> getWeatherInfo(
      {String area = 'tokyo', DateTime? dateTime}) async {
    final json =
        await _weatherAPI.fetchWeatherInfo(area: area, dateTime: dateTime);

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    try {
      return WeatherInfo.fromJson(weatherInfo);
    } on CheckedFromJsonException catch (_) {
      throw const JsonFormatError();
    }
  }
}
