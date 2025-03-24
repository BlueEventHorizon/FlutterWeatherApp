import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';
part 'weather_info.g.dart';

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

@freezed
@JsonSerializable(fieldRename: FieldRename.snake)
abstract class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required int maxTemperature,
    required int minTemperature,
    required WeatherCondition condition,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, Object?> json) =>
      _$WeatherInfoFromJson(json);
}
