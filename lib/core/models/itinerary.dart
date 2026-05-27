import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';

part 'itinerary.freezed.dart';
part 'itinerary.g.dart';

@freezed
class PortGeoLocation with _$PortGeoLocation {
  const factory PortGeoLocation({
    String? latitude,
    String? longitude,
  }) = _PortGeoLocation;
  factory PortGeoLocation.fromJson(Map<String, dynamic> json) =>
      _$PortGeoLocationFromJson(json);
}

@freezed
class ItineraryPort with _$ItineraryPort {
  const factory ItineraryPort({
    String? arrivaltime,
    LocalizedDateTime? arrivaltimeLocalized,
    String? ashoretime,
    LocalizedDateTime? ashoretimeLocalized,
    String? berthName,
    String? code,
    String? country,
    String? currency,
    LocalizedDateTime? dateLocalized,
    String? day,
    String? departuretime,
    LocalizedDateTime? departuretimeLocalized,
    String? description,
    String? gangwayDeck,
    PortGeoLocation? geolocation,
    String? id,
    String? imageUrl,
    String? name,
    String? onboardtime,
    LocalizedDateTime? onboardtimeLocalized,
    @Default(false) bool seaday,
    @Default(false) bool tender,
    String? videoUrl,
  }) = _ItineraryPort;
  factory ItineraryPort.fromJson(Map<String, dynamic> json) =>
      _$ItineraryPortFromJson(json);
}

@freezed
class ItineraryResponse with _$ItineraryResponse {
  const factory ItineraryResponse({
    String? code,
    String? cruiseName,
    String? enddate,
    String? id,
    String? imageUrl,
    @Default([]) List<ItineraryPort> ports,
  }) = _ItineraryResponse;
  factory ItineraryResponse.fromJson(Map<String, dynamic> json) =>
      _$ItineraryResponseFromJson(json);
}
