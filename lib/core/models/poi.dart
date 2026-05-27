import 'package:freezed_annotation/freezed_annotation.dart';

part 'poi.freezed.dart';
part 'poi.g.dart';

@freezed
class Poi with _$Poi {
  const factory Poi({
    String? category,
    String? code,
    String? deck,
    String? deckplanNumber,
    String? description,
    String? id,
    String? imageUrl,
    String? movieUrl,
    String? name,
    String? positionX,
    String? positionY,
    String? teaser,
    String? type,
  }) = _Poi;
  factory Poi.fromJson(Map<String, dynamic> json) => _$PoiFromJson(json);
}

@freezed
class PoiDetailResponse with _$PoiDetailResponse {
  const factory PoiDetailResponse({
    Poi? data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _PoiDetailResponse;
  factory PoiDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$PoiDetailResponseFromJson(json);
}

@freezed
class PoiListResponse with _$PoiListResponse {
  const factory PoiListResponse({
    @Default([]) List<Poi> data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _PoiListResponse;
  factory PoiListResponse.fromJson(Map<String, dynamic> json) =>
      _$PoiListResponseFromJson(json);
}
