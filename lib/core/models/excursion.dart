import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';

part 'excursion.freezed.dart';
part 'excursion.g.dart';

@freezed
class MediaGalleryItem with _$MediaGalleryItem {
  const factory MediaGalleryItem({
    String? description,
    String? type,
    String? url,
  }) = _MediaGalleryItem;
  factory MediaGalleryItem.fromJson(Map<String, dynamic> json) =>
      _$MediaGalleryItemFromJson(json);
}

@freezed
class Excursion with _$Excursion {
  const factory Excursion({
    String? adultprice,
    String? adultstatus,
    String? begdate,
    LocalizedDateTime? begdateLocalized,
    String? booked,
    String? childprice,
    String? childstatus,
    String? currency,
    String? duration,
    String? enddate,
    LocalizedDateTime? enddateLocalized,
    bool? excBooked,
    String? excNotes,
    String? id,
    String? image,
    String? longdesc,
    int? maxSeatsAvailable,
    String? meetdate,
    LocalizedDateTime? meetdateLocalized,
    String? meetplace,
    String? minAge,
    String? minseat,
    String? name,
    String? no,
    String? port,
    @Default([]) List<MediaGalleryItem> mediaGallery,
  }) = _Excursion;
  factory Excursion.fromJson(Map<String, dynamic> json) =>
      _$ExcursionFromJson(json);
}

@freezed
class ExcursionResponse with _$ExcursionResponse {
  const factory ExcursionResponse({
    String? balance,
    @Default([]) List<String> errorMessages,
    @Default([]) List<Excursion> excursionList,
  }) = _ExcursionResponse;
  factory ExcursionResponse.fromJson(Map<String, dynamic> json) =>
      _$ExcursionResponseFromJson(json);
}
