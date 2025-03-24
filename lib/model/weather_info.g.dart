// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => _WeatherInfo(
      maxTemperature: (json['maxTemperature'] as num).toInt(),
      minTemperature: (json['minTemperature'] as num).toInt(),
      condition: $enumDecode(_$WeatherConditionEnumMap, json['condition']),
    );

Map<String, dynamic> _$WeatherInfoToJson(_WeatherInfo instance) =>
    <String, dynamic>{
      'maxTemperature': instance.maxTemperature,
      'minTemperature': instance.minTemperature,
      'condition': _$WeatherConditionEnumMap[instance.condition]!,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
};
