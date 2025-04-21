import 'dart:convert';

import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:json_annotation/json_annotation.dart';

class WeatherRepository {
  final _api = WeatherAPI();

  WeatherInfo getWeatherInfo({String area = 'tokyo', DateTime? dateTime}) {
    final json = _api.fetchWeatherInfo(area: area, dateTime: dateTime);

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    try {
      return WeatherInfo.fromJson(weatherInfo);
    } on CheckedFromJsonException catch (_) {
      throw const JsonFormatError();
    }
  }
}
