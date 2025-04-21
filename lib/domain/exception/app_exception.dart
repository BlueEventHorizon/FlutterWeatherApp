sealed class AppException implements Exception {
  const AppException({required this.message});
  final String message;
}

class JsonFormatError extends AppException {
  const JsonFormatError() : super(message: 'データ形式に問題があります');
}

sealed class WeatherAPIError extends AppException {
  const WeatherAPIError({required super.message});
}

class InvalidParameter extends WeatherAPIError {
  const InvalidParameter() : super(message: '無効な都道府県が指定されました');
}

class Unknown extends WeatherAPIError {
  const Unknown() : super(message: '天気情報が取得できません');
}
