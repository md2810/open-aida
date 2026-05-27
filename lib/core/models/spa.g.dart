// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spa.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpaItemImpl _$$SpaItemImplFromJson(Map<String, dynamic> json) =>
    _$SpaItemImpl(
      additionalInformation: json['additionalInformation'] as String?,
      bookable: json['bookable'] as bool?,
      category: json['category'] as String?,
      categoryCode: json['categoryCode'] as String?,
      code: json['code'] as String?,
      codeExt: json['codeExt'] as String?,
      description: json['description'] as String?,
      duration: json['duration'] as String?,
      durationType: json['durationType'] as String?,
      family: json['family'] as String?,
      group: json['group'] as String?,
      image: json['image'] as String?,
      location: json['location'] as String?,
      locationName: json['locationName'] as String?,
      maxPrice: json['maxPrice'] as String?,
      minPrice: json['minPrice'] as String?,
      name: json['name'] as String?,
      teaser: json['teaser'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$SpaItemImplToJson(_$SpaItemImpl instance) =>
    <String, dynamic>{
      'additionalInformation': instance.additionalInformation,
      'bookable': instance.bookable,
      'category': instance.category,
      'categoryCode': instance.categoryCode,
      'code': instance.code,
      'codeExt': instance.codeExt,
      'description': instance.description,
      'duration': instance.duration,
      'durationType': instance.durationType,
      'family': instance.family,
      'group': instance.group,
      'image': instance.image,
      'location': instance.location,
      'locationName': instance.locationName,
      'maxPrice': instance.maxPrice,
      'minPrice': instance.minPrice,
      'name': instance.name,
      'teaser': instance.teaser,
      'title': instance.title,
    };

_$SpaListResponseImpl _$$SpaListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SpaListResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SpaItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$SpaListResponseImplToJson(
  _$SpaListResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};

_$SpaDetailResponseImpl _$$SpaDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$SpaDetailResponseImpl(
  data: json['data'] == null
      ? null
      : SpaItem.fromJson(json['data'] as Map<String, dynamic>),
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$SpaDetailResponseImplToJson(
  _$SpaDetailResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};
