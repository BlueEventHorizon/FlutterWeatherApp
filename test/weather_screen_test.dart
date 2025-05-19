import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/api/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:flutter_training/ui/screen/weather_screen.dart';
import 'package:flutter_training/ui/screen/weather_screen_buttons.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'weather_api_test.mocks.dart';

void main() {
  // initializeDeviceSurfaceSize()は、古いやり方です。
  // fvm flutter runでテストする場合は、こちらじゃないとシミュレータ上の描画サイズが変更されない

  // Future<void> initializeDeviceSurfaceSize() async {
  //   final binding = TestWidgetsFlutterBinding.ensureInitialized();
  //   await binding.setSurfaceSize(const Size(1179, 2556)); // iPhone16のサイズ

  //   addTearDown(() => binding.setSurfaceSize(null));
  // }

  testWidgets('reload ボタン押下で cloudyの画像、最低気温、最高気温のラベル表示がされること', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    addTearDown(() {
      tester.view.resetPhysicalSize();
    });
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

    //定義したキーでボタンをボタンを参照
    final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButton);

    // 再描画
    //await tester.pump();

    await tester.pumpAndSettle();

    // cloudyの名前のラベルを持つウィジェットを検索
    final weatherImage = find.bySemanticsLabel(WeatherCondition.cloudy.name);
    // 画面上に要素が一つだけ存在することを期待
    expect(weatherImage, findsOneWidget);

    final maxTemperatureTextFinder = find.text('25 ℃');
    expect(maxTemperatureTextFinder, findsOneWidget);

    final minTemperatureTextFinder = find.text('7 ℃');
    expect(minTemperatureTextFinder, findsOneWidget);
  });

  for (final condition in WeatherCondition.values) {
    testWidgets(
        'reload ボタン押下でレスポンスが${condition.name}の時、${condition.name}の画像が表示されること',
        (tester) async {
      tester.view.physicalSize = const Size(1179, 2556);
      addTearDown(() {
        tester.view.resetPhysicalSize();
      });

      final response = '''
      {
        "weather_condition": "${condition.name}",
        "max_temperature": 25,
        "min_temperature": 7,
        "date": "2020-04-01T12:00:00+09:00"
      }
      ''';

      final mock = MockYumemiWeather();

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

      //定義したキーでボタンをボタンを参照
      final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
      await tester.tap(reloadButton);

      // 再描画
      await tester.pump();

      // condition.nameの名前のラベルを持つウィジェットを検索
      final weatherImage = find.bySemanticsLabel(condition.name);
      // 画面上に要素が一つだけ存在することを期待
      expect(weatherImage, findsOneWidget);
    });
  }

  testWidgets('天気予報画面にダイアログが表示され、メッセージが表示されること', (tester) async {
    tester.view.physicalSize = const Size(1179, 2556);
    addTearDown(() {
      tester.view.resetPhysicalSize();
    });
    // await initializeDeviceSurfaceSize();

    final mock = MockYumemiWeather();

    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.invalidParameter);

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

    //定義したキーでボタンをボタンを参照
    final reloadButton = find.byKey(WeatherScreenButtons.reloadButtonKey);
    await tester.tap(reloadButton);

    // 再描画
    await tester.pump();

    // AlertDialogウィジェットを検索
    final alertDialog = find.byType(AlertDialog);
    // 画面上に要素が一つだけ存在することを期待
    expect(alertDialog, findsOneWidget);

    final alertMessage = find.text(const InvalidParameter().message);
    expect(alertMessage, findsOneWidget);
  });
}
