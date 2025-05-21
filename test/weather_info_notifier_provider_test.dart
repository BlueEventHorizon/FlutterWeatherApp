import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:flutter_training/ui/provider/weather_info_notifier_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'helper/create_container.dart';
@GenerateNiceMocks([MockSpec<WeatherRepository>()])
import 'weather_info_notifier_provider_test.mocks.dart';

void main() {
  test(
    '''
       WeatherInfoNotifierは初期値は null となっていること
    ''',
    () {
      final mock = MockWeatherRepository();

      final container = createContainer(
        overrides: [
          weatherRepositoryProvider.overrideWith((ref) {
            return mock;
          }),
        ],
      );

      final weatherInfo = container.read(weatherInfoNotifierProvider);

      expect(weatherInfo, isNull);
    },
  );

  test(
    '''
       WeatherRepositoryが、「cloudyその他」を返す時、weatherInfoが「cloudyその他」になっていること
    ''',
    () async {
      final mock = MockWeatherRepository();

      final container = createContainer(
        overrides: [
          weatherRepositoryProvider.overrideWith((ref) {
            return mock;
          }),
        ],
      );

      const weatherForTest = WeatherInfo(
        maxTemperature: 25,
        minTemperature: 7,
        weatherCondition: WeatherCondition.cloudy,
      );

      when(mock.getWeatherInfo()).thenAnswer(
        (_) async => weatherForTest,
      );

      // fetchメソッドを実行
      await container.read(weatherInfoNotifierProvider.notifier).fetch();

      final weatherInfo = container.read(weatherInfoNotifierProvider);

      expect(
        weatherInfo,
        weatherForTest,
      );
    },
  );
}
