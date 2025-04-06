// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => _WeatherInfo(
      maxTemperature: (json['max_temperature'] as num).toInt(),
      minTemperature: (json['min_temperature'] as num).toInt(),
      weatherCondition:
          $enumDecode(_$WeatherConditionEnumMap, json['weather_condition']),
    );

Map<String, dynamic> _$WeatherInfoToJson(_WeatherInfo instance) =>
    <String, dynamic>{
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'weather_condition': _$WeatherConditionEnumMap[instance.weatherCondition],
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
};
