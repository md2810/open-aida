// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itinerary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PortGeoLocation _$PortGeoLocationFromJson(Map<String, dynamic> json) {
  return _PortGeoLocation.fromJson(json);
}

/// @nodoc
mixin _$PortGeoLocation {
  String? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;

  /// Serializes this PortGeoLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortGeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortGeoLocationCopyWith<PortGeoLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortGeoLocationCopyWith<$Res> {
  factory $PortGeoLocationCopyWith(
    PortGeoLocation value,
    $Res Function(PortGeoLocation) then,
  ) = _$PortGeoLocationCopyWithImpl<$Res, PortGeoLocation>;
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class _$PortGeoLocationCopyWithImpl<$Res, $Val extends PortGeoLocation>
    implements $PortGeoLocationCopyWith<$Res> {
  _$PortGeoLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortGeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = freezed, Object? longitude = freezed}) {
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortGeoLocationImplCopyWith<$Res>
    implements $PortGeoLocationCopyWith<$Res> {
  factory _$$PortGeoLocationImplCopyWith(
    _$PortGeoLocationImpl value,
    $Res Function(_$PortGeoLocationImpl) then,
  ) = __$$PortGeoLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class __$$PortGeoLocationImplCopyWithImpl<$Res>
    extends _$PortGeoLocationCopyWithImpl<$Res, _$PortGeoLocationImpl>
    implements _$$PortGeoLocationImplCopyWith<$Res> {
  __$$PortGeoLocationImplCopyWithImpl(
    _$PortGeoLocationImpl _value,
    $Res Function(_$PortGeoLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortGeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? latitude = freezed, Object? longitude = freezed}) {
    return _then(
      _$PortGeoLocationImpl(
        latitude: freezed == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as String?,
        longitude: freezed == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortGeoLocationImpl implements _PortGeoLocation {
  const _$PortGeoLocationImpl({this.latitude, this.longitude});

  factory _$PortGeoLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortGeoLocationImplFromJson(json);

  @override
  final String? latitude;
  @override
  final String? longitude;

  @override
  String toString() {
    return 'PortGeoLocation(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortGeoLocationImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  /// Create a copy of PortGeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortGeoLocationImplCopyWith<_$PortGeoLocationImpl> get copyWith =>
      __$$PortGeoLocationImplCopyWithImpl<_$PortGeoLocationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortGeoLocationImplToJson(this);
  }
}

abstract class _PortGeoLocation implements PortGeoLocation {
  const factory _PortGeoLocation({
    final String? latitude,
    final String? longitude,
  }) = _$PortGeoLocationImpl;

  factory _PortGeoLocation.fromJson(Map<String, dynamic> json) =
      _$PortGeoLocationImpl.fromJson;

  @override
  String? get latitude;
  @override
  String? get longitude;

  /// Create a copy of PortGeoLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortGeoLocationImplCopyWith<_$PortGeoLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItineraryPort _$ItineraryPortFromJson(Map<String, dynamic> json) {
  return _ItineraryPort.fromJson(json);
}

/// @nodoc
mixin _$ItineraryPort {
  String? get arrivaltime => throw _privateConstructorUsedError;
  LocalizedDateTime? get arrivaltimeLocalized =>
      throw _privateConstructorUsedError;
  String? get ashoretime => throw _privateConstructorUsedError;
  LocalizedDateTime? get ashoretimeLocalized =>
      throw _privateConstructorUsedError;
  String? get berthName => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  LocalizedDateTime? get dateLocalized => throw _privateConstructorUsedError;
  String? get day => throw _privateConstructorUsedError;
  String? get departuretime => throw _privateConstructorUsedError;
  LocalizedDateTime? get departuretimeLocalized =>
      throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get gangwayDeck => throw _privateConstructorUsedError;
  PortGeoLocation? get geolocation => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get onboardtime => throw _privateConstructorUsedError;
  LocalizedDateTime? get onboardtimeLocalized =>
      throw _privateConstructorUsedError;
  bool get seaday => throw _privateConstructorUsedError;
  bool get tender => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;

  /// Serializes this ItineraryPort to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryPortCopyWith<ItineraryPort> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryPortCopyWith<$Res> {
  factory $ItineraryPortCopyWith(
    ItineraryPort value,
    $Res Function(ItineraryPort) then,
  ) = _$ItineraryPortCopyWithImpl<$Res, ItineraryPort>;
  @useResult
  $Res call({
    String? arrivaltime,
    LocalizedDateTime? arrivaltimeLocalized,
    String? ashoretime,
    LocalizedDateTime? ashoretimeLocalized,
    String? berthName,
    String? code,
    String? country,
    String? currency,
    LocalizedDateTime? dateLocalized,
    String? day,
    String? departuretime,
    LocalizedDateTime? departuretimeLocalized,
    String? description,
    String? gangwayDeck,
    PortGeoLocation? geolocation,
    String? id,
    String? imageUrl,
    String? name,
    String? onboardtime,
    LocalizedDateTime? onboardtimeLocalized,
    bool seaday,
    bool tender,
    String? videoUrl,
  });

  $LocalizedDateTimeCopyWith<$Res>? get arrivaltimeLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get ashoretimeLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get dateLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get departuretimeLocalized;
  $PortGeoLocationCopyWith<$Res>? get geolocation;
  $LocalizedDateTimeCopyWith<$Res>? get onboardtimeLocalized;
}

/// @nodoc
class _$ItineraryPortCopyWithImpl<$Res, $Val extends ItineraryPort>
    implements $ItineraryPortCopyWith<$Res> {
  _$ItineraryPortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrivaltime = freezed,
    Object? arrivaltimeLocalized = freezed,
    Object? ashoretime = freezed,
    Object? ashoretimeLocalized = freezed,
    Object? berthName = freezed,
    Object? code = freezed,
    Object? country = freezed,
    Object? currency = freezed,
    Object? dateLocalized = freezed,
    Object? day = freezed,
    Object? departuretime = freezed,
    Object? departuretimeLocalized = freezed,
    Object? description = freezed,
    Object? gangwayDeck = freezed,
    Object? geolocation = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? onboardtime = freezed,
    Object? onboardtimeLocalized = freezed,
    Object? seaday = null,
    Object? tender = null,
    Object? videoUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            arrivaltime: freezed == arrivaltime
                ? _value.arrivaltime
                : arrivaltime // ignore: cast_nullable_to_non_nullable
                      as String?,
            arrivaltimeLocalized: freezed == arrivaltimeLocalized
                ? _value.arrivaltimeLocalized
                : arrivaltimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            ashoretime: freezed == ashoretime
                ? _value.ashoretime
                : ashoretime // ignore: cast_nullable_to_non_nullable
                      as String?,
            ashoretimeLocalized: freezed == ashoretimeLocalized
                ? _value.ashoretimeLocalized
                : ashoretimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            berthName: freezed == berthName
                ? _value.berthName
                : berthName // ignore: cast_nullable_to_non_nullable
                      as String?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            dateLocalized: freezed == dateLocalized
                ? _value.dateLocalized
                : dateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            day: freezed == day
                ? _value.day
                : day // ignore: cast_nullable_to_non_nullable
                      as String?,
            departuretime: freezed == departuretime
                ? _value.departuretime
                : departuretime // ignore: cast_nullable_to_non_nullable
                      as String?,
            departuretimeLocalized: freezed == departuretimeLocalized
                ? _value.departuretimeLocalized
                : departuretimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            gangwayDeck: freezed == gangwayDeck
                ? _value.gangwayDeck
                : gangwayDeck // ignore: cast_nullable_to_non_nullable
                      as String?,
            geolocation: freezed == geolocation
                ? _value.geolocation
                : geolocation // ignore: cast_nullable_to_non_nullable
                      as PortGeoLocation?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            onboardtime: freezed == onboardtime
                ? _value.onboardtime
                : onboardtime // ignore: cast_nullable_to_non_nullable
                      as String?,
            onboardtimeLocalized: freezed == onboardtimeLocalized
                ? _value.onboardtimeLocalized
                : onboardtimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            seaday: null == seaday
                ? _value.seaday
                : seaday // ignore: cast_nullable_to_non_nullable
                      as bool,
            tender: null == tender
                ? _value.tender
                : tender // ignore: cast_nullable_to_non_nullable
                      as bool,
            videoUrl: freezed == videoUrl
                ? _value.videoUrl
                : videoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get arrivaltimeLocalized {
    if (_value.arrivaltimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.arrivaltimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(arrivaltimeLocalized: value) as $Val);
    });
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get ashoretimeLocalized {
    if (_value.ashoretimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.ashoretimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(ashoretimeLocalized: value) as $Val);
    });
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get dateLocalized {
    if (_value.dateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.dateLocalized!, (value) {
      return _then(_value.copyWith(dateLocalized: value) as $Val);
    });
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get departuretimeLocalized {
    if (_value.departuretimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.departuretimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(departuretimeLocalized: value) as $Val);
    });
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PortGeoLocationCopyWith<$Res>? get geolocation {
    if (_value.geolocation == null) {
      return null;
    }

    return $PortGeoLocationCopyWith<$Res>(_value.geolocation!, (value) {
      return _then(_value.copyWith(geolocation: value) as $Val);
    });
  }

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get onboardtimeLocalized {
    if (_value.onboardtimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.onboardtimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(onboardtimeLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItineraryPortImplCopyWith<$Res>
    implements $ItineraryPortCopyWith<$Res> {
  factory _$$ItineraryPortImplCopyWith(
    _$ItineraryPortImpl value,
    $Res Function(_$ItineraryPortImpl) then,
  ) = __$$ItineraryPortImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? arrivaltime,
    LocalizedDateTime? arrivaltimeLocalized,
    String? ashoretime,
    LocalizedDateTime? ashoretimeLocalized,
    String? berthName,
    String? code,
    String? country,
    String? currency,
    LocalizedDateTime? dateLocalized,
    String? day,
    String? departuretime,
    LocalizedDateTime? departuretimeLocalized,
    String? description,
    String? gangwayDeck,
    PortGeoLocation? geolocation,
    String? id,
    String? imageUrl,
    String? name,
    String? onboardtime,
    LocalizedDateTime? onboardtimeLocalized,
    bool seaday,
    bool tender,
    String? videoUrl,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get arrivaltimeLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get ashoretimeLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get dateLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get departuretimeLocalized;
  @override
  $PortGeoLocationCopyWith<$Res>? get geolocation;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get onboardtimeLocalized;
}

/// @nodoc
class __$$ItineraryPortImplCopyWithImpl<$Res>
    extends _$ItineraryPortCopyWithImpl<$Res, _$ItineraryPortImpl>
    implements _$$ItineraryPortImplCopyWith<$Res> {
  __$$ItineraryPortImplCopyWithImpl(
    _$ItineraryPortImpl _value,
    $Res Function(_$ItineraryPortImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrivaltime = freezed,
    Object? arrivaltimeLocalized = freezed,
    Object? ashoretime = freezed,
    Object? ashoretimeLocalized = freezed,
    Object? berthName = freezed,
    Object? code = freezed,
    Object? country = freezed,
    Object? currency = freezed,
    Object? dateLocalized = freezed,
    Object? day = freezed,
    Object? departuretime = freezed,
    Object? departuretimeLocalized = freezed,
    Object? description = freezed,
    Object? gangwayDeck = freezed,
    Object? geolocation = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? onboardtime = freezed,
    Object? onboardtimeLocalized = freezed,
    Object? seaday = null,
    Object? tender = null,
    Object? videoUrl = freezed,
  }) {
    return _then(
      _$ItineraryPortImpl(
        arrivaltime: freezed == arrivaltime
            ? _value.arrivaltime
            : arrivaltime // ignore: cast_nullable_to_non_nullable
                  as String?,
        arrivaltimeLocalized: freezed == arrivaltimeLocalized
            ? _value.arrivaltimeLocalized
            : arrivaltimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        ashoretime: freezed == ashoretime
            ? _value.ashoretime
            : ashoretime // ignore: cast_nullable_to_non_nullable
                  as String?,
        ashoretimeLocalized: freezed == ashoretimeLocalized
            ? _value.ashoretimeLocalized
            : ashoretimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        berthName: freezed == berthName
            ? _value.berthName
            : berthName // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        dateLocalized: freezed == dateLocalized
            ? _value.dateLocalized
            : dateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        day: freezed == day
            ? _value.day
            : day // ignore: cast_nullable_to_non_nullable
                  as String?,
        departuretime: freezed == departuretime
            ? _value.departuretime
            : departuretime // ignore: cast_nullable_to_non_nullable
                  as String?,
        departuretimeLocalized: freezed == departuretimeLocalized
            ? _value.departuretimeLocalized
            : departuretimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        gangwayDeck: freezed == gangwayDeck
            ? _value.gangwayDeck
            : gangwayDeck // ignore: cast_nullable_to_non_nullable
                  as String?,
        geolocation: freezed == geolocation
            ? _value.geolocation
            : geolocation // ignore: cast_nullable_to_non_nullable
                  as PortGeoLocation?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        onboardtime: freezed == onboardtime
            ? _value.onboardtime
            : onboardtime // ignore: cast_nullable_to_non_nullable
                  as String?,
        onboardtimeLocalized: freezed == onboardtimeLocalized
            ? _value.onboardtimeLocalized
            : onboardtimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        seaday: null == seaday
            ? _value.seaday
            : seaday // ignore: cast_nullable_to_non_nullable
                  as bool,
        tender: null == tender
            ? _value.tender
            : tender // ignore: cast_nullable_to_non_nullable
                  as bool,
        videoUrl: freezed == videoUrl
            ? _value.videoUrl
            : videoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryPortImpl implements _ItineraryPort {
  const _$ItineraryPortImpl({
    this.arrivaltime,
    this.arrivaltimeLocalized,
    this.ashoretime,
    this.ashoretimeLocalized,
    this.berthName,
    this.code,
    this.country,
    this.currency,
    this.dateLocalized,
    this.day,
    this.departuretime,
    this.departuretimeLocalized,
    this.description,
    this.gangwayDeck,
    this.geolocation,
    this.id,
    this.imageUrl,
    this.name,
    this.onboardtime,
    this.onboardtimeLocalized,
    this.seaday = false,
    this.tender = false,
    this.videoUrl,
  });

  factory _$ItineraryPortImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryPortImplFromJson(json);

  @override
  final String? arrivaltime;
  @override
  final LocalizedDateTime? arrivaltimeLocalized;
  @override
  final String? ashoretime;
  @override
  final LocalizedDateTime? ashoretimeLocalized;
  @override
  final String? berthName;
  @override
  final String? code;
  @override
  final String? country;
  @override
  final String? currency;
  @override
  final LocalizedDateTime? dateLocalized;
  @override
  final String? day;
  @override
  final String? departuretime;
  @override
  final LocalizedDateTime? departuretimeLocalized;
  @override
  final String? description;
  @override
  final String? gangwayDeck;
  @override
  final PortGeoLocation? geolocation;
  @override
  final String? id;
  @override
  final String? imageUrl;
  @override
  final String? name;
  @override
  final String? onboardtime;
  @override
  final LocalizedDateTime? onboardtimeLocalized;
  @override
  @JsonKey()
  final bool seaday;
  @override
  @JsonKey()
  final bool tender;
  @override
  final String? videoUrl;

  @override
  String toString() {
    return 'ItineraryPort(arrivaltime: $arrivaltime, arrivaltimeLocalized: $arrivaltimeLocalized, ashoretime: $ashoretime, ashoretimeLocalized: $ashoretimeLocalized, berthName: $berthName, code: $code, country: $country, currency: $currency, dateLocalized: $dateLocalized, day: $day, departuretime: $departuretime, departuretimeLocalized: $departuretimeLocalized, description: $description, gangwayDeck: $gangwayDeck, geolocation: $geolocation, id: $id, imageUrl: $imageUrl, name: $name, onboardtime: $onboardtime, onboardtimeLocalized: $onboardtimeLocalized, seaday: $seaday, tender: $tender, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryPortImpl &&
            (identical(other.arrivaltime, arrivaltime) ||
                other.arrivaltime == arrivaltime) &&
            (identical(other.arrivaltimeLocalized, arrivaltimeLocalized) ||
                other.arrivaltimeLocalized == arrivaltimeLocalized) &&
            (identical(other.ashoretime, ashoretime) ||
                other.ashoretime == ashoretime) &&
            (identical(other.ashoretimeLocalized, ashoretimeLocalized) ||
                other.ashoretimeLocalized == ashoretimeLocalized) &&
            (identical(other.berthName, berthName) ||
                other.berthName == berthName) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.dateLocalized, dateLocalized) ||
                other.dateLocalized == dateLocalized) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.departuretime, departuretime) ||
                other.departuretime == departuretime) &&
            (identical(other.departuretimeLocalized, departuretimeLocalized) ||
                other.departuretimeLocalized == departuretimeLocalized) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gangwayDeck, gangwayDeck) ||
                other.gangwayDeck == gangwayDeck) &&
            (identical(other.geolocation, geolocation) ||
                other.geolocation == geolocation) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.onboardtime, onboardtime) ||
                other.onboardtime == onboardtime) &&
            (identical(other.onboardtimeLocalized, onboardtimeLocalized) ||
                other.onboardtimeLocalized == onboardtimeLocalized) &&
            (identical(other.seaday, seaday) || other.seaday == seaday) &&
            (identical(other.tender, tender) || other.tender == tender) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    arrivaltime,
    arrivaltimeLocalized,
    ashoretime,
    ashoretimeLocalized,
    berthName,
    code,
    country,
    currency,
    dateLocalized,
    day,
    departuretime,
    departuretimeLocalized,
    description,
    gangwayDeck,
    geolocation,
    id,
    imageUrl,
    name,
    onboardtime,
    onboardtimeLocalized,
    seaday,
    tender,
    videoUrl,
  ]);

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryPortImplCopyWith<_$ItineraryPortImpl> get copyWith =>
      __$$ItineraryPortImplCopyWithImpl<_$ItineraryPortImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryPortImplToJson(this);
  }
}

abstract class _ItineraryPort implements ItineraryPort {
  const factory _ItineraryPort({
    final String? arrivaltime,
    final LocalizedDateTime? arrivaltimeLocalized,
    final String? ashoretime,
    final LocalizedDateTime? ashoretimeLocalized,
    final String? berthName,
    final String? code,
    final String? country,
    final String? currency,
    final LocalizedDateTime? dateLocalized,
    final String? day,
    final String? departuretime,
    final LocalizedDateTime? departuretimeLocalized,
    final String? description,
    final String? gangwayDeck,
    final PortGeoLocation? geolocation,
    final String? id,
    final String? imageUrl,
    final String? name,
    final String? onboardtime,
    final LocalizedDateTime? onboardtimeLocalized,
    final bool seaday,
    final bool tender,
    final String? videoUrl,
  }) = _$ItineraryPortImpl;

  factory _ItineraryPort.fromJson(Map<String, dynamic> json) =
      _$ItineraryPortImpl.fromJson;

  @override
  String? get arrivaltime;
  @override
  LocalizedDateTime? get arrivaltimeLocalized;
  @override
  String? get ashoretime;
  @override
  LocalizedDateTime? get ashoretimeLocalized;
  @override
  String? get berthName;
  @override
  String? get code;
  @override
  String? get country;
  @override
  String? get currency;
  @override
  LocalizedDateTime? get dateLocalized;
  @override
  String? get day;
  @override
  String? get departuretime;
  @override
  LocalizedDateTime? get departuretimeLocalized;
  @override
  String? get description;
  @override
  String? get gangwayDeck;
  @override
  PortGeoLocation? get geolocation;
  @override
  String? get id;
  @override
  String? get imageUrl;
  @override
  String? get name;
  @override
  String? get onboardtime;
  @override
  LocalizedDateTime? get onboardtimeLocalized;
  @override
  bool get seaday;
  @override
  bool get tender;
  @override
  String? get videoUrl;

  /// Create a copy of ItineraryPort
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryPortImplCopyWith<_$ItineraryPortImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItineraryResponse _$ItineraryResponseFromJson(Map<String, dynamic> json) {
  return _ItineraryResponse.fromJson(json);
}

/// @nodoc
mixin _$ItineraryResponse {
  String? get code => throw _privateConstructorUsedError;
  String? get cruiseName => throw _privateConstructorUsedError;
  String? get enddate => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  List<ItineraryPort> get ports => throw _privateConstructorUsedError;

  /// Serializes this ItineraryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ItineraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItineraryResponseCopyWith<ItineraryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItineraryResponseCopyWith<$Res> {
  factory $ItineraryResponseCopyWith(
    ItineraryResponse value,
    $Res Function(ItineraryResponse) then,
  ) = _$ItineraryResponseCopyWithImpl<$Res, ItineraryResponse>;
  @useResult
  $Res call({
    String? code,
    String? cruiseName,
    String? enddate,
    String? id,
    String? imageUrl,
    List<ItineraryPort> ports,
  });
}

/// @nodoc
class _$ItineraryResponseCopyWithImpl<$Res, $Val extends ItineraryResponse>
    implements $ItineraryResponseCopyWith<$Res> {
  _$ItineraryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ItineraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? cruiseName = freezed,
    Object? enddate = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? ports = null,
  }) {
    return _then(
      _value.copyWith(
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            cruiseName: freezed == cruiseName
                ? _value.cruiseName
                : cruiseName // ignore: cast_nullable_to_non_nullable
                      as String?,
            enddate: freezed == enddate
                ? _value.enddate
                : enddate // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            ports: null == ports
                ? _value.ports
                : ports // ignore: cast_nullable_to_non_nullable
                      as List<ItineraryPort>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ItineraryResponseImplCopyWith<$Res>
    implements $ItineraryResponseCopyWith<$Res> {
  factory _$$ItineraryResponseImplCopyWith(
    _$ItineraryResponseImpl value,
    $Res Function(_$ItineraryResponseImpl) then,
  ) = __$$ItineraryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? code,
    String? cruiseName,
    String? enddate,
    String? id,
    String? imageUrl,
    List<ItineraryPort> ports,
  });
}

/// @nodoc
class __$$ItineraryResponseImplCopyWithImpl<$Res>
    extends _$ItineraryResponseCopyWithImpl<$Res, _$ItineraryResponseImpl>
    implements _$$ItineraryResponseImplCopyWith<$Res> {
  __$$ItineraryResponseImplCopyWithImpl(
    _$ItineraryResponseImpl _value,
    $Res Function(_$ItineraryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ItineraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? cruiseName = freezed,
    Object? enddate = freezed,
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? ports = null,
  }) {
    return _then(
      _$ItineraryResponseImpl(
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        cruiseName: freezed == cruiseName
            ? _value.cruiseName
            : cruiseName // ignore: cast_nullable_to_non_nullable
                  as String?,
        enddate: freezed == enddate
            ? _value.enddate
            : enddate // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        ports: null == ports
            ? _value._ports
            : ports // ignore: cast_nullable_to_non_nullable
                  as List<ItineraryPort>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ItineraryResponseImpl implements _ItineraryResponse {
  const _$ItineraryResponseImpl({
    this.code,
    this.cruiseName,
    this.enddate,
    this.id,
    this.imageUrl,
    final List<ItineraryPort> ports = const [],
  }) : _ports = ports;

  factory _$ItineraryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItineraryResponseImplFromJson(json);

  @override
  final String? code;
  @override
  final String? cruiseName;
  @override
  final String? enddate;
  @override
  final String? id;
  @override
  final String? imageUrl;
  final List<ItineraryPort> _ports;
  @override
  @JsonKey()
  List<ItineraryPort> get ports {
    if (_ports is EqualUnmodifiableListView) return _ports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ports);
  }

  @override
  String toString() {
    return 'ItineraryResponse(code: $code, cruiseName: $cruiseName, enddate: $enddate, id: $id, imageUrl: $imageUrl, ports: $ports)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItineraryResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.cruiseName, cruiseName) ||
                other.cruiseName == cruiseName) &&
            (identical(other.enddate, enddate) || other.enddate == enddate) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._ports, _ports));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    code,
    cruiseName,
    enddate,
    id,
    imageUrl,
    const DeepCollectionEquality().hash(_ports),
  );

  /// Create a copy of ItineraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItineraryResponseImplCopyWith<_$ItineraryResponseImpl> get copyWith =>
      __$$ItineraryResponseImplCopyWithImpl<_$ItineraryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ItineraryResponseImplToJson(this);
  }
}

abstract class _ItineraryResponse implements ItineraryResponse {
  const factory _ItineraryResponse({
    final String? code,
    final String? cruiseName,
    final String? enddate,
    final String? id,
    final String? imageUrl,
    final List<ItineraryPort> ports,
  }) = _$ItineraryResponseImpl;

  factory _ItineraryResponse.fromJson(Map<String, dynamic> json) =
      _$ItineraryResponseImpl.fromJson;

  @override
  String? get code;
  @override
  String? get cruiseName;
  @override
  String? get enddate;
  @override
  String? get id;
  @override
  String? get imageUrl;
  @override
  List<ItineraryPort> get ports;

  /// Create a copy of ItineraryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItineraryResponseImplCopyWith<_$ItineraryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
