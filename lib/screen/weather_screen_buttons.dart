import 'package:flutter/material.dart';

class WeatherScreenButtons extends StatelessWidget {
  const WeatherScreenButtons({required void Function() reload, super.key})
      : _reload = reload;

  final void Function() _reload;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: _reload,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
