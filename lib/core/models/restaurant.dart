import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';
import 'excursion.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class VenueOpeningSlot with _$VenueOpeningSlot {
  const factory VenueOpeningSlot({
    String? description,
    LocalizedDateTime? openFrom,
    LocalizedDateTime? openTo,
  }) = _VenueOpeningSlot;
  factory VenueOpeningSlot.fromJson(Map<String, dynamic> json) =>
      _$VenueOpeningSlotFromJson(json);
}

@freezed
class Restaurant with _$Restaurant {
  const factory Restaurant({
    bool? afternoontea,
    String? agerestriction,
    bool? bookable,
    bool? breakfast,
    String? breakfastMenuUrl,
    String? category,
    bool? chargeable,
    String? code,
    String? contact,
    String? deck,
    String? description,
    bool? dinner,
    String? dinnerMenuUrl,
    String? id,
    String? image,
    bool? lunch,
    String? lunchMenuUrl,
    String? mealdetail,
    @Default([]) List<MediaGalleryItem> mediaGallery,
    bool? morningtea,
    String? name,
    int? paxCount,
    bool? special,
    bool? supper,
    String? teaser,
    String? type,
    @Default([]) List<List<VenueOpeningSlot>> venueOpening,
  }) = _Restaurant;
  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);
}

@freezed
class RestaurantsResponse with _$RestaurantsResponse {
  const factory RestaurantsResponse({
    @Default([]) List<Restaurant> data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _RestaurantsResponse;
  factory RestaurantsResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantsResponseFromJson(json);
}
