import 'dart:convert';

import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/model/weather_info.dart';

class WeatherRepository {
  final _api = WeatherAPI();

  WeatherInfo getWeatherInfo({String area = 'tokyo', DateTime? dateTime}) {
    final json = _api.fetchWeatherInfo(area: area, dateTime: dateTime);

    final weatherInfo = jsonDecode(json) as Map<String, dynamic>;

    return WeatherInfo.fromJson(weatherInfo);
  }
}
