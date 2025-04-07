enum WeatherCondition {
  sunny,
  cloudy,
  rainy;

  factory WeatherCondition.fromString(String conditionString) {
    switch (conditionString) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'rainy':
        return WeatherCondition.rainy;
      default:
        throw Exception('bad weather condition name $conditionString');
    }
  }
}

class WeatherInfo {
  const WeatherInfo({
    required this.maxTemperature,
    required this.minTemperature,
    required this.condition,
  });

  final WeatherCondition condition;
  final int maxTemperature;
  final int minTemperature;
}
