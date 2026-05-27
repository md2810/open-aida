import 'package:freezed_annotation/freezed_annotation.dart';

part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class Guest with _$Guest {
  const factory Guest({
    int? age,
    String? cabin,
    String? cabinCategory,
    String? city,
    String? country,
    String? cruiseId,
    String? dateOfBirth,
    String? disembarkationDate,
    String? embarkationDate,
    String? externalId,
    String? fareType,
    bool? fbPersonTypeAdult,
    String? firstname,
    String? folio,
    String? gender,
    String? guestType,
    bool? hasPin,
    String? id,
    String? language,
    String? lastname,
    String? loyalty,
    String? picture,
    bool? postingsAllowed,
    String? salutation,
    bool? shorexPersonTypeAdult,
    String? state,
    String? token,
    String? voyage,
  }) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    String? cookieToken,
    @Default([]) List<String> errorMessages,
    Guest? guest,
    String? jwt,
    String? sessionToken,
    @Default(false) bool success,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class GuestListResponse with _$GuestListResponse {
  const factory GuestListResponse({
    @Default([]) List<Guest> data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _GuestListResponse;

  factory GuestListResponse.fromJson(Map<String, dynamic> json) =>
      _$GuestListResponseFromJson(json);
}
