import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherAPI {
  final yumemiWeather = YumemiWeather();

  String fetchWeatherCondition() {
    try {
      return yumemiWeather.fetchWeather('tokyo');
    } on YumemiWeatherError catch (error) {
      switch (error) {
        case YumemiWeatherError.invalidParameter:
          throw const InvalidParameter();
        case YumemiWeatherError.unknown:
          throw const Unknown();
      }
    }
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
