// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, duplicate_ignore

part of 'weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherInfo _$WeatherInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
      '_WeatherInfo',
      json,
      ($checkedConvert) {
        final val = _WeatherInfo(
          maxTemperature:
              $checkedConvert('max_temperature', (v) => (v as num).toInt()),
          minTemperature:
              $checkedConvert('min_temperature', (v) => (v as num).toInt()),
          weatherCondition: $checkedConvert('weather_condition',
              (v) => $enumDecode(_$WeatherConditionEnumMap, v)),
        );
        return val;
      },
      fieldKeyMap: const {
        'maxTemperature': 'max_temperature',
        'minTemperature': 'min_temperature',
        'weatherCondition': 'weather_condition'
      },
    );

Map<String, dynamic> _$WeatherInfoToJson(_WeatherInfo instance) =>
    <String, dynamic>{
      'max_temperature': instance.maxTemperature,
      'min_temperature': instance.minTemperature,
      'weather_condition':
          _$WeatherConditionEnumMap[instance.weatherCondition]!,
    };

const _$WeatherConditionEnumMap = {
  WeatherCondition.sunny: 'sunny',
  WeatherCondition.cloudy: 'cloudy',
  WeatherCondition.rainy: 'rainy',
};
