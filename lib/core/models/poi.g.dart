// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoiImpl _$$PoiImplFromJson(Map<String, dynamic> json) => _$PoiImpl(
  category: json['category'] as String?,
  code: json['code'] as String?,
  deck: json['deck'] as String?,
  deckplanNumber: json['deckplanNumber'] as String?,
  description: json['description'] as String?,
  id: json['id'] as String?,
  imageUrl: json['imageUrl'] as String?,
  movieUrl: json['movieUrl'] as String?,
  name: json['name'] as String?,
  positionX: json['positionX'] as String?,
  positionY: json['positionY'] as String?,
  teaser: json['teaser'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$$PoiImplToJson(_$PoiImpl instance) => <String, dynamic>{
  'category': instance.category,
  'code': instance.code,
  'deck': instance.deck,
  'deckplanNumber': instance.deckplanNumber,
  'description': instance.description,
  'id': instance.id,
  'imageUrl': instance.imageUrl,
  'movieUrl': instance.movieUrl,
  'name': instance.name,
  'positionX': instance.positionX,
  'positionY': instance.positionY,
  'teaser': instance.teaser,
  'type': instance.type,
};

_$PoiDetailResponseImpl _$$PoiDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PoiDetailResponseImpl(
  data: json['data'] == null
      ? null
      : Poi.fromJson(json['data'] as Map<String, dynamic>),
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$PoiDetailResponseImplToJson(
  _$PoiDetailResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};

_$PoiListResponseImpl _$$PoiListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$PoiListResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Poi.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$PoiListResponseImplToJson(
  _$PoiListResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};
