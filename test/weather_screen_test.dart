import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/api/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:flutter_training/ui/screen/weather_screen.dart';
import 'package:flutter_training/ui/screen/weather_screen_buttons.dart';
import 'package:flutter_training/ui/screen/weather_screen_temperature.dart';
import 'package:mockito/mockito.dart';

import 'weather_api_test.mocks.dart';

void main() {
  // 古いやり方です。
  // fvm flutter runでテストする場合は、こちらじゃないとシミュレータ上の描画サイズが変更されない

  // Future<void> initializeDeviceSurfaceSize() async {
  //   final binding = TestWidgetsFlutterBinding.ensureInitialized();
  //   await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone16のサイズ

  //   addTearDown(() => binding.setSurfaceSize(null));
  // }

  testWidgets('何か書き換える', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    // await initializeDeviceSurfaceSize();

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
        child: const MaterialApp(home: WeatherScreen()),
      ),
    );

    final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButton);

    await tester.pump();

    final weatherImage = find.bySemanticsLabel(WeatherCondition.cloudy.name);
    expect(weatherImage, findsOneWidget);

    // final temperatureTextFinder = find.text('25°C');
    // expect(temperatureTextFinder, findsOneWidget);
  });

  testWidgets('何か書き換える', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    // await initializeDeviceSurfaceSize();

    final mock = MockYumemiWeather();
    const response = '''
    {
      "weather_condition": "sunny",
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
        child: const MaterialApp(home: WeatherScreen()),
      ),
    );

    final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButton);

    await tester.pumpAndSettle();

    final weatherImage = find.bySemanticsLabel(WeatherCondition.sunny.name);
    expect(weatherImage, findsOneWidget);
  });

  testWidgets('何か書き換える', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    // await initializeDeviceSurfaceSize();

    final mock = MockYumemiWeather();
    const response = '''
    {
      "weather_condition": "rainy",
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
        child: const MaterialApp(home: WeatherScreen()),
      ),
    );

    final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButton);

    await tester.pumpAndSettle();

    final weatherImage = find.bySemanticsLabel(WeatherCondition.rainy.name);
    expect(weatherImage, findsOneWidget);
  });
}
