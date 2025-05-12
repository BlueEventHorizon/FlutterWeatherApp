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
    () {
      final mock = MockWeatherRepository();

      final container = createContainer(
        overrides: [
          weatherRepositoryProvider.overrideWith((ref) {
            return mock;
          }),
        ],
      );

      when(mock.getWeatherInfo()).thenReturn(
        const WeatherInfo(
          maxTemperature: 25,
          minTemperature: 7,
          weatherCondition: WeatherCondition.cloudy,
        ),
      );

      // fetchメソッドを実行
      container.read(weatherInfoNotifierProvider.notifier).fetch();

      final weatherInfo = container.read(weatherInfoNotifierProvider);

      expect(
        weatherInfo,
        const WeatherInfo(
          maxTemperature: 25,
          minTemperature: 7,
          weatherCondition: WeatherCondition.cloudy,
        ),
      );
    },
  );
}
