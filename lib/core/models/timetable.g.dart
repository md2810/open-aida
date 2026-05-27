// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimetableEntryImpl _$$TimetableEntryImplFromJson(Map<String, dynamic> json) =>
    _$TimetableEntryImpl(
      bookmarked: json['bookmarked'] as bool?,
      cancellable: json['cancellable'] as bool?,
      code: json['code'] as String?,
      contact: json['contact'] as String?,
      date: json['date'] as String?,
      dateTime: json['dateTime'] as String?,
      dateTimeLocalized: json['dateTimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['dateTimeLocalized'] as Map<String, dynamic>,
            ),
      endDateTime: json['endDateTime'] as String?,
      endDateTimeLocalized: json['endDateTimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['endDateTimeLocalized'] as Map<String, dynamic>,
            ),
      eventName: json['eventName'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      itemType: json['itemType'] as String?,
      location: json['location'] as String?,
      meetDateTime: json['meetDateTime'] as String?,
      meetDateTimeLocalized: json['meetDateTimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['meetDateTimeLocalized'] as Map<String, dynamic>,
            ),
      meetPlace: json['meetPlace'] as String?,
      parentCode: json['parentCode'] as String?,
      paxCount: (json['paxCount'] as num?)?.toInt(),
      reservationId: json['reservationId'] as String?,
      teaser: json['teaser'] as String?,
      time: json['time'] as String?,
      url: json['url'] as String?,
      venueName: json['venueName'] as String?,
    );

Map<String, dynamic> _$$TimetableEntryImplToJson(
  _$TimetableEntryImpl instance,
) => <String, dynamic>{
  'bookmarked': instance.bookmarked,
  'cancellable': instance.cancellable,
  'code': instance.code,
  'contact': instance.contact,
  'date': instance.date,
  'dateTime': instance.dateTime,
  'dateTimeLocalized': instance.dateTimeLocalized,
  'endDateTime': instance.endDateTime,
  'endDateTimeLocalized': instance.endDateTimeLocalized,
  'eventName': instance.eventName,
  'id': instance.id,
  'image': instance.image,
  'itemType': instance.itemType,
  'location': instance.location,
  'meetDateTime': instance.meetDateTime,
  'meetDateTimeLocalized': instance.meetDateTimeLocalized,
  'meetPlace': instance.meetPlace,
  'parentCode': instance.parentCode,
  'paxCount': instance.paxCount,
  'reservationId': instance.reservationId,
  'teaser': instance.teaser,
  'time': instance.time,
  'url': instance.url,
  'venueName': instance.venueName,
};

_$TimetableResponseImpl _$$TimetableResponseImplFromJson(
  Map<String, dynamic> json,
) => _$TimetableResponseImpl(
  errorMessages:
      (json['errorMessages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  success: json['success'] as bool? ?? false,
  timetableList:
      (json['timetableList'] as List<dynamic>?)
          ?.map((e) => TimetableEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$TimetableResponseImplToJson(
  _$TimetableResponseImpl instance,
) => <String, dynamic>{
  'errorMessages': instance.errorMessages,
  'success': instance.success,
  'timetableList': instance.timetableList,
};
