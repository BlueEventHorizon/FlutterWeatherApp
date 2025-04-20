import 'dart:convert';

import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/model/weather_info.dart';
import 'package:json_annotation/json_annotation.dart';

class WeatherRepository {
  final _api = WeatherAPI();

  WeatherInfo getWeatherInfo({String area = 'tokyo', DateTime? dateTime}) {
    final json = _api.fetchWeatherInfo(area: area, dateTime: dateTime);

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    try {
      return WeatherInfo.fromJson(weatherInfo);
    } on CheckedFromJsonException catch (e) {
      throw JsonFormatError(message: 'JSONフォーマットエラー: ${e.message}');
    }
  }
}

sealed class WeatherRepositoryError implements Exception {
  const WeatherRepositoryError({required this.message});
  final String message;
}

class JsonFormatError extends WeatherRepositoryError {
  const JsonFormatError({required super.message});
}
