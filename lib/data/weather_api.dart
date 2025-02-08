import 'package:yumemi_weather/yumemi_weather.dart';

class WeatherAPI {
  final yumemiWeather = YumemiWeather();

  String fetchWeatherCondition() {
    return yumemiWeather.fetchSimpleWeather();
  }
}
