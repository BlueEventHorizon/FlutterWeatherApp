// Import the test package and Counter class

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/api/provider/yumemi_weather_provider.dart';
import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:yumemi_weather/yumemi_weather.dart';

import 'helper/create_container.dart';
@GenerateNiceMocks([MockSpec<YumemiWeather>()])
import 'weather_api_test.mocks.dart';

void main() {
  test('''
        YumemiWeatherがcloudyを返す時、WeatherAPIは、cloudyを返す
    ''', () {
    final mock = MockYumemiWeather();

    final container = createContainer(
      overrides: [
        yumemiWeatherProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final api = container.read(weatherAPIProvider);

    when(mock.fetchWeather(any)).thenReturn('cloudy');
    expect(api.fetchWeatherInfo(), 'cloudy');
  });

  test('''
        YumemiWeatherがInvalidParameterをスローする時、WeatherAPIは、InvalidParameterをスローする
    ''', () {
    final mock = MockYumemiWeather();
    final container = createContainer(
      overrides: [
        yumemiWeatherProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final api = container.read(weatherAPIProvider);

    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.invalidParameter);
    expect(api.fetchWeatherInfo, throwsA(isA<InvalidParameter>()));
  });

  test('''
        YumemiWeatherがUnknownをスローする時、WeatherAPIは、Unknownをスローする
    ''', () {
    final mock = MockYumemiWeather();
    final container = createContainer(
      overrides: [
        yumemiWeatherProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final api = container.read(weatherAPIProvider);

    when(mock.fetchWeather(any)).thenThrow(YumemiWeatherError.unknown);
    expect(api.fetchWeatherInfo, throwsA(isA<Unknown>()));
  });
}
