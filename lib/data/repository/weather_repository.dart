import 'dart:convert';

import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/model/weather_info.dart';

class WeatherRepository {
  final _api = WeatherAPI();

  WeatherInfo getWeatherInfo() {
    final json = _api.fetchWeatherInfo();

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    final condition = weatherInfo['weather_condition'].toString();
    final maxTemperature = int.parse(
      weatherInfo['max_temperature'].toString(),
    );
    final minTemperature = int.parse(
      weatherInfo['min_temperature'].toString(),
    );

    return WeatherInfo(
      condition: WeatherCondition.fromString(condition),
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
    );
  }
}
