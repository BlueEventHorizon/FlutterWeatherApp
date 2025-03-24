import 'dart:convert';

import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/model/weather_info.dart';

class WeatherRepository {
  final _api = WeatherAPI();

  WeatherInfo getWeatherInfo() {
    final json = _api.fetchWeatherInfo();

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    return WeatherInfo.fromJson(weatherInfo);
  }
}
