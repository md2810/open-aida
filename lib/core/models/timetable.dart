import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';

part 'timetable.freezed.dart';
part 'timetable.g.dart';

@freezed
class TimetableEntry with _$TimetableEntry {
  const factory TimetableEntry({
    bool? bookmarked,
    bool? cancellable,
    String? code,
    String? contact,
    String? date,
    String? dateTime,
    LocalizedDateTime? dateTimeLocalized,
    String? endDateTime,
    LocalizedDateTime? endDateTimeLocalized,
    String? eventName,
    String? id,
    String? image,
    String? itemType,
    String? location,
    String? meetDateTime,
    LocalizedDateTime? meetDateTimeLocalized,
    String? meetPlace,
    String? parentCode,
    int? paxCount,
    String? reservationId,
    String? teaser,
    String? time,
    String? url,
    String? venueName,
  }) = _TimetableEntry;
  factory TimetableEntry.fromJson(Map<String, dynamic> json) =>
      _$TimetableEntryFromJson(json);
}

@freezed
class TimetableResponse with _$TimetableResponse {
  const factory TimetableResponse({
    @Default([]) List<String> errorMessages,
    @Default(false) bool success,
    @Default([]) List<TimetableEntry> timetableList,
  }) = _TimetableResponse;
  factory TimetableResponse.fromJson(Map<String, dynamic> json) =>
      _$TimetableResponseFromJson(json);
}
