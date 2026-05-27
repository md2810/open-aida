// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCategoryImpl _$$EventCategoryImplFromJson(Map<String, dynamic> json) =>
    _$EventCategoryImpl(
      code: json['code'] as String?,
      description: json['description'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$$EventCategoryImplToJson(_$EventCategoryImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'label': instance.label,
    };

_$EventAvailabilityImpl _$$EventAvailabilityImplFromJson(
  Map<String, dynamic> json,
) => _$EventAvailabilityImpl(
  available: json['available'] as bool?,
  dateTimeLocalized: json['dateTimeLocalized'] == null
      ? null
      : LocalizedDateTime.fromJson(
          json['dateTimeLocalized'] as Map<String, dynamic>,
        ),
  id: json['id'] as String?,
);

Map<String, dynamic> _$$EventAvailabilityImplToJson(
  _$EventAvailabilityImpl instance,
) => <String, dynamic>{
  'available': instance.available,
  'dateTimeLocalized': instance.dateTimeLocalized,
  'id': instance.id,
};

_$DailyEventImpl _$$DailyEventImplFromJson(Map<String, dynamic> json) =>
    _$DailyEventImpl(
      availabilities:
          (json['availabilities'] as List<dynamic>?)
              ?.map(
                (e) => EventAvailability.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      bookable: json['bookable'] as bool?,
      bookmarkable: json['bookmarkable'] as bool?,
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => EventCategory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      costAdult: json['costAdult'] as String?,
      costChild: json['costChild'] as String?,
      description: json['description'] as String?,
      endDateTime: json['endDateTime'] as String?,
      endDateTimeLocalized: json['endDateTimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['endDateTimeLocalized'] as Map<String, dynamic>,
            ),
      eventCode: json['eventCode'] as String?,
      eventId: json['eventId'] as String?,
      eventName: json['eventName'] as String?,
      eventType: json['eventType'] as String?,
      forRestaurant: json['forRestaurant'] as bool? ?? false,
      image: json['image'] as String?,
      openend: json['openend'] as bool? ?? false,
      startDateTime: json['startDateTime'] as String?,
      startDateTimeLocalized: json['startDateTimeLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['startDateTimeLocalized'] as Map<String, dynamic>,
            ),
      teaser: json['teaser'] as String?,
      title: json['title'] as String?,
      useCoverCharge: json['useCoverCharge'] as bool? ?? false,
      venueCode: json['venueCode'] as String?,
      venueName: json['venueName'] as String?,
      venueType: json['venueType'] as String?,
      video: json['video'] as String?,
    );

Map<String, dynamic> _$$DailyEventImplToJson(_$DailyEventImpl instance) =>
    <String, dynamic>{
      'availabilities': instance.availabilities,
      'bookable': instance.bookable,
      'bookmarkable': instance.bookmarkable,
      'categories': instance.categories,
      'costAdult': instance.costAdult,
      'costChild': instance.costChild,
      'description': instance.description,
      'endDateTime': instance.endDateTime,
      'endDateTimeLocalized': instance.endDateTimeLocalized,
      'eventCode': instance.eventCode,
      'eventId': instance.eventId,
      'eventName': instance.eventName,
      'eventType': instance.eventType,
      'forRestaurant': instance.forRestaurant,
      'image': instance.image,
      'openend': instance.openend,
      'startDateTime': instance.startDateTime,
      'startDateTimeLocalized': instance.startDateTimeLocalized,
      'teaser': instance.teaser,
      'title': instance.title,
      'useCoverCharge': instance.useCoverCharge,
      'venueCode': instance.venueCode,
      'venueName': instance.venueName,
      'venueType': instance.venueType,
      'video': instance.video,
    };

_$DailyEventsDataImpl _$$DailyEventsDataImplFromJson(
  Map<String, dynamic> json,
) => _$DailyEventsDataImpl(
  morning:
      (json['morning'] as List<dynamic>?)
          ?.map((e) => DailyEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  afternoon:
      (json['afternoon'] as List<dynamic>?)
          ?.map((e) => DailyEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  evening:
      (json['evening'] as List<dynamic>?)
          ?.map((e) => DailyEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  night:
      (json['night'] as List<dynamic>?)
          ?.map((e) => DailyEvent.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$DailyEventsDataImplToJson(
  _$DailyEventsDataImpl instance,
) => <String, dynamic>{
  'morning': instance.morning,
  'afternoon': instance.afternoon,
  'evening': instance.evening,
  'night': instance.night,
};

_$DailyEventsResponseImpl _$$DailyEventsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$DailyEventsResponseImpl(
  data: json['data'] == null
      ? null
      : DailyEventsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$DailyEventsResponseImplToJson(
  _$DailyEventsResponseImpl instance,
) => <String, dynamic>{'data': instance.data};

_$MealPeriodImpl _$$MealPeriodImplFromJson(Map<String, dynamic> json) =>
    _$MealPeriodImpl(
      description: json['description'] as String?,
      startDateLocalized: json['startDateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['startDateLocalized'] as Map<String, dynamic>,
            ),
      endDateLocalized: json['endDateLocalized'] == null
          ? null
          : LocalizedDateTime.fromJson(
              json['endDateLocalized'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$MealPeriodImplToJson(_$MealPeriodImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'startDateLocalized': instance.startDateLocalized,
      'endDateLocalized': instance.endDateLocalized,
    };

_$VenueMealPeriodsImpl _$$VenueMealPeriodsImplFromJson(
  Map<String, dynamic> json,
) => _$VenueMealPeriodsImpl(
  breakfast: (json['breakfast'] as List<dynamic>?)
      ?.map((e) => MealPeriod.fromJson(e as Map<String, dynamic>))
      .toList(),
  lunch: (json['lunch'] as List<dynamic>?)
      ?.map((e) => MealPeriod.fromJson(e as Map<String, dynamic>))
      .toList(),
  dinner: (json['dinner'] as List<dynamic>?)
      ?.map((e) => MealPeriod.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$VenueMealPeriodsImplToJson(
  _$VenueMealPeriodsImpl instance,
) => <String, dynamic>{
  'breakfast': instance.breakfast,
  'lunch': instance.lunch,
  'dinner': instance.dinner,
};

_$OpeningVenueImpl _$$OpeningVenueImplFromJson(Map<String, dynamic> json) =>
    _$OpeningVenueImpl(
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      mealPeriods: json['mealPeriods'] == null
          ? null
          : VenueMealPeriods.fromJson(
              json['mealPeriods'] as Map<String, dynamic>,
            ),
      venueCode: json['venueCode'] as String?,
      venueName: json['venueName'] as String?,
      venueType: json['venueType'] as String?,
    );

Map<String, dynamic> _$$OpeningVenueImplToJson(_$OpeningVenueImpl instance) =>
    <String, dynamic>{
      'deck': instance.deck,
      'description': instance.description,
      'mealPeriods': instance.mealPeriods,
      'venueCode': instance.venueCode,
      'venueName': instance.venueName,
      'venueType': instance.venueType,
    };

_$OpeningCategoryImpl _$$OpeningCategoryImplFromJson(
  Map<String, dynamic> json,
) => _$OpeningCategoryImpl(
  categoryName: json['categoryName'] as String?,
  description: json['description'] as String?,
  sort: json['sort'] as String?,
  venues:
      (json['venues'] as List<dynamic>?)
          ?.map((e) => OpeningVenue.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OpeningCategoryImplToJson(
  _$OpeningCategoryImpl instance,
) => <String, dynamic>{
  'categoryName': instance.categoryName,
  'description': instance.description,
  'sort': instance.sort,
  'venues': instance.venues,
};

_$OpeningHoursResponseImpl _$$OpeningHoursResponseImplFromJson(
  Map<String, dynamic> json,
) => _$OpeningHoursResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => OpeningCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$OpeningHoursResponseImplToJson(
  _$OpeningHoursResponseImpl instance,
) => <String, dynamic>{'data': instance.data};
