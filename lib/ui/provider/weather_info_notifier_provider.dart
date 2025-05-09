import 'package:flutter_training/data/repository/weather_repository.dart';
import 'package:flutter_training/domain/model/weather_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// コード生成が機能するために必要です。
part 'weather_info_notifier_provider.g.dart';

@riverpod
class WeatherInfoNotifier extends _$WeatherInfoNotifier {
  final _repository = WeatherRepository();

  @override
  WeatherInfo? build() {
    return null;
  }

  void fetch({String area = 'tokyo', DateTime? dateTime}) {
    state = _repository.getWeatherInfo(
      area: area,
      dateTime: dateTime,
    );
  }
}
