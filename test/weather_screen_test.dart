import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/api/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/ui/screen/weather_screen.dart';
import 'package:flutter_training/ui/screen/weather_screen_buttons.dart';
import 'package:mockito/mockito.dart';

import 'weather_api_test.mocks.dart';

void main() {
  testWidgets('何か書き換える', (tester) async {
    final mock = MockYumemiWeather();
    const response = '''
    {
      "weather_condition": "cloudy",
      "max_temperature": 25,
      "min_temperature": 7,
      "date": "2020-04-01T12:00:00+09:00"
    }
    ''';
    when(mock.fetchWeather(any)).thenReturn(response);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          yumemiWeatherProvider.overrideWith((ref) {
            return mock;
          }),
        ],
        child: const WeatherScreen(),
      ),
    );

    final reloadButtonFinder = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButtonFinder);
  });
}
