// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VenueOpeningSlotImpl _$$VenueOpeningSlotImplFromJson(
  Map<String, dynamic> json,
) => _$VenueOpeningSlotImpl(
  description: json['description'] as String?,
  openFrom: json['openFrom'] == null
      ? null
      : LocalizedDateTime.fromJson(json['openFrom'] as Map<String, dynamic>),
  openTo: json['openTo'] == null
      ? null
      : LocalizedDateTime.fromJson(json['openTo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$VenueOpeningSlotImplToJson(
  _$VenueOpeningSlotImpl instance,
) => <String, dynamic>{
  'description': instance.description,
  'openFrom': instance.openFrom,
  'openTo': instance.openTo,
};

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      afternoontea: json['afternoontea'] as bool?,
      agerestriction: json['agerestriction'] as String?,
      bookable: json['bookable'] as bool?,
      breakfast: json['breakfast'] as bool?,
      breakfastMenuUrl: json['breakfastMenuUrl'] as String?,
      category: json['category'] as String?,
      chargeable: json['chargeable'] as bool?,
      code: json['code'] as String?,
      contact: json['contact'] as String?,
      deck: json['deck'] as String?,
      description: json['description'] as String?,
      dinner: json['dinner'] as bool?,
      dinnerMenuUrl: json['dinnerMenuUrl'] as String?,
      id: json['id'] as String?,
      image: json['image'] as String?,
      lunch: json['lunch'] as bool?,
      lunchMenuUrl: json['lunchMenuUrl'] as String?,
      mealdetail: json['mealdetail'] as String?,
      mediaGallery:
          (json['mediaGallery'] as List<dynamic>?)
              ?.map((e) => MediaGalleryItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      morningtea: json['morningtea'] as bool?,
      name: json['name'] as String?,
      paxCount: (json['paxCount'] as num?)?.toInt(),
      special: json['special'] as bool?,
      supper: json['supper'] as bool?,
      teaser: json['teaser'] as String?,
      type: json['type'] as String?,
      venueOpening:
          (json['venueOpening'] as List<dynamic>?)
              ?.map(
                (e) => (e as List<dynamic>)
                    .map(
                      (e) =>
                          VenueOpeningSlot.fromJson(e as Map<String, dynamic>),
                    )
                    .toList(),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'afternoontea': instance.afternoontea,
      'agerestriction': instance.agerestriction,
      'bookable': instance.bookable,
      'breakfast': instance.breakfast,
      'breakfastMenuUrl': instance.breakfastMenuUrl,
      'category': instance.category,
      'chargeable': instance.chargeable,
      'code': instance.code,
      'contact': instance.contact,
      'deck': instance.deck,
      'description': instance.description,
      'dinner': instance.dinner,
      'dinnerMenuUrl': instance.dinnerMenuUrl,
      'id': instance.id,
      'image': instance.image,
      'lunch': instance.lunch,
      'lunchMenuUrl': instance.lunchMenuUrl,
      'mealdetail': instance.mealdetail,
      'mediaGallery': instance.mediaGallery,
      'morningtea': instance.morningtea,
      'name': instance.name,
      'paxCount': instance.paxCount,
      'special': instance.special,
      'supper': instance.supper,
      'teaser': instance.teaser,
      'type': instance.type,
      'venueOpening': instance.venueOpening,
    };

_$RestaurantsResponseImpl _$$RestaurantsResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantsResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Restaurant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$RestaurantsResponseImplToJson(
  _$RestaurantsResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};
