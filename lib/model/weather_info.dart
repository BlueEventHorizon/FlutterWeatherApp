import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info.freezed.dart';
part 'weather_info.g.dart';

enum WeatherCondition {
  sunny,
  cloudy,
  rainy;
}

@freezed
abstract class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    required int maxTemperature,
    required int minTemperature,
    required WeatherCondition weatherCondition,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, Object?> json) =>
      _$WeatherInfoFromJson(json);
}
