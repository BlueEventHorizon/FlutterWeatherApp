import 'package:flutter/material.dart';

class WeatherScreenButtons extends StatelessWidget {
  const WeatherScreenButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Reload'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
