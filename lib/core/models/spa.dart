import 'package:freezed_annotation/freezed_annotation.dart';

part 'spa.freezed.dart';
part 'spa.g.dart';

@freezed
class SpaItem with _$SpaItem {
  const factory SpaItem({
    String? additionalInformation,
    bool? bookable,
    String? category,
    String? categoryCode,
    String? code,
    String? codeExt,
    String? description,
    String? duration,
    String? durationType,
    String? family,
    String? group,
    String? image,
    String? location,
    String? locationName,
    String? maxPrice,
    String? minPrice,
    String? name,
    String? teaser,
    String? title,
  }) = _SpaItem;
  factory SpaItem.fromJson(Map<String, dynamic> json) =>
      _$SpaItemFromJson(json);
}

@freezed
class SpaListResponse with _$SpaListResponse {
  const factory SpaListResponse({
    @Default([]) List<SpaItem> data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _SpaListResponse;
  factory SpaListResponse.fromJson(Map<String, dynamic> json) =>
      _$SpaListResponseFromJson(json);
}

@freezed
class SpaDetailResponse with _$SpaDetailResponse {
  const factory SpaDetailResponse({
    SpaItem? data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _SpaDetailResponse;
  factory SpaDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$SpaDetailResponseFromJson(json);
}
