// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ship_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ShipWind _$ShipWindFromJson(Map<String, dynamic> json) {
  return _ShipWind.fromJson(json);
}

/// @nodoc
mixin _$ShipWind {
  @JsonKey(name: 'SPEED')
  String? get speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'DIRECTION')
  String? get direction => throw _privateConstructorUsedError;
  @JsonKey(name: 'TYPE')
  String? get type => throw _privateConstructorUsedError;

  /// Serializes this ShipWind to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipWind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipWindCopyWith<ShipWind> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipWindCopyWith<$Res> {
  factory $ShipWindCopyWith(ShipWind value, $Res Function(ShipWind) then) =
      _$ShipWindCopyWithImpl<$Res, ShipWind>;
  @useResult
  $Res call({
    @JsonKey(name: 'SPEED') String? speed,
    @JsonKey(name: 'DIRECTION') String? direction,
    @JsonKey(name: 'TYPE') String? type,
  });
}

/// @nodoc
class _$ShipWindCopyWithImpl<$Res, $Val extends ShipWind>
    implements $ShipWindCopyWith<$Res> {
  _$ShipWindCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipWind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = freezed,
    Object? direction = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _value.copyWith(
            speed: freezed == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                      as String?,
            direction: freezed == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipWindImplCopyWith<$Res>
    implements $ShipWindCopyWith<$Res> {
  factory _$$ShipWindImplCopyWith(
    _$ShipWindImpl value,
    $Res Function(_$ShipWindImpl) then,
  ) = __$$ShipWindImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SPEED') String? speed,
    @JsonKey(name: 'DIRECTION') String? direction,
    @JsonKey(name: 'TYPE') String? type,
  });
}

/// @nodoc
class __$$ShipWindImplCopyWithImpl<$Res>
    extends _$ShipWindCopyWithImpl<$Res, _$ShipWindImpl>
    implements _$$ShipWindImplCopyWith<$Res> {
  __$$ShipWindImplCopyWithImpl(
    _$ShipWindImpl _value,
    $Res Function(_$ShipWindImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipWind
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = freezed,
    Object? direction = freezed,
    Object? type = freezed,
  }) {
    return _then(
      _$ShipWindImpl(
        speed: freezed == speed
            ? _value.speed
            : speed // ignore: cast_nullable_to_non_nullable
                  as String?,
        direction: freezed == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipWindImpl implements _ShipWind {
  const _$ShipWindImpl({
    @JsonKey(name: 'SPEED') this.speed,
    @JsonKey(name: 'DIRECTION') this.direction,
    @JsonKey(name: 'TYPE') this.type,
  });

  factory _$ShipWindImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipWindImplFromJson(json);

  @override
  @JsonKey(name: 'SPEED')
  final String? speed;
  @override
  @JsonKey(name: 'DIRECTION')
  final String? direction;
  @override
  @JsonKey(name: 'TYPE')
  final String? type;

  @override
  String toString() {
    return 'ShipWind(speed: $speed, direction: $direction, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipWindImpl &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, speed, direction, type);

  /// Create a copy of ShipWind
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipWindImplCopyWith<_$ShipWindImpl> get copyWith =>
      __$$ShipWindImplCopyWithImpl<_$ShipWindImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipWindImplToJson(this);
  }
}

abstract class _ShipWind implements ShipWind {
  const factory _ShipWind({
    @JsonKey(name: 'SPEED') final String? speed,
    @JsonKey(name: 'DIRECTION') final String? direction,
    @JsonKey(name: 'TYPE') final String? type,
  }) = _$ShipWindImpl;

  factory _ShipWind.fromJson(Map<String, dynamic> json) =
      _$ShipWindImpl.fromJson;

  @override
  @JsonKey(name: 'SPEED')
  String? get speed;
  @override
  @JsonKey(name: 'DIRECTION')
  String? get direction;
  @override
  @JsonKey(name: 'TYPE')
  String? get type;

  /// Create a copy of ShipWind
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipWindImplCopyWith<_$ShipWindImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipPosition _$ShipPositionFromJson(Map<String, dynamic> json) {
  return _ShipPosition.fromJson(json);
}

/// @nodoc
mixin _$ShipPosition {
  @JsonKey(name: 'LATITUDE')
  String? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'LONGITUDE')
  String? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'LATITUDE_D')
  String? get latitudeD => throw _privateConstructorUsedError;
  @JsonKey(name: 'LATITUDE_M')
  String? get latitudeM => throw _privateConstructorUsedError;
  @JsonKey(name: 'LATITUDE_S')
  String? get latitudeS => throw _privateConstructorUsedError;
  @JsonKey(name: 'LATITUDE_H')
  String? get latitudeH => throw _privateConstructorUsedError;
  @JsonKey(name: 'LONGITUDE_D')
  String? get longitudeD => throw _privateConstructorUsedError;
  @JsonKey(name: 'LONGITUDE_M')
  String? get longitudeM => throw _privateConstructorUsedError;
  @JsonKey(name: 'LONGITUDE_S')
  String? get longitudeS => throw _privateConstructorUsedError;
  @JsonKey(name: 'LONGITUDE_H')
  String? get longitudeH => throw _privateConstructorUsedError;
  @JsonKey(name: 'SOURCE')
  String? get source => throw _privateConstructorUsedError;

  /// Serializes this ShipPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipPositionCopyWith<ShipPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipPositionCopyWith<$Res> {
  factory $ShipPositionCopyWith(
    ShipPosition value,
    $Res Function(ShipPosition) then,
  ) = _$ShipPositionCopyWithImpl<$Res, ShipPosition>;
  @useResult
  $Res call({
    @JsonKey(name: 'LATITUDE') String? latitude,
    @JsonKey(name: 'LONGITUDE') String? longitude,
    @JsonKey(name: 'LATITUDE_D') String? latitudeD,
    @JsonKey(name: 'LATITUDE_M') String? latitudeM,
    @JsonKey(name: 'LATITUDE_S') String? latitudeS,
    @JsonKey(name: 'LATITUDE_H') String? latitudeH,
    @JsonKey(name: 'LONGITUDE_D') String? longitudeD,
    @JsonKey(name: 'LONGITUDE_M') String? longitudeM,
    @JsonKey(name: 'LONGITUDE_S') String? longitudeS,
    @JsonKey(name: 'LONGITUDE_H') String? longitudeH,
    @JsonKey(name: 'SOURCE') String? source,
  });
}

/// @nodoc
class _$ShipPositionCopyWithImpl<$Res, $Val extends ShipPosition>
    implements $ShipPositionCopyWith<$Res> {
  _$ShipPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? latitudeD = freezed,
    Object? latitudeM = freezed,
    Object? latitudeS = freezed,
    Object? latitudeH = freezed,
    Object? longitudeD = freezed,
    Object? longitudeM = freezed,
    Object? longitudeS = freezed,
    Object? longitudeH = freezed,
    Object? source = freezed,
  }) {
    return _then(
      _value.copyWith(
            latitude: freezed == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitude: freezed == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitudeD: freezed == latitudeD
                ? _value.latitudeD
                : latitudeD // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitudeM: freezed == latitudeM
                ? _value.latitudeM
                : latitudeM // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitudeS: freezed == latitudeS
                ? _value.latitudeS
                : latitudeS // ignore: cast_nullable_to_non_nullable
                      as String?,
            latitudeH: freezed == latitudeH
                ? _value.latitudeH
                : latitudeH // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitudeD: freezed == longitudeD
                ? _value.longitudeD
                : longitudeD // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitudeM: freezed == longitudeM
                ? _value.longitudeM
                : longitudeM // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitudeS: freezed == longitudeS
                ? _value.longitudeS
                : longitudeS // ignore: cast_nullable_to_non_nullable
                      as String?,
            longitudeH: freezed == longitudeH
                ? _value.longitudeH
                : longitudeH // ignore: cast_nullable_to_non_nullable
                      as String?,
            source: freezed == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipPositionImplCopyWith<$Res>
    implements $ShipPositionCopyWith<$Res> {
  factory _$$ShipPositionImplCopyWith(
    _$ShipPositionImpl value,
    $Res Function(_$ShipPositionImpl) then,
  ) = __$$ShipPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'LATITUDE') String? latitude,
    @JsonKey(name: 'LONGITUDE') String? longitude,
    @JsonKey(name: 'LATITUDE_D') String? latitudeD,
    @JsonKey(name: 'LATITUDE_M') String? latitudeM,
    @JsonKey(name: 'LATITUDE_S') String? latitudeS,
    @JsonKey(name: 'LATITUDE_H') String? latitudeH,
    @JsonKey(name: 'LONGITUDE_D') String? longitudeD,
    @JsonKey(name: 'LONGITUDE_M') String? longitudeM,
    @JsonKey(name: 'LONGITUDE_S') String? longitudeS,
    @JsonKey(name: 'LONGITUDE_H') String? longitudeH,
    @JsonKey(name: 'SOURCE') String? source,
  });
}

/// @nodoc
class __$$ShipPositionImplCopyWithImpl<$Res>
    extends _$ShipPositionCopyWithImpl<$Res, _$ShipPositionImpl>
    implements _$$ShipPositionImplCopyWith<$Res> {
  __$$ShipPositionImplCopyWithImpl(
    _$ShipPositionImpl _value,
    $Res Function(_$ShipPositionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? latitudeD = freezed,
    Object? latitudeM = freezed,
    Object? latitudeS = freezed,
    Object? latitudeH = freezed,
    Object? longitudeD = freezed,
    Object? longitudeM = freezed,
    Object? longitudeS = freezed,
    Object? longitudeH = freezed,
    Object? source = freezed,
  }) {
    return _then(
      _$ShipPositionImpl(
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitudeD: freezed == latitudeD
            ? _value.latitudeD
            : latitudeD // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitudeM: freezed == latitudeM
            ? _value.latitudeM
            : latitudeM // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitudeS: freezed == latitudeS
            ? _value.latitudeS
            : latitudeS // ignore: cast_nullable_to_non_nullable
                  as String?,
        latitudeH: freezed == latitudeH
            ? _value.latitudeH
            : latitudeH // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitudeD: freezed == longitudeD
            ? _value.longitudeD
            : longitudeD // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitudeM: freezed == longitudeM
            ? _value.longitudeM
            : longitudeM // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitudeS: freezed == longitudeS
            ? _value.longitudeS
            : longitudeS // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitudeH: freezed == longitudeH
            ? _value.longitudeH
            : longitudeH // ignore: cast_nullable_to_non_nullable
                  as String?,
        source: freezed == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipPositionImpl implements _ShipPosition {
  const _$ShipPositionImpl({
    @JsonKey(name: 'LATITUDE') this.latitude,
    @JsonKey(name: 'LONGITUDE') this.longitude,
    @JsonKey(name: 'LATITUDE_D') this.latitudeD,
    @JsonKey(name: 'LATITUDE_M') this.latitudeM,
    @JsonKey(name: 'LATITUDE_S') this.latitudeS,
    @JsonKey(name: 'LATITUDE_H') this.latitudeH,
    @JsonKey(name: 'LONGITUDE_D') this.longitudeD,
    @JsonKey(name: 'LONGITUDE_M') this.longitudeM,
    @JsonKey(name: 'LONGITUDE_S') this.longitudeS,
    @JsonKey(name: 'LONGITUDE_H') this.longitudeH,
    @JsonKey(name: 'SOURCE') this.source,
  });

  factory _$ShipPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipPositionImplFromJson(json);

  @override
  @JsonKey(name: 'LATITUDE')
  final String? latitude;
  @override
  @JsonKey(name: 'LONGITUDE')
  final String? longitude;
  @override
  @JsonKey(name: 'LATITUDE_D')
  final String? latitudeD;
  @override
  @JsonKey(name: 'LATITUDE_M')
  final String? latitudeM;
  @override
  @JsonKey(name: 'LATITUDE_S')
  final String? latitudeS;
  @override
  @JsonKey(name: 'LATITUDE_H')
  final String? latitudeH;
  @override
  @JsonKey(name: 'LONGITUDE_D')
  final String? longitudeD;
  @override
  @JsonKey(name: 'LONGITUDE_M')
  final String? longitudeM;
  @override
  @JsonKey(name: 'LONGITUDE_S')
  final String? longitudeS;
  @override
  @JsonKey(name: 'LONGITUDE_H')
  final String? longitudeH;
  @override
  @JsonKey(name: 'SOURCE')
  final String? source;

  @override
  String toString() {
    return 'ShipPosition(latitude: $latitude, longitude: $longitude, latitudeD: $latitudeD, latitudeM: $latitudeM, latitudeS: $latitudeS, latitudeH: $latitudeH, longitudeD: $longitudeD, longitudeM: $longitudeM, longitudeS: $longitudeS, longitudeH: $longitudeH, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipPositionImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitudeD, latitudeD) ||
                other.latitudeD == latitudeD) &&
            (identical(other.latitudeM, latitudeM) ||
                other.latitudeM == latitudeM) &&
            (identical(other.latitudeS, latitudeS) ||
                other.latitudeS == latitudeS) &&
            (identical(other.latitudeH, latitudeH) ||
                other.latitudeH == latitudeH) &&
            (identical(other.longitudeD, longitudeD) ||
                other.longitudeD == longitudeD) &&
            (identical(other.longitudeM, longitudeM) ||
                other.longitudeM == longitudeM) &&
            (identical(other.longitudeS, longitudeS) ||
                other.longitudeS == longitudeS) &&
            (identical(other.longitudeH, longitudeH) ||
                other.longitudeH == longitudeH) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    latitude,
    longitude,
    latitudeD,
    latitudeM,
    latitudeS,
    latitudeH,
    longitudeD,
    longitudeM,
    longitudeS,
    longitudeH,
    source,
  );

  /// Create a copy of ShipPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipPositionImplCopyWith<_$ShipPositionImpl> get copyWith =>
      __$$ShipPositionImplCopyWithImpl<_$ShipPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipPositionImplToJson(this);
  }
}

abstract class _ShipPosition implements ShipPosition {
  const factory _ShipPosition({
    @JsonKey(name: 'LATITUDE') final String? latitude,
    @JsonKey(name: 'LONGITUDE') final String? longitude,
    @JsonKey(name: 'LATITUDE_D') final String? latitudeD,
    @JsonKey(name: 'LATITUDE_M') final String? latitudeM,
    @JsonKey(name: 'LATITUDE_S') final String? latitudeS,
    @JsonKey(name: 'LATITUDE_H') final String? latitudeH,
    @JsonKey(name: 'LONGITUDE_D') final String? longitudeD,
    @JsonKey(name: 'LONGITUDE_M') final String? longitudeM,
    @JsonKey(name: 'LONGITUDE_S') final String? longitudeS,
    @JsonKey(name: 'LONGITUDE_H') final String? longitudeH,
    @JsonKey(name: 'SOURCE') final String? source,
  }) = _$ShipPositionImpl;

  factory _ShipPosition.fromJson(Map<String, dynamic> json) =
      _$ShipPositionImpl.fromJson;

  @override
  @JsonKey(name: 'LATITUDE')
  String? get latitude;
  @override
  @JsonKey(name: 'LONGITUDE')
  String? get longitude;
  @override
  @JsonKey(name: 'LATITUDE_D')
  String? get latitudeD;
  @override
  @JsonKey(name: 'LATITUDE_M')
  String? get latitudeM;
  @override
  @JsonKey(name: 'LATITUDE_S')
  String? get latitudeS;
  @override
  @JsonKey(name: 'LATITUDE_H')
  String? get latitudeH;
  @override
  @JsonKey(name: 'LONGITUDE_D')
  String? get longitudeD;
  @override
  @JsonKey(name: 'LONGITUDE_M')
  String? get longitudeM;
  @override
  @JsonKey(name: 'LONGITUDE_S')
  String? get longitudeS;
  @override
  @JsonKey(name: 'LONGITUDE_H')
  String? get longitudeH;
  @override
  @JsonKey(name: 'SOURCE')
  String? get source;

  /// Create a copy of ShipPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipPositionImplCopyWith<_$ShipPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipNautic _$ShipNauticFromJson(Map<String, dynamic> json) {
  return _ShipNautic.fromJson(json);
}

/// @nodoc
mixin _$ShipNautic {
  @JsonKey(name: 'STATUS')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'ETA_TIME')
  String? get etaTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'ETA_DATE')
  String? get etaDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'NEXT_PORT')
  String? get nextPort => throw _privateConstructorUsedError;

  /// Serializes this ShipNautic to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipNautic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipNauticCopyWith<ShipNautic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipNauticCopyWith<$Res> {
  factory $ShipNauticCopyWith(
    ShipNautic value,
    $Res Function(ShipNautic) then,
  ) = _$ShipNauticCopyWithImpl<$Res, ShipNautic>;
  @useResult
  $Res call({
    @JsonKey(name: 'STATUS') String? status,
    @JsonKey(name: 'ETA_TIME') String? etaTime,
    @JsonKey(name: 'ETA_DATE') String? etaDate,
    @JsonKey(name: 'NEXT_PORT') String? nextPort,
  });
}

/// @nodoc
class _$ShipNauticCopyWithImpl<$Res, $Val extends ShipNautic>
    implements $ShipNauticCopyWith<$Res> {
  _$ShipNauticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipNautic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? etaTime = freezed,
    Object? etaDate = freezed,
    Object? nextPort = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            etaTime: freezed == etaTime
                ? _value.etaTime
                : etaTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            etaDate: freezed == etaDate
                ? _value.etaDate
                : etaDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            nextPort: freezed == nextPort
                ? _value.nextPort
                : nextPort // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipNauticImplCopyWith<$Res>
    implements $ShipNauticCopyWith<$Res> {
  factory _$$ShipNauticImplCopyWith(
    _$ShipNauticImpl value,
    $Res Function(_$ShipNauticImpl) then,
  ) = __$$ShipNauticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'STATUS') String? status,
    @JsonKey(name: 'ETA_TIME') String? etaTime,
    @JsonKey(name: 'ETA_DATE') String? etaDate,
    @JsonKey(name: 'NEXT_PORT') String? nextPort,
  });
}

/// @nodoc
class __$$ShipNauticImplCopyWithImpl<$Res>
    extends _$ShipNauticCopyWithImpl<$Res, _$ShipNauticImpl>
    implements _$$ShipNauticImplCopyWith<$Res> {
  __$$ShipNauticImplCopyWithImpl(
    _$ShipNauticImpl _value,
    $Res Function(_$ShipNauticImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipNautic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? etaTime = freezed,
    Object? etaDate = freezed,
    Object? nextPort = freezed,
  }) {
    return _then(
      _$ShipNauticImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        etaTime: freezed == etaTime
            ? _value.etaTime
            : etaTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        etaDate: freezed == etaDate
            ? _value.etaDate
            : etaDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        nextPort: freezed == nextPort
            ? _value.nextPort
            : nextPort // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipNauticImpl implements _ShipNautic {
  const _$ShipNauticImpl({
    @JsonKey(name: 'STATUS') this.status,
    @JsonKey(name: 'ETA_TIME') this.etaTime,
    @JsonKey(name: 'ETA_DATE') this.etaDate,
    @JsonKey(name: 'NEXT_PORT') this.nextPort,
  });

  factory _$ShipNauticImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipNauticImplFromJson(json);

  @override
  @JsonKey(name: 'STATUS')
  final String? status;
  @override
  @JsonKey(name: 'ETA_TIME')
  final String? etaTime;
  @override
  @JsonKey(name: 'ETA_DATE')
  final String? etaDate;
  @override
  @JsonKey(name: 'NEXT_PORT')
  final String? nextPort;

  @override
  String toString() {
    return 'ShipNautic(status: $status, etaTime: $etaTime, etaDate: $etaDate, nextPort: $nextPort)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipNauticImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.etaTime, etaTime) || other.etaTime == etaTime) &&
            (identical(other.etaDate, etaDate) || other.etaDate == etaDate) &&
            (identical(other.nextPort, nextPort) ||
                other.nextPort == nextPort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, etaTime, etaDate, nextPort);

  /// Create a copy of ShipNautic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipNauticImplCopyWith<_$ShipNauticImpl> get copyWith =>
      __$$ShipNauticImplCopyWithImpl<_$ShipNauticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipNauticImplToJson(this);
  }
}

abstract class _ShipNautic implements ShipNautic {
  const factory _ShipNautic({
    @JsonKey(name: 'STATUS') final String? status,
    @JsonKey(name: 'ETA_TIME') final String? etaTime,
    @JsonKey(name: 'ETA_DATE') final String? etaDate,
    @JsonKey(name: 'NEXT_PORT') final String? nextPort,
  }) = _$ShipNauticImpl;

  factory _ShipNautic.fromJson(Map<String, dynamic> json) =
      _$ShipNauticImpl.fromJson;

  @override
  @JsonKey(name: 'STATUS')
  String? get status;
  @override
  @JsonKey(name: 'ETA_TIME')
  String? get etaTime;
  @override
  @JsonKey(name: 'ETA_DATE')
  String? get etaDate;
  @override
  @JsonKey(name: 'NEXT_PORT')
  String? get nextPort;

  /// Create a copy of ShipNautic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipNauticImplCopyWith<_$ShipNauticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipSpeed _$ShipSpeedFromJson(Map<String, dynamic> json) {
  return _ShipSpeed.fromJson(json);
}

/// @nodoc
mixin _$ShipSpeed {
  @JsonKey(name: 'OVER_GROUND')
  String? get overGround => throw _privateConstructorUsedError;
  @JsonKey(name: 'THROUGH_WATER')
  String? get throughWater => throw _privateConstructorUsedError;
  @JsonKey(name: 'ROT')
  String? get rot => throw _privateConstructorUsedError;

  /// Serializes this ShipSpeed to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipSpeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipSpeedCopyWith<ShipSpeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipSpeedCopyWith<$Res> {
  factory $ShipSpeedCopyWith(ShipSpeed value, $Res Function(ShipSpeed) then) =
      _$ShipSpeedCopyWithImpl<$Res, ShipSpeed>;
  @useResult
  $Res call({
    @JsonKey(name: 'OVER_GROUND') String? overGround,
    @JsonKey(name: 'THROUGH_WATER') String? throughWater,
    @JsonKey(name: 'ROT') String? rot,
  });
}

/// @nodoc
class _$ShipSpeedCopyWithImpl<$Res, $Val extends ShipSpeed>
    implements $ShipSpeedCopyWith<$Res> {
  _$ShipSpeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipSpeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overGround = freezed,
    Object? throughWater = freezed,
    Object? rot = freezed,
  }) {
    return _then(
      _value.copyWith(
            overGround: freezed == overGround
                ? _value.overGround
                : overGround // ignore: cast_nullable_to_non_nullable
                      as String?,
            throughWater: freezed == throughWater
                ? _value.throughWater
                : throughWater // ignore: cast_nullable_to_non_nullable
                      as String?,
            rot: freezed == rot
                ? _value.rot
                : rot // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipSpeedImplCopyWith<$Res>
    implements $ShipSpeedCopyWith<$Res> {
  factory _$$ShipSpeedImplCopyWith(
    _$ShipSpeedImpl value,
    $Res Function(_$ShipSpeedImpl) then,
  ) = __$$ShipSpeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'OVER_GROUND') String? overGround,
    @JsonKey(name: 'THROUGH_WATER') String? throughWater,
    @JsonKey(name: 'ROT') String? rot,
  });
}

/// @nodoc
class __$$ShipSpeedImplCopyWithImpl<$Res>
    extends _$ShipSpeedCopyWithImpl<$Res, _$ShipSpeedImpl>
    implements _$$ShipSpeedImplCopyWith<$Res> {
  __$$ShipSpeedImplCopyWithImpl(
    _$ShipSpeedImpl _value,
    $Res Function(_$ShipSpeedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipSpeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overGround = freezed,
    Object? throughWater = freezed,
    Object? rot = freezed,
  }) {
    return _then(
      _$ShipSpeedImpl(
        overGround: freezed == overGround
            ? _value.overGround
            : overGround // ignore: cast_nullable_to_non_nullable
                  as String?,
        throughWater: freezed == throughWater
            ? _value.throughWater
            : throughWater // ignore: cast_nullable_to_non_nullable
                  as String?,
        rot: freezed == rot
            ? _value.rot
            : rot // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipSpeedImpl implements _ShipSpeed {
  const _$ShipSpeedImpl({
    @JsonKey(name: 'OVER_GROUND') this.overGround,
    @JsonKey(name: 'THROUGH_WATER') this.throughWater,
    @JsonKey(name: 'ROT') this.rot,
  });

  factory _$ShipSpeedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipSpeedImplFromJson(json);

  @override
  @JsonKey(name: 'OVER_GROUND')
  final String? overGround;
  @override
  @JsonKey(name: 'THROUGH_WATER')
  final String? throughWater;
  @override
  @JsonKey(name: 'ROT')
  final String? rot;

  @override
  String toString() {
    return 'ShipSpeed(overGround: $overGround, throughWater: $throughWater, rot: $rot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipSpeedImpl &&
            (identical(other.overGround, overGround) ||
                other.overGround == overGround) &&
            (identical(other.throughWater, throughWater) ||
                other.throughWater == throughWater) &&
            (identical(other.rot, rot) || other.rot == rot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, overGround, throughWater, rot);

  /// Create a copy of ShipSpeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipSpeedImplCopyWith<_$ShipSpeedImpl> get copyWith =>
      __$$ShipSpeedImplCopyWithImpl<_$ShipSpeedImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipSpeedImplToJson(this);
  }
}

abstract class _ShipSpeed implements ShipSpeed {
  const factory _ShipSpeed({
    @JsonKey(name: 'OVER_GROUND') final String? overGround,
    @JsonKey(name: 'THROUGH_WATER') final String? throughWater,
    @JsonKey(name: 'ROT') final String? rot,
  }) = _$ShipSpeedImpl;

  factory _ShipSpeed.fromJson(Map<String, dynamic> json) =
      _$ShipSpeedImpl.fromJson;

  @override
  @JsonKey(name: 'OVER_GROUND')
  String? get overGround;
  @override
  @JsonKey(name: 'THROUGH_WATER')
  String? get throughWater;
  @override
  @JsonKey(name: 'ROT')
  String? get rot;

  /// Create a copy of ShipSpeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipSpeedImplCopyWith<_$ShipSpeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipAir _$ShipAirFromJson(Map<String, dynamic> json) {
  return _ShipAir.fromJson(json);
}

/// @nodoc
mixin _$ShipAir {
  @JsonKey(name: 'TEMPERATURE')
  String? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'HUMIDITY')
  String? get humidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'PRESSURE')
  String? get pressure => throw _privateConstructorUsedError;

  /// Serializes this ShipAir to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipAir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipAirCopyWith<ShipAir> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipAirCopyWith<$Res> {
  factory $ShipAirCopyWith(ShipAir value, $Res Function(ShipAir) then) =
      _$ShipAirCopyWithImpl<$Res, ShipAir>;
  @useResult
  $Res call({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'HUMIDITY') String? humidity,
    @JsonKey(name: 'PRESSURE') String? pressure,
  });
}

/// @nodoc
class _$ShipAirCopyWithImpl<$Res, $Val extends ShipAir>
    implements $ShipAirCopyWith<$Res> {
  _$ShipAirCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipAir
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
  }) {
    return _then(
      _value.copyWith(
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            humidity: freezed == humidity
                ? _value.humidity
                : humidity // ignore: cast_nullable_to_non_nullable
                      as String?,
            pressure: freezed == pressure
                ? _value.pressure
                : pressure // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipAirImplCopyWith<$Res> implements $ShipAirCopyWith<$Res> {
  factory _$$ShipAirImplCopyWith(
    _$ShipAirImpl value,
    $Res Function(_$ShipAirImpl) then,
  ) = __$$ShipAirImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'HUMIDITY') String? humidity,
    @JsonKey(name: 'PRESSURE') String? pressure,
  });
}

/// @nodoc
class __$$ShipAirImplCopyWithImpl<$Res>
    extends _$ShipAirCopyWithImpl<$Res, _$ShipAirImpl>
    implements _$$ShipAirImplCopyWith<$Res> {
  __$$ShipAirImplCopyWithImpl(
    _$ShipAirImpl _value,
    $Res Function(_$ShipAirImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipAir
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperature = freezed,
    Object? humidity = freezed,
    Object? pressure = freezed,
  }) {
    return _then(
      _$ShipAirImpl(
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        humidity: freezed == humidity
            ? _value.humidity
            : humidity // ignore: cast_nullable_to_non_nullable
                  as String?,
        pressure: freezed == pressure
            ? _value.pressure
            : pressure // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipAirImpl implements _ShipAir {
  const _$ShipAirImpl({
    @JsonKey(name: 'TEMPERATURE') this.temperature,
    @JsonKey(name: 'HUMIDITY') this.humidity,
    @JsonKey(name: 'PRESSURE') this.pressure,
  });

  factory _$ShipAirImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipAirImplFromJson(json);

  @override
  @JsonKey(name: 'TEMPERATURE')
  final String? temperature;
  @override
  @JsonKey(name: 'HUMIDITY')
  final String? humidity;
  @override
  @JsonKey(name: 'PRESSURE')
  final String? pressure;

  @override
  String toString() {
    return 'ShipAir(temperature: $temperature, humidity: $humidity, pressure: $pressure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipAirImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temperature, humidity, pressure);

  /// Create a copy of ShipAir
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipAirImplCopyWith<_$ShipAirImpl> get copyWith =>
      __$$ShipAirImplCopyWithImpl<_$ShipAirImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipAirImplToJson(this);
  }
}

abstract class _ShipAir implements ShipAir {
  const factory _ShipAir({
    @JsonKey(name: 'TEMPERATURE') final String? temperature,
    @JsonKey(name: 'HUMIDITY') final String? humidity,
    @JsonKey(name: 'PRESSURE') final String? pressure,
  }) = _$ShipAirImpl;

  factory _ShipAir.fromJson(Map<String, dynamic> json) = _$ShipAirImpl.fromJson;

  @override
  @JsonKey(name: 'TEMPERATURE')
  String? get temperature;
  @override
  @JsonKey(name: 'HUMIDITY')
  String? get humidity;
  @override
  @JsonKey(name: 'PRESSURE')
  String? get pressure;

  /// Create a copy of ShipAir
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipAirImplCopyWith<_$ShipAirImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipWater _$ShipWaterFromJson(Map<String, dynamic> json) {
  return _ShipWater.fromJson(json);
}

/// @nodoc
mixin _$ShipWater {
  @JsonKey(name: 'TEMPERATURE')
  String? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'DEPTH')
  String? get depth => throw _privateConstructorUsedError;

  /// Serializes this ShipWater to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipWater
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipWaterCopyWith<ShipWater> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipWaterCopyWith<$Res> {
  factory $ShipWaterCopyWith(ShipWater value, $Res Function(ShipWater) then) =
      _$ShipWaterCopyWithImpl<$Res, ShipWater>;
  @useResult
  $Res call({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'DEPTH') String? depth,
  });
}

/// @nodoc
class _$ShipWaterCopyWithImpl<$Res, $Val extends ShipWater>
    implements $ShipWaterCopyWith<$Res> {
  _$ShipWaterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipWater
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? temperature = freezed, Object? depth = freezed}) {
    return _then(
      _value.copyWith(
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            depth: freezed == depth
                ? _value.depth
                : depth // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipWaterImplCopyWith<$Res>
    implements $ShipWaterCopyWith<$Res> {
  factory _$$ShipWaterImplCopyWith(
    _$ShipWaterImpl value,
    $Res Function(_$ShipWaterImpl) then,
  ) = __$$ShipWaterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'DEPTH') String? depth,
  });
}

/// @nodoc
class __$$ShipWaterImplCopyWithImpl<$Res>
    extends _$ShipWaterCopyWithImpl<$Res, _$ShipWaterImpl>
    implements _$$ShipWaterImplCopyWith<$Res> {
  __$$ShipWaterImplCopyWithImpl(
    _$ShipWaterImpl _value,
    $Res Function(_$ShipWaterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipWater
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? temperature = freezed, Object? depth = freezed}) {
    return _then(
      _$ShipWaterImpl(
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        depth: freezed == depth
            ? _value.depth
            : depth // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipWaterImpl implements _ShipWater {
  const _$ShipWaterImpl({
    @JsonKey(name: 'TEMPERATURE') this.temperature,
    @JsonKey(name: 'DEPTH') this.depth,
  });

  factory _$ShipWaterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipWaterImplFromJson(json);

  @override
  @JsonKey(name: 'TEMPERATURE')
  final String? temperature;
  @override
  @JsonKey(name: 'DEPTH')
  final String? depth;

  @override
  String toString() {
    return 'ShipWater(temperature: $temperature, depth: $depth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipWaterImpl &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temperature, depth);

  /// Create a copy of ShipWater
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipWaterImplCopyWith<_$ShipWaterImpl> get copyWith =>
      __$$ShipWaterImplCopyWithImpl<_$ShipWaterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipWaterImplToJson(this);
  }
}

abstract class _ShipWater implements ShipWater {
  const factory _ShipWater({
    @JsonKey(name: 'TEMPERATURE') final String? temperature,
    @JsonKey(name: 'DEPTH') final String? depth,
  }) = _$ShipWaterImpl;

  factory _ShipWater.fromJson(Map<String, dynamic> json) =
      _$ShipWaterImpl.fromJson;

  @override
  @JsonKey(name: 'TEMPERATURE')
  String? get temperature;
  @override
  @JsonKey(name: 'DEPTH')
  String? get depth;

  /// Create a copy of ShipWater
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipWaterImplCopyWith<_$ShipWaterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipDirection _$ShipDirectionFromJson(Map<String, dynamic> json) {
  return _ShipDirection.fromJson(json);
}

/// @nodoc
mixin _$ShipDirection {
  @JsonKey(name: 'HEADING')
  String? get heading => throw _privateConstructorUsedError;
  @JsonKey(name: 'COURSE')
  String? get course => throw _privateConstructorUsedError;

  /// Serializes this ShipDirection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipDirection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipDirectionCopyWith<ShipDirection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipDirectionCopyWith<$Res> {
  factory $ShipDirectionCopyWith(
    ShipDirection value,
    $Res Function(ShipDirection) then,
  ) = _$ShipDirectionCopyWithImpl<$Res, ShipDirection>;
  @useResult
  $Res call({
    @JsonKey(name: 'HEADING') String? heading,
    @JsonKey(name: 'COURSE') String? course,
  });
}

/// @nodoc
class _$ShipDirectionCopyWithImpl<$Res, $Val extends ShipDirection>
    implements $ShipDirectionCopyWith<$Res> {
  _$ShipDirectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipDirection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? heading = freezed, Object? course = freezed}) {
    return _then(
      _value.copyWith(
            heading: freezed == heading
                ? _value.heading
                : heading // ignore: cast_nullable_to_non_nullable
                      as String?,
            course: freezed == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipDirectionImplCopyWith<$Res>
    implements $ShipDirectionCopyWith<$Res> {
  factory _$$ShipDirectionImplCopyWith(
    _$ShipDirectionImpl value,
    $Res Function(_$ShipDirectionImpl) then,
  ) = __$$ShipDirectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'HEADING') String? heading,
    @JsonKey(name: 'COURSE') String? course,
  });
}

/// @nodoc
class __$$ShipDirectionImplCopyWithImpl<$Res>
    extends _$ShipDirectionCopyWithImpl<$Res, _$ShipDirectionImpl>
    implements _$$ShipDirectionImplCopyWith<$Res> {
  __$$ShipDirectionImplCopyWithImpl(
    _$ShipDirectionImpl _value,
    $Res Function(_$ShipDirectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipDirection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? heading = freezed, Object? course = freezed}) {
    return _then(
      _$ShipDirectionImpl(
        heading: freezed == heading
            ? _value.heading
            : heading // ignore: cast_nullable_to_non_nullable
                  as String?,
        course: freezed == course
            ? _value.course
            : course // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipDirectionImpl implements _ShipDirection {
  const _$ShipDirectionImpl({
    @JsonKey(name: 'HEADING') this.heading,
    @JsonKey(name: 'COURSE') this.course,
  });

  factory _$ShipDirectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipDirectionImplFromJson(json);

  @override
  @JsonKey(name: 'HEADING')
  final String? heading;
  @override
  @JsonKey(name: 'COURSE')
  final String? course;

  @override
  String toString() {
    return 'ShipDirection(heading: $heading, course: $course)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipDirectionImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.course, course) || other.course == course));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heading, course);

  /// Create a copy of ShipDirection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipDirectionImplCopyWith<_$ShipDirectionImpl> get copyWith =>
      __$$ShipDirectionImplCopyWithImpl<_$ShipDirectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipDirectionImplToJson(this);
  }
}

abstract class _ShipDirection implements ShipDirection {
  const factory _ShipDirection({
    @JsonKey(name: 'HEADING') final String? heading,
    @JsonKey(name: 'COURSE') final String? course,
  }) = _$ShipDirectionImpl;

  factory _ShipDirection.fromJson(Map<String, dynamic> json) =
      _$ShipDirectionImpl.fromJson;

  @override
  @JsonKey(name: 'HEADING')
  String? get heading;
  @override
  @JsonKey(name: 'COURSE')
  String? get course;

  /// Create a copy of ShipDirection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipDirectionImplCopyWith<_$ShipDirectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipSuntime _$ShipSuntimeFromJson(Map<String, dynamic> json) {
  return _ShipSuntime.fromJson(json);
}

/// @nodoc
mixin _$ShipSuntime {
  @JsonKey(name: 'SUNRISE')
  String? get sunrise => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUNSET')
  String? get sunset => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUNNOON')
  String? get sunnoon => throw _privateConstructorUsedError;

  /// Serializes this ShipSuntime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipSuntime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipSuntimeCopyWith<ShipSuntime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipSuntimeCopyWith<$Res> {
  factory $ShipSuntimeCopyWith(
    ShipSuntime value,
    $Res Function(ShipSuntime) then,
  ) = _$ShipSuntimeCopyWithImpl<$Res, ShipSuntime>;
  @useResult
  $Res call({
    @JsonKey(name: 'SUNRISE') String? sunrise,
    @JsonKey(name: 'SUNSET') String? sunset,
    @JsonKey(name: 'SUNNOON') String? sunnoon,
  });
}

/// @nodoc
class _$ShipSuntimeCopyWithImpl<$Res, $Val extends ShipSuntime>
    implements $ShipSuntimeCopyWith<$Res> {
  _$ShipSuntimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipSuntime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? sunnoon = freezed,
  }) {
    return _then(
      _value.copyWith(
            sunrise: freezed == sunrise
                ? _value.sunrise
                : sunrise // ignore: cast_nullable_to_non_nullable
                      as String?,
            sunset: freezed == sunset
                ? _value.sunset
                : sunset // ignore: cast_nullable_to_non_nullable
                      as String?,
            sunnoon: freezed == sunnoon
                ? _value.sunnoon
                : sunnoon // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ShipSuntimeImplCopyWith<$Res>
    implements $ShipSuntimeCopyWith<$Res> {
  factory _$$ShipSuntimeImplCopyWith(
    _$ShipSuntimeImpl value,
    $Res Function(_$ShipSuntimeImpl) then,
  ) = __$$ShipSuntimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'SUNRISE') String? sunrise,
    @JsonKey(name: 'SUNSET') String? sunset,
    @JsonKey(name: 'SUNNOON') String? sunnoon,
  });
}

/// @nodoc
class __$$ShipSuntimeImplCopyWithImpl<$Res>
    extends _$ShipSuntimeCopyWithImpl<$Res, _$ShipSuntimeImpl>
    implements _$$ShipSuntimeImplCopyWith<$Res> {
  __$$ShipSuntimeImplCopyWithImpl(
    _$ShipSuntimeImpl _value,
    $Res Function(_$ShipSuntimeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipSuntime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sunrise = freezed,
    Object? sunset = freezed,
    Object? sunnoon = freezed,
  }) {
    return _then(
      _$ShipSuntimeImpl(
        sunrise: freezed == sunrise
            ? _value.sunrise
            : sunrise // ignore: cast_nullable_to_non_nullable
                  as String?,
        sunset: freezed == sunset
            ? _value.sunset
            : sunset // ignore: cast_nullable_to_non_nullable
                  as String?,
        sunnoon: freezed == sunnoon
            ? _value.sunnoon
            : sunnoon // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipSuntimeImpl implements _ShipSuntime {
  const _$ShipSuntimeImpl({
    @JsonKey(name: 'SUNRISE') this.sunrise,
    @JsonKey(name: 'SUNSET') this.sunset,
    @JsonKey(name: 'SUNNOON') this.sunnoon,
  });

  factory _$ShipSuntimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipSuntimeImplFromJson(json);

  @override
  @JsonKey(name: 'SUNRISE')
  final String? sunrise;
  @override
  @JsonKey(name: 'SUNSET')
  final String? sunset;
  @override
  @JsonKey(name: 'SUNNOON')
  final String? sunnoon;

  @override
  String toString() {
    return 'ShipSuntime(sunrise: $sunrise, sunset: $sunset, sunnoon: $sunnoon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipSuntimeImpl &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.sunnoon, sunnoon) || other.sunnoon == sunnoon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sunrise, sunset, sunnoon);

  /// Create a copy of ShipSuntime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipSuntimeImplCopyWith<_$ShipSuntimeImpl> get copyWith =>
      __$$ShipSuntimeImplCopyWithImpl<_$ShipSuntimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipSuntimeImplToJson(this);
  }
}

abstract class _ShipSuntime implements ShipSuntime {
  const factory _ShipSuntime({
    @JsonKey(name: 'SUNRISE') final String? sunrise,
    @JsonKey(name: 'SUNSET') final String? sunset,
    @JsonKey(name: 'SUNNOON') final String? sunnoon,
  }) = _$ShipSuntimeImpl;

  factory _ShipSuntime.fromJson(Map<String, dynamic> json) =
      _$ShipSuntimeImpl.fromJson;

  @override
  @JsonKey(name: 'SUNRISE')
  String? get sunrise;
  @override
  @JsonKey(name: 'SUNSET')
  String? get sunset;
  @override
  @JsonKey(name: 'SUNNOON')
  String? get sunnoon;

  /// Create a copy of ShipSuntime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipSuntimeImplCopyWith<_$ShipSuntimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return _WeatherForecast.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecast {
  String? get date => throw _privateConstructorUsedError;
  String? get temperature => throw _privateConstructorUsedError;
  String? get weather => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
    WeatherForecast value,
    $Res Function(WeatherForecast) then,
  ) = _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call({String? date, String? temperature, String? weather});
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? temperature = freezed,
    Object? weather = freezed,
  }) {
    return _then(
      _value.copyWith(
            date: freezed == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String?,
            temperature: freezed == temperature
                ? _value.temperature
                : temperature // ignore: cast_nullable_to_non_nullable
                      as String?,
            weather: freezed == weather
                ? _value.weather
                : weather // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(
    _$WeatherForecastImpl value,
    $Res Function(_$WeatherForecastImpl) then,
  ) = __$$WeatherForecastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? date, String? temperature, String? weather});
}

/// @nodoc
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
    _$WeatherForecastImpl _value,
    $Res Function(_$WeatherForecastImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? temperature = freezed,
    Object? weather = freezed,
  }) {
    return _then(
      _$WeatherForecastImpl(
        date: freezed == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String?,
        temperature: freezed == temperature
            ? _value.temperature
            : temperature // ignore: cast_nullable_to_non_nullable
                  as String?,
        weather: freezed == weather
            ? _value.weather
            : weather // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastImpl implements _WeatherForecast {
  const _$WeatherForecastImpl({this.date, this.temperature, this.weather});

  factory _$WeatherForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastImplFromJson(json);

  @override
  final String? date;
  @override
  final String? temperature;
  @override
  final String? weather;

  @override
  String toString() {
    return 'WeatherForecast(date: $date, temperature: $temperature, weather: $weather)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.weather, weather) || other.weather == weather));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, temperature, weather);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastImplToJson(this);
  }
}

abstract class _WeatherForecast implements WeatherForecast {
  const factory _WeatherForecast({
    final String? date,
    final String? temperature,
    final String? weather,
  }) = _$WeatherForecastImpl;

  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastImpl.fromJson;

  @override
  String? get date;
  @override
  String? get temperature;
  @override
  String? get weather;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipDataInner _$ShipDataInnerFromJson(Map<String, dynamic> json) {
  return _ShipDataInner.fromJson(json);
}

/// @nodoc
mixin _$ShipDataInner {
  @JsonKey(name: 'WIND')
  ShipWind? get wind => throw _privateConstructorUsedError;
  @JsonKey(name: 'POSITION')
  ShipPosition? get position => throw _privateConstructorUsedError;
  @JsonKey(name: 'NAUTIC')
  ShipNautic? get nautic => throw _privateConstructorUsedError;
  @JsonKey(name: 'SHIP_SPEED')
  ShipSpeed? get speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'AIR')
  ShipAir? get air => throw _privateConstructorUsedError;
  @JsonKey(name: 'WATER')
  ShipWater? get water => throw _privateConstructorUsedError;
  @JsonKey(name: 'SHIP_DIRECTION')
  ShipDirection? get direction => throw _privateConstructorUsedError;
  @JsonKey(name: 'SUNTIME')
  ShipSuntime? get suntime => throw _privateConstructorUsedError;
  @JsonKey(name: 'WEATHER_FORECAST')
  List<WeatherForecast> get weatherForecast =>
      throw _privateConstructorUsedError;

  /// Serializes this ShipDataInner to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipDataInnerCopyWith<ShipDataInner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipDataInnerCopyWith<$Res> {
  factory $ShipDataInnerCopyWith(
    ShipDataInner value,
    $Res Function(ShipDataInner) then,
  ) = _$ShipDataInnerCopyWithImpl<$Res, ShipDataInner>;
  @useResult
  $Res call({
    @JsonKey(name: 'WIND') ShipWind? wind,
    @JsonKey(name: 'POSITION') ShipPosition? position,
    @JsonKey(name: 'NAUTIC') ShipNautic? nautic,
    @JsonKey(name: 'SHIP_SPEED') ShipSpeed? speed,
    @JsonKey(name: 'AIR') ShipAir? air,
    @JsonKey(name: 'WATER') ShipWater? water,
    @JsonKey(name: 'SHIP_DIRECTION') ShipDirection? direction,
    @JsonKey(name: 'SUNTIME') ShipSuntime? suntime,
    @JsonKey(name: 'WEATHER_FORECAST') List<WeatherForecast> weatherForecast,
  });

  $ShipWindCopyWith<$Res>? get wind;
  $ShipPositionCopyWith<$Res>? get position;
  $ShipNauticCopyWith<$Res>? get nautic;
  $ShipSpeedCopyWith<$Res>? get speed;
  $ShipAirCopyWith<$Res>? get air;
  $ShipWaterCopyWith<$Res>? get water;
  $ShipDirectionCopyWith<$Res>? get direction;
  $ShipSuntimeCopyWith<$Res>? get suntime;
}

/// @nodoc
class _$ShipDataInnerCopyWithImpl<$Res, $Val extends ShipDataInner>
    implements $ShipDataInnerCopyWith<$Res> {
  _$ShipDataInnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wind = freezed,
    Object? position = freezed,
    Object? nautic = freezed,
    Object? speed = freezed,
    Object? air = freezed,
    Object? water = freezed,
    Object? direction = freezed,
    Object? suntime = freezed,
    Object? weatherForecast = null,
  }) {
    return _then(
      _value.copyWith(
            wind: freezed == wind
                ? _value.wind
                : wind // ignore: cast_nullable_to_non_nullable
                      as ShipWind?,
            position: freezed == position
                ? _value.position
                : position // ignore: cast_nullable_to_non_nullable
                      as ShipPosition?,
            nautic: freezed == nautic
                ? _value.nautic
                : nautic // ignore: cast_nullable_to_non_nullable
                      as ShipNautic?,
            speed: freezed == speed
                ? _value.speed
                : speed // ignore: cast_nullable_to_non_nullable
                      as ShipSpeed?,
            air: freezed == air
                ? _value.air
                : air // ignore: cast_nullable_to_non_nullable
                      as ShipAir?,
            water: freezed == water
                ? _value.water
                : water // ignore: cast_nullable_to_non_nullable
                      as ShipWater?,
            direction: freezed == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as ShipDirection?,
            suntime: freezed == suntime
                ? _value.suntime
                : suntime // ignore: cast_nullable_to_non_nullable
                      as ShipSuntime?,
            weatherForecast: null == weatherForecast
                ? _value.weatherForecast
                : weatherForecast // ignore: cast_nullable_to_non_nullable
                      as List<WeatherForecast>,
          )
          as $Val,
    );
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipWindCopyWith<$Res>? get wind {
    if (_value.wind == null) {
      return null;
    }

    return $ShipWindCopyWith<$Res>(_value.wind!, (value) {
      return _then(_value.copyWith(wind: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipPositionCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $ShipPositionCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipNauticCopyWith<$Res>? get nautic {
    if (_value.nautic == null) {
      return null;
    }

    return $ShipNauticCopyWith<$Res>(_value.nautic!, (value) {
      return _then(_value.copyWith(nautic: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipSpeedCopyWith<$Res>? get speed {
    if (_value.speed == null) {
      return null;
    }

    return $ShipSpeedCopyWith<$Res>(_value.speed!, (value) {
      return _then(_value.copyWith(speed: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipAirCopyWith<$Res>? get air {
    if (_value.air == null) {
      return null;
    }

    return $ShipAirCopyWith<$Res>(_value.air!, (value) {
      return _then(_value.copyWith(air: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipWaterCopyWith<$Res>? get water {
    if (_value.water == null) {
      return null;
    }

    return $ShipWaterCopyWith<$Res>(_value.water!, (value) {
      return _then(_value.copyWith(water: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipDirectionCopyWith<$Res>? get direction {
    if (_value.direction == null) {
      return null;
    }

    return $ShipDirectionCopyWith<$Res>(_value.direction!, (value) {
      return _then(_value.copyWith(direction: value) as $Val);
    });
  }

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipSuntimeCopyWith<$Res>? get suntime {
    if (_value.suntime == null) {
      return null;
    }

    return $ShipSuntimeCopyWith<$Res>(_value.suntime!, (value) {
      return _then(_value.copyWith(suntime: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipDataInnerImplCopyWith<$Res>
    implements $ShipDataInnerCopyWith<$Res> {
  factory _$$ShipDataInnerImplCopyWith(
    _$ShipDataInnerImpl value,
    $Res Function(_$ShipDataInnerImpl) then,
  ) = __$$ShipDataInnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'WIND') ShipWind? wind,
    @JsonKey(name: 'POSITION') ShipPosition? position,
    @JsonKey(name: 'NAUTIC') ShipNautic? nautic,
    @JsonKey(name: 'SHIP_SPEED') ShipSpeed? speed,
    @JsonKey(name: 'AIR') ShipAir? air,
    @JsonKey(name: 'WATER') ShipWater? water,
    @JsonKey(name: 'SHIP_DIRECTION') ShipDirection? direction,
    @JsonKey(name: 'SUNTIME') ShipSuntime? suntime,
    @JsonKey(name: 'WEATHER_FORECAST') List<WeatherForecast> weatherForecast,
  });

  @override
  $ShipWindCopyWith<$Res>? get wind;
  @override
  $ShipPositionCopyWith<$Res>? get position;
  @override
  $ShipNauticCopyWith<$Res>? get nautic;
  @override
  $ShipSpeedCopyWith<$Res>? get speed;
  @override
  $ShipAirCopyWith<$Res>? get air;
  @override
  $ShipWaterCopyWith<$Res>? get water;
  @override
  $ShipDirectionCopyWith<$Res>? get direction;
  @override
  $ShipSuntimeCopyWith<$Res>? get suntime;
}

/// @nodoc
class __$$ShipDataInnerImplCopyWithImpl<$Res>
    extends _$ShipDataInnerCopyWithImpl<$Res, _$ShipDataInnerImpl>
    implements _$$ShipDataInnerImplCopyWith<$Res> {
  __$$ShipDataInnerImplCopyWithImpl(
    _$ShipDataInnerImpl _value,
    $Res Function(_$ShipDataInnerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wind = freezed,
    Object? position = freezed,
    Object? nautic = freezed,
    Object? speed = freezed,
    Object? air = freezed,
    Object? water = freezed,
    Object? direction = freezed,
    Object? suntime = freezed,
    Object? weatherForecast = null,
  }) {
    return _then(
      _$ShipDataInnerImpl(
        wind: freezed == wind
            ? _value.wind
            : wind // ignore: cast_nullable_to_non_nullable
                  as ShipWind?,
        position: freezed == position
            ? _value.position
            : position // ignore: cast_nullable_to_non_nullable
                  as ShipPosition?,
        nautic: freezed == nautic
            ? _value.nautic
            : nautic // ignore: cast_nullable_to_non_nullable
                  as ShipNautic?,
        speed: freezed == speed
            ? _value.speed
            : speed // ignore: cast_nullable_to_non_nullable
                  as ShipSpeed?,
        air: freezed == air
            ? _value.air
            : air // ignore: cast_nullable_to_non_nullable
                  as ShipAir?,
        water: freezed == water
            ? _value.water
            : water // ignore: cast_nullable_to_non_nullable
                  as ShipWater?,
        direction: freezed == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as ShipDirection?,
        suntime: freezed == suntime
            ? _value.suntime
            : suntime // ignore: cast_nullable_to_non_nullable
                  as ShipSuntime?,
        weatherForecast: null == weatherForecast
            ? _value._weatherForecast
            : weatherForecast // ignore: cast_nullable_to_non_nullable
                  as List<WeatherForecast>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipDataInnerImpl implements _ShipDataInner {
  const _$ShipDataInnerImpl({
    @JsonKey(name: 'WIND') this.wind,
    @JsonKey(name: 'POSITION') this.position,
    @JsonKey(name: 'NAUTIC') this.nautic,
    @JsonKey(name: 'SHIP_SPEED') this.speed,
    @JsonKey(name: 'AIR') this.air,
    @JsonKey(name: 'WATER') this.water,
    @JsonKey(name: 'SHIP_DIRECTION') this.direction,
    @JsonKey(name: 'SUNTIME') this.suntime,
    @JsonKey(name: 'WEATHER_FORECAST')
    final List<WeatherForecast> weatherForecast = const [],
  }) : _weatherForecast = weatherForecast;

  factory _$ShipDataInnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipDataInnerImplFromJson(json);

  @override
  @JsonKey(name: 'WIND')
  final ShipWind? wind;
  @override
  @JsonKey(name: 'POSITION')
  final ShipPosition? position;
  @override
  @JsonKey(name: 'NAUTIC')
  final ShipNautic? nautic;
  @override
  @JsonKey(name: 'SHIP_SPEED')
  final ShipSpeed? speed;
  @override
  @JsonKey(name: 'AIR')
  final ShipAir? air;
  @override
  @JsonKey(name: 'WATER')
  final ShipWater? water;
  @override
  @JsonKey(name: 'SHIP_DIRECTION')
  final ShipDirection? direction;
  @override
  @JsonKey(name: 'SUNTIME')
  final ShipSuntime? suntime;
  final List<WeatherForecast> _weatherForecast;
  @override
  @JsonKey(name: 'WEATHER_FORECAST')
  List<WeatherForecast> get weatherForecast {
    if (_weatherForecast is EqualUnmodifiableListView) return _weatherForecast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weatherForecast);
  }

  @override
  String toString() {
    return 'ShipDataInner(wind: $wind, position: $position, nautic: $nautic, speed: $speed, air: $air, water: $water, direction: $direction, suntime: $suntime, weatherForecast: $weatherForecast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipDataInnerImpl &&
            (identical(other.wind, wind) || other.wind == wind) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.nautic, nautic) || other.nautic == nautic) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.air, air) || other.air == air) &&
            (identical(other.water, water) || other.water == water) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.suntime, suntime) || other.suntime == suntime) &&
            const DeepCollectionEquality().equals(
              other._weatherForecast,
              _weatherForecast,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    wind,
    position,
    nautic,
    speed,
    air,
    water,
    direction,
    suntime,
    const DeepCollectionEquality().hash(_weatherForecast),
  );

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipDataInnerImplCopyWith<_$ShipDataInnerImpl> get copyWith =>
      __$$ShipDataInnerImplCopyWithImpl<_$ShipDataInnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipDataInnerImplToJson(this);
  }
}

abstract class _ShipDataInner implements ShipDataInner {
  const factory _ShipDataInner({
    @JsonKey(name: 'WIND') final ShipWind? wind,
    @JsonKey(name: 'POSITION') final ShipPosition? position,
    @JsonKey(name: 'NAUTIC') final ShipNautic? nautic,
    @JsonKey(name: 'SHIP_SPEED') final ShipSpeed? speed,
    @JsonKey(name: 'AIR') final ShipAir? air,
    @JsonKey(name: 'WATER') final ShipWater? water,
    @JsonKey(name: 'SHIP_DIRECTION') final ShipDirection? direction,
    @JsonKey(name: 'SUNTIME') final ShipSuntime? suntime,
    @JsonKey(name: 'WEATHER_FORECAST')
    final List<WeatherForecast> weatherForecast,
  }) = _$ShipDataInnerImpl;

  factory _ShipDataInner.fromJson(Map<String, dynamic> json) =
      _$ShipDataInnerImpl.fromJson;

  @override
  @JsonKey(name: 'WIND')
  ShipWind? get wind;
  @override
  @JsonKey(name: 'POSITION')
  ShipPosition? get position;
  @override
  @JsonKey(name: 'NAUTIC')
  ShipNautic? get nautic;
  @override
  @JsonKey(name: 'SHIP_SPEED')
  ShipSpeed? get speed;
  @override
  @JsonKey(name: 'AIR')
  ShipAir? get air;
  @override
  @JsonKey(name: 'WATER')
  ShipWater? get water;
  @override
  @JsonKey(name: 'SHIP_DIRECTION')
  ShipDirection? get direction;
  @override
  @JsonKey(name: 'SUNTIME')
  ShipSuntime? get suntime;
  @override
  @JsonKey(name: 'WEATHER_FORECAST')
  List<WeatherForecast> get weatherForecast;

  /// Create a copy of ShipDataInner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipDataInnerImplCopyWith<_$ShipDataInnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipDataWrapper _$ShipDataWrapperFromJson(Map<String, dynamic> json) {
  return _ShipDataWrapper.fromJson(json);
}

/// @nodoc
mixin _$ShipDataWrapper {
  @JsonKey(name: 'SHIP_DATA')
  ShipDataInner? get shipData => throw _privateConstructorUsedError;

  /// Serializes this ShipDataWrapper to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipDataWrapperCopyWith<ShipDataWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipDataWrapperCopyWith<$Res> {
  factory $ShipDataWrapperCopyWith(
    ShipDataWrapper value,
    $Res Function(ShipDataWrapper) then,
  ) = _$ShipDataWrapperCopyWithImpl<$Res, ShipDataWrapper>;
  @useResult
  $Res call({@JsonKey(name: 'SHIP_DATA') ShipDataInner? shipData});

  $ShipDataInnerCopyWith<$Res>? get shipData;
}

/// @nodoc
class _$ShipDataWrapperCopyWithImpl<$Res, $Val extends ShipDataWrapper>
    implements $ShipDataWrapperCopyWith<$Res> {
  _$ShipDataWrapperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shipData = freezed}) {
    return _then(
      _value.copyWith(
            shipData: freezed == shipData
                ? _value.shipData
                : shipData // ignore: cast_nullable_to_non_nullable
                      as ShipDataInner?,
          )
          as $Val,
    );
  }

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipDataInnerCopyWith<$Res>? get shipData {
    if (_value.shipData == null) {
      return null;
    }

    return $ShipDataInnerCopyWith<$Res>(_value.shipData!, (value) {
      return _then(_value.copyWith(shipData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipDataWrapperImplCopyWith<$Res>
    implements $ShipDataWrapperCopyWith<$Res> {
  factory _$$ShipDataWrapperImplCopyWith(
    _$ShipDataWrapperImpl value,
    $Res Function(_$ShipDataWrapperImpl) then,
  ) = __$$ShipDataWrapperImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'SHIP_DATA') ShipDataInner? shipData});

  @override
  $ShipDataInnerCopyWith<$Res>? get shipData;
}

/// @nodoc
class __$$ShipDataWrapperImplCopyWithImpl<$Res>
    extends _$ShipDataWrapperCopyWithImpl<$Res, _$ShipDataWrapperImpl>
    implements _$$ShipDataWrapperImplCopyWith<$Res> {
  __$$ShipDataWrapperImplCopyWithImpl(
    _$ShipDataWrapperImpl _value,
    $Res Function(_$ShipDataWrapperImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? shipData = freezed}) {
    return _then(
      _$ShipDataWrapperImpl(
        shipData: freezed == shipData
            ? _value.shipData
            : shipData // ignore: cast_nullable_to_non_nullable
                  as ShipDataInner?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipDataWrapperImpl implements _ShipDataWrapper {
  const _$ShipDataWrapperImpl({@JsonKey(name: 'SHIP_DATA') this.shipData});

  factory _$ShipDataWrapperImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipDataWrapperImplFromJson(json);

  @override
  @JsonKey(name: 'SHIP_DATA')
  final ShipDataInner? shipData;

  @override
  String toString() {
    return 'ShipDataWrapper(shipData: $shipData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipDataWrapperImpl &&
            (identical(other.shipData, shipData) ||
                other.shipData == shipData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, shipData);

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipDataWrapperImplCopyWith<_$ShipDataWrapperImpl> get copyWith =>
      __$$ShipDataWrapperImplCopyWithImpl<_$ShipDataWrapperImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipDataWrapperImplToJson(this);
  }
}

abstract class _ShipDataWrapper implements ShipDataWrapper {
  const factory _ShipDataWrapper({
    @JsonKey(name: 'SHIP_DATA') final ShipDataInner? shipData,
  }) = _$ShipDataWrapperImpl;

  factory _ShipDataWrapper.fromJson(Map<String, dynamic> json) =
      _$ShipDataWrapperImpl.fromJson;

  @override
  @JsonKey(name: 'SHIP_DATA')
  ShipDataInner? get shipData;

  /// Create a copy of ShipDataWrapper
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipDataWrapperImplCopyWith<_$ShipDataWrapperImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShipDataResponse _$ShipDataResponseFromJson(Map<String, dynamic> json) {
  return _ShipDataResponse.fromJson(json);
}

/// @nodoc
mixin _$ShipDataResponse {
  ShipDataWrapper? get data => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this ShipDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShipDataResponseCopyWith<ShipDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShipDataResponseCopyWith<$Res> {
  factory $ShipDataResponseCopyWith(
    ShipDataResponse value,
    $Res Function(ShipDataResponse) then,
  ) = _$ShipDataResponseCopyWithImpl<$Res, ShipDataResponse>;
  @useResult
  $Res call({ShipDataWrapper? data, List<String> messages, bool success});

  $ShipDataWrapperCopyWith<$Res>? get data;
}

/// @nodoc
class _$ShipDataResponseCopyWithImpl<$Res, $Val extends ShipDataResponse>
    implements $ShipDataResponseCopyWith<$Res> {
  _$ShipDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? messages = null,
    Object? success = null,
  }) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ShipDataWrapper?,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShipDataWrapperCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ShipDataWrapperCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ShipDataResponseImplCopyWith<$Res>
    implements $ShipDataResponseCopyWith<$Res> {
  factory _$$ShipDataResponseImplCopyWith(
    _$ShipDataResponseImpl value,
    $Res Function(_$ShipDataResponseImpl) then,
  ) = __$$ShipDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ShipDataWrapper? data, List<String> messages, bool success});

  @override
  $ShipDataWrapperCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ShipDataResponseImplCopyWithImpl<$Res>
    extends _$ShipDataResponseCopyWithImpl<$Res, _$ShipDataResponseImpl>
    implements _$$ShipDataResponseImplCopyWith<$Res> {
  __$$ShipDataResponseImplCopyWithImpl(
    _$ShipDataResponseImpl _value,
    $Res Function(_$ShipDataResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? messages = null,
    Object? success = null,
  }) {
    return _then(
      _$ShipDataResponseImpl(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ShipDataWrapper?,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ShipDataResponseImpl implements _ShipDataResponse {
  const _$ShipDataResponseImpl({
    this.data,
    final List<String> messages = const [],
    this.success = false,
  }) : _messages = messages;

  factory _$ShipDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShipDataResponseImplFromJson(json);

  @override
  final ShipDataWrapper? data;
  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'ShipDataResponse(data: $data, messages: $messages, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShipDataResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    data,
    const DeepCollectionEquality().hash(_messages),
    success,
  );

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShipDataResponseImplCopyWith<_$ShipDataResponseImpl> get copyWith =>
      __$$ShipDataResponseImplCopyWithImpl<_$ShipDataResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ShipDataResponseImplToJson(this);
  }
}

abstract class _ShipDataResponse implements ShipDataResponse {
  const factory _ShipDataResponse({
    final ShipDataWrapper? data,
    final List<String> messages,
    final bool success,
  }) = _$ShipDataResponseImpl;

  factory _ShipDataResponse.fromJson(Map<String, dynamic> json) =
      _$ShipDataResponseImpl.fromJson;

  @override
  ShipDataWrapper? get data;
  @override
  List<String> get messages;
  @override
  bool get success;

  /// Create a copy of ShipDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShipDataResponseImplCopyWith<_$ShipDataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
