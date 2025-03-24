// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherInfo {
  int get maxTemperature;
  int get minTemperature;
  WeatherCondition get condition;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherInfoCopyWith<WeatherInfo> get copyWith =>
      _$WeatherInfoCopyWithImpl<WeatherInfo>(this as WeatherInfo, _$identity);

  /// Serializes this WeatherInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherInfo &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxTemperature, minTemperature, condition);

  @override
  String toString() {
    return 'WeatherInfo(maxTemperature: $maxTemperature, minTemperature: $minTemperature, condition: $condition)';
  }
}

/// @nodoc
abstract mixin class $WeatherInfoCopyWith<$Res> {
  factory $WeatherInfoCopyWith(
          WeatherInfo value, $Res Function(WeatherInfo) _then) =
      _$WeatherInfoCopyWithImpl;
  @useResult
  $Res call(
      {int maxTemperature, int minTemperature, WeatherCondition condition});
}

/// @nodoc
class _$WeatherInfoCopyWithImpl<$Res> implements $WeatherInfoCopyWith<$Res> {
  _$WeatherInfoCopyWithImpl(this._self, this._then);

  final WeatherInfo _self;
  final $Res Function(WeatherInfo) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? condition = null,
  }) {
    return _then(_self.copyWith(
      maxTemperature: null == maxTemperature
          ? _self.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _self.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherInfo implements WeatherInfo {
  const _WeatherInfo(
      {required this.maxTemperature,
      required this.minTemperature,
      required this.condition});
  factory _WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);

  @override
  final int maxTemperature;
  @override
  final int minTemperature;
  @override
  final WeatherCondition condition;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherInfoCopyWith<_WeatherInfo> get copyWith =>
      __$WeatherInfoCopyWithImpl<_WeatherInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherInfo &&
            (identical(other.maxTemperature, maxTemperature) ||
                other.maxTemperature == maxTemperature) &&
            (identical(other.minTemperature, minTemperature) ||
                other.minTemperature == minTemperature) &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, maxTemperature, minTemperature, condition);

  @override
  String toString() {
    return 'WeatherInfo(maxTemperature: $maxTemperature, minTemperature: $minTemperature, condition: $condition)';
  }
}

/// @nodoc
abstract mixin class _$WeatherInfoCopyWith<$Res>
    implements $WeatherInfoCopyWith<$Res> {
  factory _$WeatherInfoCopyWith(
          _WeatherInfo value, $Res Function(_WeatherInfo) _then) =
      __$WeatherInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int maxTemperature, int minTemperature, WeatherCondition condition});
}

/// @nodoc
class __$WeatherInfoCopyWithImpl<$Res> implements _$WeatherInfoCopyWith<$Res> {
  __$WeatherInfoCopyWithImpl(this._self, this._then);

  final _WeatherInfo _self;
  final $Res Function(_WeatherInfo) _then;

  /// Create a copy of WeatherInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? maxTemperature = null,
    Object? minTemperature = null,
    Object? condition = null,
  }) {
    return _then(_WeatherInfo(
      maxTemperature: null == maxTemperature
          ? _self.maxTemperature
          : maxTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      minTemperature: null == minTemperature
          ? _self.minTemperature
          : minTemperature // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _self.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as WeatherCondition,
    ));
  }
}

// dart format on
