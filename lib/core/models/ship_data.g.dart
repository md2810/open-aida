// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ship_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShipWindImpl _$$ShipWindImplFromJson(Map<String, dynamic> json) =>
    _$ShipWindImpl(
      speed: json['SPEED'] as String?,
      direction: json['DIRECTION'] as String?,
      type: json['TYPE'] as String?,
    );

Map<String, dynamic> _$$ShipWindImplToJson(_$ShipWindImpl instance) =>
    <String, dynamic>{
      'SPEED': instance.speed,
      'DIRECTION': instance.direction,
      'TYPE': instance.type,
    };

_$ShipPositionImpl _$$ShipPositionImplFromJson(Map<String, dynamic> json) =>
    _$ShipPositionImpl(
      latitude: json['LATITUDE'] as String?,
      longitude: json['LONGITUDE'] as String?,
      latitudeD: json['LATITUDE_D'] as String?,
      latitudeM: json['LATITUDE_M'] as String?,
      latitudeS: json['LATITUDE_S'] as String?,
      latitudeH: json['LATITUDE_H'] as String?,
      longitudeD: json['LONGITUDE_D'] as String?,
      longitudeM: json['LONGITUDE_M'] as String?,
      longitudeS: json['LONGITUDE_S'] as String?,
      longitudeH: json['LONGITUDE_H'] as String?,
      source: json['SOURCE'] as String?,
    );

Map<String, dynamic> _$$ShipPositionImplToJson(_$ShipPositionImpl instance) =>
    <String, dynamic>{
      'LATITUDE': instance.latitude,
      'LONGITUDE': instance.longitude,
      'LATITUDE_D': instance.latitudeD,
      'LATITUDE_M': instance.latitudeM,
      'LATITUDE_S': instance.latitudeS,
      'LATITUDE_H': instance.latitudeH,
      'LONGITUDE_D': instance.longitudeD,
      'LONGITUDE_M': instance.longitudeM,
      'LONGITUDE_S': instance.longitudeS,
      'LONGITUDE_H': instance.longitudeH,
      'SOURCE': instance.source,
    };

_$ShipNauticImpl _$$ShipNauticImplFromJson(Map<String, dynamic> json) =>
    _$ShipNauticImpl(
      status: json['STATUS'] as String?,
      etaTime: json['ETA_TIME'] as String?,
      etaDate: json['ETA_DATE'] as String?,
      nextPort: json['NEXT_PORT'] as String?,
    );

Map<String, dynamic> _$$ShipNauticImplToJson(_$ShipNauticImpl instance) =>
    <String, dynamic>{
      'STATUS': instance.status,
      'ETA_TIME': instance.etaTime,
      'ETA_DATE': instance.etaDate,
      'NEXT_PORT': instance.nextPort,
    };

_$ShipSpeedImpl _$$ShipSpeedImplFromJson(Map<String, dynamic> json) =>
    _$ShipSpeedImpl(
      overGround: json['OVER_GROUND'] as String?,
      throughWater: json['THROUGH_WATER'] as String?,
      rot: json['ROT'] as String?,
    );

Map<String, dynamic> _$$ShipSpeedImplToJson(_$ShipSpeedImpl instance) =>
    <String, dynamic>{
      'OVER_GROUND': instance.overGround,
      'THROUGH_WATER': instance.throughWater,
      'ROT': instance.rot,
    };

_$ShipAirImpl _$$ShipAirImplFromJson(Map<String, dynamic> json) =>
    _$ShipAirImpl(
      temperature: json['TEMPERATURE'] as String?,
      humidity: json['HUMIDITY'] as String?,
      pressure: json['PRESSURE'] as String?,
    );

Map<String, dynamic> _$$ShipAirImplToJson(_$ShipAirImpl instance) =>
    <String, dynamic>{
      'TEMPERATURE': instance.temperature,
      'HUMIDITY': instance.humidity,
      'PRESSURE': instance.pressure,
    };

_$ShipWaterImpl _$$ShipWaterImplFromJson(Map<String, dynamic> json) =>
    _$ShipWaterImpl(
      temperature: json['TEMPERATURE'] as String?,
      depth: json['DEPTH'] as String?,
    );

Map<String, dynamic> _$$ShipWaterImplToJson(_$ShipWaterImpl instance) =>
    <String, dynamic>{
      'TEMPERATURE': instance.temperature,
      'DEPTH': instance.depth,
    };

_$ShipDirectionImpl _$$ShipDirectionImplFromJson(Map<String, dynamic> json) =>
    _$ShipDirectionImpl(
      heading: json['HEADING'] as String?,
      course: json['COURSE'] as String?,
    );

Map<String, dynamic> _$$ShipDirectionImplToJson(_$ShipDirectionImpl instance) =>
    <String, dynamic>{'HEADING': instance.heading, 'COURSE': instance.course};

_$ShipSuntimeImpl _$$ShipSuntimeImplFromJson(Map<String, dynamic> json) =>
    _$ShipSuntimeImpl(
      sunrise: json['SUNRISE'] as String?,
      sunset: json['SUNSET'] as String?,
      sunnoon: json['SUNNOON'] as String?,
    );

Map<String, dynamic> _$$ShipSuntimeImplToJson(_$ShipSuntimeImpl instance) =>
    <String, dynamic>{
      'SUNRISE': instance.sunrise,
      'SUNSET': instance.sunset,
      'SUNNOON': instance.sunnoon,
    };

_$WeatherForecastImpl _$$WeatherForecastImplFromJson(
  Map<String, dynamic> json,
) => _$WeatherForecastImpl(
  date: json['date'] as String?,
  temperature: json['temperature'] as String?,
  weather: json['weather'] as String?,
);

Map<String, dynamic> _$$WeatherForecastImplToJson(
  _$WeatherForecastImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'temperature': instance.temperature,
  'weather': instance.weather,
};

_$ShipDataInnerImpl _$$ShipDataInnerImplFromJson(Map<String, dynamic> json) =>
    _$ShipDataInnerImpl(
      wind: json['WIND'] == null
          ? null
          : ShipWind.fromJson(json['WIND'] as Map<String, dynamic>),
      position: json['POSITION'] == null
          ? null
          : ShipPosition.fromJson(json['POSITION'] as Map<String, dynamic>),
      nautic: json['NAUTIC'] == null
          ? null
          : ShipNautic.fromJson(json['NAUTIC'] as Map<String, dynamic>),
      speed: json['SHIP_SPEED'] == null
          ? null
          : ShipSpeed.fromJson(json['SHIP_SPEED'] as Map<String, dynamic>),
      air: json['AIR'] == null
          ? null
          : ShipAir.fromJson(json['AIR'] as Map<String, dynamic>),
      water: json['WATER'] == null
          ? null
          : ShipWater.fromJson(json['WATER'] as Map<String, dynamic>),
      direction: json['SHIP_DIRECTION'] == null
          ? null
          : ShipDirection.fromJson(
              json['SHIP_DIRECTION'] as Map<String, dynamic>,
            ),
      suntime: json['SUNTIME'] == null
          ? null
          : ShipSuntime.fromJson(json['SUNTIME'] as Map<String, dynamic>),
      weatherForecast:
          (json['WEATHER_FORECAST'] as List<dynamic>?)
              ?.map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ShipDataInnerImplToJson(_$ShipDataInnerImpl instance) =>
    <String, dynamic>{
      'WIND': instance.wind,
      'POSITION': instance.position,
      'NAUTIC': instance.nautic,
      'SHIP_SPEED': instance.speed,
      'AIR': instance.air,
      'WATER': instance.water,
      'SHIP_DIRECTION': instance.direction,
      'SUNTIME': instance.suntime,
      'WEATHER_FORECAST': instance.weatherForecast,
    };

_$ShipDataWrapperImpl _$$ShipDataWrapperImplFromJson(
  Map<String, dynamic> json,
) => _$ShipDataWrapperImpl(
  shipData: json['SHIP_DATA'] == null
      ? null
      : ShipDataInner.fromJson(json['SHIP_DATA'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ShipDataWrapperImplToJson(
  _$ShipDataWrapperImpl instance,
) => <String, dynamic>{'SHIP_DATA': instance.shipData};

_$ShipDataResponseImpl _$$ShipDataResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ShipDataResponseImpl(
  data: json['data'] == null
      ? null
      : ShipDataWrapper.fromJson(json['data'] as Map<String, dynamic>),
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$ShipDataResponseImplToJson(
  _$ShipDataResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};
