import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    super.key,
    required this.condition,
  });

  final String? condition;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: condition == null
          ? const Placeholder()
          : SvgPicture.asset('assets/${condition!}.svg'),
    );
  }
}
