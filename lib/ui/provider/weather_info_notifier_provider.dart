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

  // 関数があるProvideerは、Notifierを付ける
  Future<void> fetch({String area = 'tokyo', DateTime? dateTime}) async {
    final repository = ref.read(weatherRepositoryProvider);

    state = await repository.getWeatherInfo(
      area: area,
      dateTime: dateTime,
    );
  }
}
