import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成が機能するために必要です。
part 'weather_info_notifier_provider.g.dart';

@riverpod
class WeatherInfoNotifier extends _$WeatherInfoNotifier {
  @override
  WeatherInfo? build() {
    return null;
  }

  void fetch({String area = 'tokyo', DateTime? dateTime}) {
    final repository = ref.read(weatherRepositoryProvider);
    state = repository.getWeatherInfo(
      area: area,
      dateTime: dateTime,
    );
  }
}
