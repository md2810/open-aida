import 'package:freezed_annotation/freezed_annotation.dart';

part 'ship_data.freezed.dart';
part 'ship_data.g.dart';

@freezed
class ShipWind with _$ShipWind {
  const factory ShipWind({
    @JsonKey(name: 'SPEED') String? speed,
    @JsonKey(name: 'DIRECTION') String? direction,
    @JsonKey(name: 'TYPE') String? type,
  }) = _ShipWind;
  factory ShipWind.fromJson(Map<String, dynamic> json) =>
      _$ShipWindFromJson(json);
}

@freezed
class ShipPosition with _$ShipPosition {
  const factory ShipPosition({
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
  }) = _ShipPosition;
  factory ShipPosition.fromJson(Map<String, dynamic> json) =>
      _$ShipPositionFromJson(json);
}

@freezed
class ShipNautic with _$ShipNautic {
  const factory ShipNautic({
    @JsonKey(name: 'STATUS') String? status,
    @JsonKey(name: 'ETA_TIME') String? etaTime,
    @JsonKey(name: 'ETA_DATE') String? etaDate,
    @JsonKey(name: 'NEXT_PORT') String? nextPort,
  }) = _ShipNautic;
  factory ShipNautic.fromJson(Map<String, dynamic> json) =>
      _$ShipNauticFromJson(json);
}

@freezed
class ShipSpeed with _$ShipSpeed {
  const factory ShipSpeed({
    @JsonKey(name: 'OVER_GROUND') String? overGround,
    @JsonKey(name: 'THROUGH_WATER') String? throughWater,
    @JsonKey(name: 'ROT') String? rot,
  }) = _ShipSpeed;
  factory ShipSpeed.fromJson(Map<String, dynamic> json) =>
      _$ShipSpeedFromJson(json);
}

@freezed
class ShipAir with _$ShipAir {
  const factory ShipAir({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'HUMIDITY') String? humidity,
    @JsonKey(name: 'PRESSURE') String? pressure,
  }) = _ShipAir;
  factory ShipAir.fromJson(Map<String, dynamic> json) =>
      _$ShipAirFromJson(json);
}

@freezed
class ShipWater with _$ShipWater {
  const factory ShipWater({
    @JsonKey(name: 'TEMPERATURE') String? temperature,
    @JsonKey(name: 'DEPTH') String? depth,
  }) = _ShipWater;
  factory ShipWater.fromJson(Map<String, dynamic> json) =>
      _$ShipWaterFromJson(json);
}

@freezed
class ShipDirection with _$ShipDirection {
  const factory ShipDirection({
    @JsonKey(name: 'HEADING') String? heading,
    @JsonKey(name: 'COURSE') String? course,
  }) = _ShipDirection;
  factory ShipDirection.fromJson(Map<String, dynamic> json) =>
      _$ShipDirectionFromJson(json);
}

@freezed
class ShipSuntime with _$ShipSuntime {
  const factory ShipSuntime({
    @JsonKey(name: 'SUNRISE') String? sunrise,
    @JsonKey(name: 'SUNSET') String? sunset,
    @JsonKey(name: 'SUNNOON') String? sunnoon,
  }) = _ShipSuntime;
  factory ShipSuntime.fromJson(Map<String, dynamic> json) =>
      _$ShipSuntimeFromJson(json);
}

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    String? date,
    String? temperature,
    String? weather,
  }) = _WeatherForecast;
  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);
}

@freezed
class ShipDataInner with _$ShipDataInner {
  const factory ShipDataInner({
    @JsonKey(name: 'WIND') ShipWind? wind,
    @JsonKey(name: 'POSITION') ShipPosition? position,
    @JsonKey(name: 'NAUTIC') ShipNautic? nautic,
    @JsonKey(name: 'SHIP_SPEED') ShipSpeed? speed,
    @JsonKey(name: 'AIR') ShipAir? air,
    @JsonKey(name: 'WATER') ShipWater? water,
    @JsonKey(name: 'SHIP_DIRECTION') ShipDirection? direction,
    @JsonKey(name: 'SUNTIME') ShipSuntime? suntime,
    @JsonKey(name: 'WEATHER_FORECAST') @Default([]) List<WeatherForecast> weatherForecast,
  }) = _ShipDataInner;
  factory ShipDataInner.fromJson(Map<String, dynamic> json) =>
      _$ShipDataInnerFromJson(json);
}

@freezed
class ShipDataWrapper with _$ShipDataWrapper {
  const factory ShipDataWrapper({
    @JsonKey(name: 'SHIP_DATA') ShipDataInner? shipData,
  }) = _ShipDataWrapper;
  factory ShipDataWrapper.fromJson(Map<String, dynamic> json) =>
      _$ShipDataWrapperFromJson(json);
}

@freezed
class ShipDataResponse with _$ShipDataResponse {
  const factory ShipDataResponse({
    ShipDataWrapper? data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _ShipDataResponse;
  factory ShipDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ShipDataResponseFromJson(json);
}
