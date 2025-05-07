import 'package:flutter/material.dart';

class WeatherScreenButtons extends StatelessWidget {
  const WeatherScreenButtons({
    required void Function() close,
    required void Function() reload,
    super.key,
  })  : _close = close,
        _reload = reload;

  final void Function() _close;
  final void Function() _reload;

  @visibleForTesting
  static final reloadButtonKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: _close,
            child: const Text('Close'),
          ),
        ),
        Expanded(
          child: TextButton(
            key: reloadButtonKey,
            onPressed: _reload,
            child: const Text('Reload'),
          ),
        ),
      ],
    );
  }
}
