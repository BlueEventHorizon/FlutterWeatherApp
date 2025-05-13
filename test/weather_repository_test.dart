import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/api/weather_api.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/domain/exception/app_exception.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'helper/create_container.dart';
@GenerateNiceMocks([MockSpec<WeatherAPI>()])
import 'weather_repository_test.mocks.dart';

void main() {
  test('''
        Weather APIがresponseを返す時、WeatherRepositoryは、WeatherInfoを返す
    ''', () {
    final mock = MockWeatherAPI();

    const response = '''
    {
      "weather_condition": "cloudy",
      "max_temperature": 25,
      "min_temperature": 7,
      "date": "2020-04-01T12:00:00+09:00"
    }
    ''';

    final container = createContainer(
      overrides: [
        weatherAPIProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final repository = container.read(weatherRepositoryProvider);

    when(mock.fetchWeatherInfo()).thenReturn(response);
    expect(
      repository.getWeatherInfo(),
      const WeatherInfo(
        maxTemperature: 25,
        minTemperature: 7,
        weatherCondition: WeatherCondition.cloudy,
      ),
    );
  });

  test('''
        Weather APIがInvalidParameterをスローする時、WeatherRepositoryは、InvalidParameterをスローする
    ''', () {
    final mock = MockWeatherAPI();

    final container = createContainer(
      overrides: [
        weatherAPIProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final repository = container.read(weatherRepositoryProvider);

    when(mock.fetchWeatherInfo()).thenThrow(const InvalidParameter());
    expect(
      repository.getWeatherInfo,
      throwsA(isA<InvalidParameter>()),
    );
  });

  test('''
        Weather APIがUnknownをスローする時、WeatherRepositoryは、Unknownをスローする
    ''', () {
    final mock = MockWeatherAPI();

    final container = createContainer(
      overrides: [
        weatherAPIProvider.overrideWith((ref) {
          return mock;
        }),
      ],
    );

    final repository = container.read(weatherRepositoryProvider);

    when(mock.fetchWeatherInfo()).thenThrow(const Unknown());
    expect(
      repository.getWeatherInfo,
      throwsA(isA<Unknown>()),
    );
  });
}
