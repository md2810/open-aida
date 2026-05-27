import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class EventCategory with _$EventCategory {
  const factory EventCategory({
    String? code,
    String? description,
    String? label,
  }) = _EventCategory;
  factory EventCategory.fromJson(Map<String, dynamic> json) =>
      _$EventCategoryFromJson(json);
}

@freezed
class EventAvailability with _$EventAvailability {
  const factory EventAvailability({
    bool? available,
    LocalizedDateTime? dateTimeLocalized,
    String? id,
  }) = _EventAvailability;
  factory EventAvailability.fromJson(Map<String, dynamic> json) =>
      _$EventAvailabilityFromJson(json);
}

@freezed
class DailyEvent with _$DailyEvent {
  const factory DailyEvent({
    @Default([]) List<EventAvailability> availabilities,
    bool? bookable,
    bool? bookmarkable,
    @Default([]) List<EventCategory> categories,
    String? costAdult,
    String? costChild,
    String? description,
    String? endDateTime,
    LocalizedDateTime? endDateTimeLocalized,
    String? eventCode,
    String? eventId,
    String? eventName,
    String? eventType,
    @Default(false) bool forRestaurant,
    String? image,
    @Default(false) bool openend,
    String? startDateTime,
    LocalizedDateTime? startDateTimeLocalized,
    String? teaser,
    String? title,
    @Default(false) bool useCoverCharge,
    String? venueCode,
    String? venueName,
    String? venueType,
    String? video,
  }) = _DailyEvent;
  factory DailyEvent.fromJson(Map<String, dynamic> json) =>
      _$DailyEventFromJson(json);
}

@freezed
class DailyEventsData with _$DailyEventsData {
  const factory DailyEventsData({
    @Default([]) List<DailyEvent> morning,
    @Default([]) List<DailyEvent> afternoon,
    @Default([]) List<DailyEvent> evening,
    @Default([]) List<DailyEvent> night,
  }) = _DailyEventsData;
  factory DailyEventsData.fromJson(Map<String, dynamic> json) =>
      _$DailyEventsDataFromJson(json);
}

@freezed
class DailyEventsResponse with _$DailyEventsResponse {
  const factory DailyEventsResponse({
    DailyEventsData? data,
  }) = _DailyEventsResponse;
  factory DailyEventsResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyEventsResponseFromJson(json);
}

// Opening hours

@freezed
class MealPeriod with _$MealPeriod {
  const factory MealPeriod({
    String? description,
    LocalizedDateTime? startDateLocalized,
    LocalizedDateTime? endDateLocalized,
  }) = _MealPeriod;
  factory MealPeriod.fromJson(Map<String, dynamic> json) =>
      _$MealPeriodFromJson(json);
}

@freezed
class VenueMealPeriods with _$VenueMealPeriods {
  const factory VenueMealPeriods({
    List<MealPeriod>? breakfast,
    List<MealPeriod>? lunch,
    List<MealPeriod>? dinner,
  }) = _VenueMealPeriods;
  factory VenueMealPeriods.fromJson(Map<String, dynamic> json) =>
      _$VenueMealPeriodsFromJson(json);
}

@freezed
class OpeningVenue with _$OpeningVenue {
  const factory OpeningVenue({
    String? deck,
    String? description,
    VenueMealPeriods? mealPeriods,
    String? venueCode,
    String? venueName,
    String? venueType,
  }) = _OpeningVenue;
  factory OpeningVenue.fromJson(Map<String, dynamic> json) =>
      _$OpeningVenueFromJson(json);
}

@freezed
class OpeningCategory with _$OpeningCategory {
  const factory OpeningCategory({
    String? categoryName,
    String? description,
    String? sort,
    @Default([]) List<OpeningVenue> venues,
  }) = _OpeningCategory;
  factory OpeningCategory.fromJson(Map<String, dynamic> json) =>
      _$OpeningCategoryFromJson(json);
}

@freezed
class OpeningHoursResponse with _$OpeningHoursResponse {
  const factory OpeningHoursResponse({
    @Default([]) List<OpeningCategory> data,
  }) = _OpeningHoursResponse;
  factory OpeningHoursResponse.fromJson(Map<String, dynamic> json) =>
      _$OpeningHoursResponseFromJson(json);
}
