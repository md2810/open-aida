// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excursion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaGalleryItemImpl _$$MediaGalleryItemImplFromJson(
  Map<String, dynamic> json,
) => _$MediaGalleryItemImpl(
  description: json['description'] as String?,
  type: json['type'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$$MediaGalleryItemImplToJson(
  _$MediaGalleryItemImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'type': instance.type,
  'url': instance.url,
};

_$ExcursionImpl _$$ExcursionImplFromJson(Map<String, dynamic> json) =>
    _$ExcursionImpl(
      adultprice: json['adultprice'] as String?,
      adultstatus: json['adultstatus'] as String?,
      begdate: json['begdate'] as String?,
      begdateLocalized: json['begdateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['begdateLocalized'] as Map<String, dynamic>,
            ),
      booked: json['booked'] as String?,
      childprice: json['childprice'] as String?,
      childstatus: json['childstatus'] as String?,
      currency: json['currency'] as String?,
      duration: json['duration'] as String?,
      enddate: json['enddate'] as String?,
      enddateLocalized: json['enddateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['enddateLocalized'] as Map<String, dynamic>,
            ),
      excBooked: json['excBooked'] as bool?,
      excNotes: json['excNotes'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      longdesc: json['longdesc'] as String?,
      maxSeatsAvailable: (json['maxSeatsAvailable'] as num?)?.toInt(),
      meetdate: json['meetdate'] as String?,
      meetdateLocalized: json['meetdateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['meetdateLocalized'] as Map<String, dynamic>,
            ),
      meetplace: json['meetplace'] as String?,
      minAge: json['minAge'] as String?,
      minseat: json['minseat'] as String?,
      name: json['name'] as String?,
      no: json['no'] as String?,
      port: json['port'] as String?,
      mediaGallery:
          (json['mediaGallery'] as List<dynamic>?)
              ?.map((e) => MediaGalleryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ExcursionImplToJson(_$ExcursionImpl instance) =>
    <String, dynamic>{
      'adultprice': instance.adultprice,
      'adultstatus': instance.adultstatus,
      'begdate': instance.begdate,
      'begdateLocalized': instance.begdateLocalized,
      'booked': instance.booked,
      'childprice': instance.childprice,
      'childstatus': instance.childstatus,
      'currency': instance.currency,
      'duration': instance.duration,
      'enddate': instance.enddate,
      'enddateLocalized': instance.enddateLocalized,
      'excBooked': instance.excBooked,
      'excNotes': instance.excNotes,
      'id': instance.id,
      'image': instance.image,
      'longdesc': instance.longdesc,
      'maxSeatsAvailable': instance.maxSeatsAvailable,
      'meetdate': instance.meetdate,
      'meetdateLocalized': instance.meetdateLocalized,
      'meetplace': instance.meetplace,
      'minAge': instance.minAge,
      'minseat': instance.minseat,
      'name': instance.name,
      'no': instance.no,
      'port': instance.port,
      'mediaGallery': instance.mediaGallery,
    };

_$ExcursionResponseImpl _$$ExcursionResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ExcursionResponseImpl(
  balance: json['balance'] as String?,
  errorMessages:
      (json['errorMessages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  excursionList:
      (json['excursionList'] as List<dynamic>?)
          ?.map((e) => Excursion.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$ExcursionResponseImplToJson(
  _$ExcursionResponseImpl instance,
) => <String, dynamic>{
  'balance': instance.balance,
  'errorMessages': instance.errorMessages,
  'excursionList': instance.excursionList,
};
