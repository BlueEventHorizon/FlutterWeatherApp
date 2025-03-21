import 'dart:convert';
import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherAPI {
  final yumemiWeather = YumemiWeather();

  String fetchWeatherCondition({String area = 'tokyo', DateTime? dateTime}) {
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

sealed class WeatherAPIError implements Exception {
  const WeatherAPIError({required this.message});
  final String message;
}

class InvalidParameter extends WeatherAPIError {
  const InvalidParameter() : super(message: '無効な都道府県が指定されました');
}

class Unknown extends WeatherAPIError {
  const Unknown() : super(message: '天気情報が取得できません');
}
