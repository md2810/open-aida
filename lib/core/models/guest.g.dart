// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GuestImpl _$$GuestImplFromJson(Map<String, dynamic> json) => _$GuestImpl(
  age: (json['age'] as num?)?.toInt(),
  cabin: json['cabin'] as String?,
  cabinCategory: json['cabinCategory'] as String?,
  city: json['city'] as String?,
  country: json['country'] as String?,
  cruiseId: json['cruiseId'] as String?,
  dateOfBirth: json['dateOfBirth'] as String?,
  disembarkationDate: json['disembarkationDate'] as String?,
  embarkationDate: json['embarkationDate'] as String?,
  externalId: json['externalId'] as String?,
  fareType: json['fareType'] as String?,
  fbPersonTypeAdult: json['fbPersonTypeAdult'] as bool?,
  firstname: json['firstname'] as String?,
  folio: json['folio'] as String?,
  gender: json['gender'] as String?,
  guestType: json['guestType'] as String?,
  hasPin: json['hasPin'] as bool?,
  id: json['id'] as String?,
  language: json['language'] as String?,
  lastname: json['lastname'] as String?,
  loyalty: json['loyalty'] as String?,
  picture: json['picture'] as String?,
  postingsAllowed: json['postingsAllowed'] as bool?,
  salutation: json['salutation'] as String?,
  shorexPersonTypeAdult: json['shorexPersonTypeAdult'] as bool?,
  state: json['state'] as String?,
  token: json['token'] as String?,
  voyage: json['voyage'] as String?,
);

Map<String, dynamic> _$$GuestImplToJson(_$GuestImpl instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cabin': instance.cabin,
      'cabinCategory': instance.cabinCategory,
      'city': instance.city,
      'country': instance.country,
      'cruiseId': instance.cruiseId,
      'dateOfBirth': instance.dateOfBirth,
      'disembarkationDate': instance.disembarkationDate,
      'embarkationDate': instance.embarkationDate,
      'externalId': instance.externalId,
      'fareType': instance.fareType,
      'fbPersonTypeAdult': instance.fbPersonTypeAdult,
      'firstname': instance.firstname,
      'folio': instance.folio,
      'gender': instance.gender,
      'guestType': instance.guestType,
      'hasPin': instance.hasPin,
      'id': instance.id,
      'language': instance.language,
      'lastname': instance.lastname,
      'loyalty': instance.loyalty,
      'picture': instance.picture,
      'postingsAllowed': instance.postingsAllowed,
      'salutation': instance.salutation,
      'shorexPersonTypeAdult': instance.shorexPersonTypeAdult,
      'state': instance.state,
      'token': instance.token,
      'voyage': instance.voyage,
    };

_$AuthResponseImpl _$$AuthResponseImplFromJson(Map<String, dynamic> json) =>
    _$AuthResponseImpl(
      cookieToken: json['cookieToken'] as String?,
      errorMessages:
          (json['errorMessages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      guest: json['guest'] == null
          ? null
          : Guest.fromJson(json['guest'] as Map<String, dynamic>),
      jwt: json['jwt'] as String?,
      sessionToken: json['sessionToken'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthResponseImplToJson(_$AuthResponseImpl instance) =>
    <String, dynamic>{
      'cookieToken': instance.cookieToken,
      'errorMessages': instance.errorMessages,
      'guest': instance.guest,
      'jwt': instance.jwt,
      'sessionToken': instance.sessionToken,
      'success': instance.success,
    };

_$GuestListResponseImpl _$$GuestListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$GuestListResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Guest.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$GuestListResponseImplToJson(
  _$GuestListResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};
