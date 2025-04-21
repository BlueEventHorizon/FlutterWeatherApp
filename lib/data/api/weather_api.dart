import 'dart:convert';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherAPI {
  final yumemiWeather = YumemiWeather();

  String fetchWeatherInfo({String area = 'tokyo', DateTime? dateTime}) {
    final dateTimeLocal = dateTime ?? DateTime.now();

    final request = jsonEncode(toJson((area: area, dateTime: dateTimeLocal)));

    try {
      return yumemiWeather.fetchWeather(request);
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
