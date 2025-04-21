import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_training/domain/model/weather_info.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    required WeatherCondition? condition,
    super.key,
  }) : _condition = condition;

  final WeatherCondition? _condition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: _condition == null
          ? const Placeholder()
          : SvgPicture.asset('assets/${_condition.name}.svg'),
    );
  }
}
