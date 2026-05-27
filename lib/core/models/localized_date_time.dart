import 'package:freezed_annotation/freezed_annotation.dart';

part 'localized_date_time.freezed.dart';
part 'localized_date_time.g.dart';

@freezed
class LocalizedDateTime with _$LocalizedDateTime {
  const factory LocalizedDateTime({
    String? date,
    @JsonKey(name: 'dateDDMM') String? dateDdmm,
    String? datetime,
    String? datetimeRaw,
    String? day,
    String? locale,
    String? shortdate,
    String? time,
    String? weekday,
    String? weekdayComplete,
  }) = _LocalizedDateTime;

  factory LocalizedDateTime.fromJson(Map<String, dynamic> json) =>
      _$LocalizedDateTimeFromJson(json);
}
