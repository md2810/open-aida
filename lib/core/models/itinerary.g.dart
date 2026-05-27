// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itinerary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PortGeoLocationImpl _$$PortGeoLocationImplFromJson(
  Map<String, dynamic> json,
) => _$PortGeoLocationImpl(
  latitude: json['latitude'] as String?,
  longitude: json['longitude'] as String?,
);

Map<String, dynamic> _$$PortGeoLocationImplToJson(
  _$PortGeoLocationImpl instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

_$ItineraryPortImpl _$$ItineraryPortImplFromJson(Map<String, dynamic> json) =>
    _$ItineraryPortImpl(
      arrivaltime: json['arrivaltime'] as String?,
      arrivaltimeLocalized: json['arrivaltimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['arrivaltimeLocalized'] as Map<String, dynamic>,
            ),
      ashoretime: json['ashoretime'] as String?,
      ashoretimeLocalized: json['ashoretimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['ashoretimeLocalized'] as Map<String, dynamic>,
            ),
      berthName: json['berthName'] as String?,
      code: json['code'] as String?,
      country: json['country'] as String?,
      currency: json['currency'] as String?,
      dateLocalized: json['dateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['dateLocalized'] as Map<String, dynamic>,
            ),
      day: json['day'] as String?,
      departuretime: json['departuretime'] as String?,
      departuretimeLocalized: json['departuretimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['departuretimeLocalized'] as Map<String, dynamic>,
            ),
      description: json['description'] as String?,
      gangwayDeck: json['gangwayDeck'] as String?,
      geolocation: json['geolocation'] == null
          ? null
          : PortGeoLocation.fromJson(
              json['geolocation'] as Map<String, dynamic>,
            ),
      id: json['id'] as String?,
      imageUrl: json['imageUrl'] as String?,
      name: json['name'] as String?,
      onboardtime: json['onboardtime'] as String?,
      onboardtimeLocalized: json['onboardtimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['onboardtimeLocalized'] as Map<String, dynamic>,
            ),
      seaday: json['seaday'] as bool? ?? false,
      tender: json['tender'] as bool? ?? false,
      videoUrl: json['videoUrl'] as String?,
    );

Map<String, dynamic> _$$ItineraryPortImplToJson(_$ItineraryPortImpl instance) =>
    <String, dynamic>{
      'arrivaltime': instance.arrivaltime,
      'arrivaltimeLocalized': instance.arrivaltimeLocalized,
      'ashoretime': instance.ashoretime,
      'ashoretimeLocalized': instance.ashoretimeLocalized,
      'berthName': instance.berthName,
      'code': instance.code,
      'country': instance.country,
      'currency': instance.currency,
      'dateLocalized': instance.dateLocalized,
      'day': instance.day,
      'departuretime': instance.departuretime,
      'departuretimeLocalized': instance.departuretimeLocalized,
      'description': instance.description,
      'gangwayDeck': instance.gangwayDeck,
      'geolocation': instance.geolocation,
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'onboardtime': instance.onboardtime,
      'onboardtimeLocalized': instance.onboardtimeLocalized,
      'seaday': instance.seaday,
      'tender': instance.tender,
      'videoUrl': instance.videoUrl,
    };

_$ItineraryResponseImpl _$$ItineraryResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ItineraryResponseImpl(
  code: json['code'] as String?,
  cruiseName: json['cruiseName'] as String?,
  enddate: json['enddate'] as String?,
  id: json['id'] as String?,
  imageUrl: json['imageUrl'] as String?,
  ports:
      (json['ports'] as List<dynamic>?)
          ?.map((e) => ItineraryPort.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ItineraryResponseImplToJson(
  _$ItineraryResponseImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'cruiseName': instance.cruiseName,
  'enddate': instance.enddate,
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'ports': instance.ports,
};
