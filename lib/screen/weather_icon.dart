import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    required String? condition,
    super.key,
  }) : _condition = condition;

  final String? _condition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: _condition == null
          ? const Placeholder()
          : SvgPicture.asset('assets/$_condition.svg'),
    );
  }
}
