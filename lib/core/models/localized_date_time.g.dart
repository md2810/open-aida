// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_date_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalizedDateTimeImpl _$$LocalizedDateTimeImplFromJson(
  Map<String, dynamic> json,
) => _$LocalizedDateTimeImpl(
  date: json['date'] as String?,
  dateDdmm: json['dateDDMM'] as String?,
  datetime: json['datetime'] as String?,
  datetimeRaw: json['datetimeRaw'] as String?,
  day: json['day'] as String?,
  locale: json['locale'] as String?,
  shortdate: json['shortdate'] as String?,
  time: json['time'] as String?,
  weekday: json['weekday'] as String?,
  weekdayComplete: json['weekdayComplete'] as String?,
);

Map<String, dynamic> _$$LocalizedDateTimeImplToJson(
  _$LocalizedDateTimeImpl instance,
) => <String, dynamic>{
  'date': instance.date,
  'dateDDMM': instance.dateDdmm,
  'datetime': instance.datetime,
  'datetimeRaw': instance.datetimeRaw,
  'day': instance.day,
  'locale': instance.locale,
  'shortdate': instance.shortdate,
  'time': instance.time,
  'weekday': instance.weekday,
  'weekdayComplete': instance.weekdayComplete,
};
