// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventCategory _$EventCategoryFromJson(Map<String, dynamic> json) {
  return _EventCategory.fromJson(json);
}

/// @nodoc
mixin _$EventCategory {
  String? get code => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;

  /// Serializes this EventCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCategoryCopyWith<EventCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCategoryCopyWith<$Res> {
  factory $EventCategoryCopyWith(
    EventCategory value,
    $Res Function(EventCategory) then,
  ) = _$EventCategoryCopyWithImpl<$Res, EventCategory>;
  @useResult
  $Res call({String? code, String? description, String? label});
}

/// @nodoc
class _$EventCategoryCopyWithImpl<$Res, $Val extends EventCategory>
    implements $EventCategoryCopyWith<$Res> {
  _$EventCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? label = freezed,
  }) {
    return _then(
      _value.copyWith(
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            label: freezed == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventCategoryImplCopyWith<$Res>
    implements $EventCategoryCopyWith<$Res> {
  factory _$$EventCategoryImplCopyWith(
    _$EventCategoryImpl value,
    $Res Function(_$EventCategoryImpl) then,
  ) = __$$EventCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? description, String? label});
}

/// @nodoc
class __$$EventCategoryImplCopyWithImpl<$Res>
    extends _$EventCategoryCopyWithImpl<$Res, _$EventCategoryImpl>
    implements _$$EventCategoryImplCopyWith<$Res> {
  __$$EventCategoryImplCopyWithImpl(
    _$EventCategoryImpl _value,
    $Res Function(_$EventCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? description = freezed,
    Object? label = freezed,
  }) {
    return _then(
      _$EventCategoryImpl(
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        label: freezed == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventCategoryImpl implements _EventCategory {
  const _$EventCategoryImpl({this.code, this.description, this.label});

  factory _$EventCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCategoryImplFromJson(json);

  @override
  final String? code;
  @override
  final String? description;
  @override
  final String? label;

  @override
  String toString() {
    return 'EventCategory(code: $code, description: $description, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCategoryImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, code, description, label);

  /// Create a copy of EventCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCategoryImplCopyWith<_$EventCategoryImpl> get copyWith =>
      __$$EventCategoryImplCopyWithImpl<_$EventCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCategoryImplToJson(this);
  }
}

abstract class _EventCategory implements EventCategory {
  const factory _EventCategory({
    final String? code,
    final String? description,
    final String? label,
  }) = _$EventCategoryImpl;

  factory _EventCategory.fromJson(Map<String, dynamic> json) =
      _$EventCategoryImpl.fromJson;

  @override
  String? get code;
  @override
  String? get description;
  @override
  String? get label;

  /// Create a copy of EventCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCategoryImplCopyWith<_$EventCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventAvailability _$EventAvailabilityFromJson(Map<String, dynamic> json) {
  return _EventAvailability.fromJson(json);
}

/// @nodoc
mixin _$EventAvailability {
  bool? get available => throw _privateConstructorUsedError;
  LocalizedDateTime? get dateTimeLocalized =>
      throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  /// Serializes this EventAvailability to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventAvailabilityCopyWith<EventAvailability> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventAvailabilityCopyWith<$Res> {
  factory $EventAvailabilityCopyWith(
    EventAvailability value,
    $Res Function(EventAvailability) then,
  ) = _$EventAvailabilityCopyWithImpl<$Res, EventAvailability>;
  @useResult
  $Res call({
    bool? available,
    LocalizedDateTime? dateTimeLocalized,
    String? id,
  });

  $LocalizedDateTimeCopyWith<$Res>? get dateTimeLocalized;
}

/// @nodoc
class _$EventAvailabilityCopyWithImpl<$Res, $Val extends EventAvailability>
    implements $EventAvailabilityCopyWith<$Res> {
  _$EventAvailabilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = freezed,
    Object? dateTimeLocalized = freezed,
    Object? id = freezed,
  }) {
    return _then(
      _value.copyWith(
            available: freezed == available
                ? _value.available
                : available // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dateTimeLocalized: freezed == dateTimeLocalized
                ? _value.dateTimeLocalized
                : dateTimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get dateTimeLocalized {
    if (_value.dateTimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.dateTimeLocalized!, (value) {
      return _then(_value.copyWith(dateTimeLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventAvailabilityImplCopyWith<$Res>
    implements $EventAvailabilityCopyWith<$Res> {
  factory _$$EventAvailabilityImplCopyWith(
    _$EventAvailabilityImpl value,
    $Res Function(_$EventAvailabilityImpl) then,
  ) = __$$EventAvailabilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? available,
    LocalizedDateTime? dateTimeLocalized,
    String? id,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get dateTimeLocalized;
}

/// @nodoc
class __$$EventAvailabilityImplCopyWithImpl<$Res>
    extends _$EventAvailabilityCopyWithImpl<$Res, _$EventAvailabilityImpl>
    implements _$$EventAvailabilityImplCopyWith<$Res> {
  __$$EventAvailabilityImplCopyWithImpl(
    _$EventAvailabilityImpl _value,
    $Res Function(_$EventAvailabilityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = freezed,
    Object? dateTimeLocalized = freezed,
    Object? id = freezed,
  }) {
    return _then(
      _$EventAvailabilityImpl(
        available: freezed == available
            ? _value.available
            : available // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dateTimeLocalized: freezed == dateTimeLocalized
            ? _value.dateTimeLocalized
            : dateTimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventAvailabilityImpl implements _EventAvailability {
  const _$EventAvailabilityImpl({
    this.available,
    this.dateTimeLocalized,
    this.id,
  });

  factory _$EventAvailabilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventAvailabilityImplFromJson(json);

  @override
  final bool? available;
  @override
  final LocalizedDateTime? dateTimeLocalized;
  @override
  final String? id;

  @override
  String toString() {
    return 'EventAvailability(available: $available, dateTimeLocalized: $dateTimeLocalized, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAvailabilityImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.dateTimeLocalized, dateTimeLocalized) ||
                other.dateTimeLocalized == dateTimeLocalized) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, available, dateTimeLocalized, id);

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAvailabilityImplCopyWith<_$EventAvailabilityImpl> get copyWith =>
      __$$EventAvailabilityImplCopyWithImpl<_$EventAvailabilityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EventAvailabilityImplToJson(this);
  }
}

abstract class _EventAvailability implements EventAvailability {
  const factory _EventAvailability({
    final bool? available,
    final LocalizedDateTime? dateTimeLocalized,
    final String? id,
  }) = _$EventAvailabilityImpl;

  factory _EventAvailability.fromJson(Map<String, dynamic> json) =
      _$EventAvailabilityImpl.fromJson;

  @override
  bool? get available;
  @override
  LocalizedDateTime? get dateTimeLocalized;
  @override
  String? get id;

  /// Create a copy of EventAvailability
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventAvailabilityImplCopyWith<_$EventAvailabilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyEvent _$DailyEventFromJson(Map<String, dynamic> json) {
  return _DailyEvent.fromJson(json);
}

/// @nodoc
mixin _$DailyEvent {
  List<EventAvailability> get availabilities =>
      throw _privateConstructorUsedError;
  bool? get bookable => throw _privateConstructorUsedError;
  bool? get bookmarkable => throw _privateConstructorUsedError;
  List<EventCategory> get categories => throw _privateConstructorUsedError;
  String? get costAdult => throw _privateConstructorUsedError;
  String? get costChild => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get endDateTime => throw _privateConstructorUsedError;
  LocalizedDateTime? get endDateTimeLocalized =>
      throw _privateConstructorUsedError;
  String? get eventCode => throw _privateConstructorUsedError;
  String? get eventId => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;
  String? get eventType => throw _privateConstructorUsedError;
  bool get forRestaurant => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get openend => throw _privateConstructorUsedError;
  String? get startDateTime => throw _privateConstructorUsedError;
  LocalizedDateTime? get startDateTimeLocalized =>
      throw _privateConstructorUsedError;
  String? get teaser => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  bool get useCoverCharge => throw _privateConstructorUsedError;
  String? get venueCode => throw _privateConstructorUsedError;
  String? get venueName => throw _privateConstructorUsedError;
  String? get venueType => throw _privateConstructorUsedError;
  String? get video => throw _privateConstructorUsedError;

  /// Serializes this DailyEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyEventCopyWith<DailyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyEventCopyWith<$Res> {
  factory $DailyEventCopyWith(
    DailyEvent value,
    $Res Function(DailyEvent) then,
  ) = _$DailyEventCopyWithImpl<$Res, DailyEvent>;
  @useResult
  $Res call({
    List<EventAvailability> availabilities,
    bool? bookable,
    bool? bookmarkable,
    List<EventCategory> categories,
    String? costAdult,
    String? costChild,
    String? description,
    String? endDateTime,
    LocalizedDateTime? endDateTimeLocalized,
    String? eventCode,
    String? eventId,
    String? eventName,
    String? eventType,
    bool forRestaurant,
    String? image,
    bool openend,
    String? startDateTime,
    LocalizedDateTime? startDateTimeLocalized,
    String? teaser,
    String? title,
    bool useCoverCharge,
    String? venueCode,
    String? venueName,
    String? venueType,
    String? video,
  });

  $LocalizedDateTimeCopyWith<$Res>? get endDateTimeLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get startDateTimeLocalized;
}

/// @nodoc
class _$DailyEventCopyWithImpl<$Res, $Val extends DailyEvent>
    implements $DailyEventCopyWith<$Res> {
  _$DailyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilities = null,
    Object? bookable = freezed,
    Object? bookmarkable = freezed,
    Object? categories = null,
    Object? costAdult = freezed,
    Object? costChild = freezed,
    Object? description = freezed,
    Object? endDateTime = freezed,
    Object? endDateTimeLocalized = freezed,
    Object? eventCode = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? eventType = freezed,
    Object? forRestaurant = null,
    Object? image = freezed,
    Object? openend = null,
    Object? startDateTime = freezed,
    Object? startDateTimeLocalized = freezed,
    Object? teaser = freezed,
    Object? title = freezed,
    Object? useCoverCharge = null,
    Object? venueCode = freezed,
    Object? venueName = freezed,
    Object? venueType = freezed,
    Object? video = freezed,
  }) {
    return _then(
      _value.copyWith(
            availabilities: null == availabilities
                ? _value.availabilities
                : availabilities // ignore: cast_nullable_to_non_nullable
                      as List<EventAvailability>,
            bookable: freezed == bookable
                ? _value.bookable
                : bookable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            bookmarkable: freezed == bookmarkable
                ? _value.bookmarkable
                : bookmarkable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<EventCategory>,
            costAdult: freezed == costAdult
                ? _value.costAdult
                : costAdult // ignore: cast_nullable_to_non_nullable
                      as String?,
            costChild: freezed == costChild
                ? _value.costChild
                : costChild // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            endDateTime: freezed == endDateTime
                ? _value.endDateTime
                : endDateTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            endDateTimeLocalized: freezed == endDateTimeLocalized
                ? _value.endDateTimeLocalized
                : endDateTimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            eventCode: freezed == eventCode
                ? _value.eventCode
                : eventCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventId: freezed == eventId
                ? _value.eventId
                : eventId // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventName: freezed == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventType: freezed == eventType
                ? _value.eventType
                : eventType // ignore: cast_nullable_to_non_nullable
                      as String?,
            forRestaurant: null == forRestaurant
                ? _value.forRestaurant
                : forRestaurant // ignore: cast_nullable_to_non_nullable
                      as bool,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            openend: null == openend
                ? _value.openend
                : openend // ignore: cast_nullable_to_non_nullable
                      as bool,
            startDateTime: freezed == startDateTime
                ? _value.startDateTime
                : startDateTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDateTimeLocalized: freezed == startDateTimeLocalized
                ? _value.startDateTimeLocalized
                : startDateTimeLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            teaser: freezed == teaser
                ? _value.teaser
                : teaser // ignore: cast_nullable_to_non_nullable
                      as String?,
            title: freezed == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String?,
            useCoverCharge: null == useCoverCharge
                ? _value.useCoverCharge
                : useCoverCharge // ignore: cast_nullable_to_non_nullable
                      as bool,
            venueCode: freezed == venueCode
                ? _value.venueCode
                : venueCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            venueName: freezed == venueName
                ? _value.venueName
                : venueName // ignore: cast_nullable_to_non_nullable
                      as String?,
            venueType: freezed == venueType
                ? _value.venueType
                : venueType // ignore: cast_nullable_to_non_nullable
                      as String?,
            video: freezed == video
                ? _value.video
                : video // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get endDateTimeLocalized {
    if (_value.endDateTimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.endDateTimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(endDateTimeLocalized: value) as $Val);
    });
  }

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get startDateTimeLocalized {
    if (_value.startDateTimeLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.startDateTimeLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(startDateTimeLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyEventImplCopyWith<$Res>
    implements $DailyEventCopyWith<$Res> {
  factory _$$DailyEventImplCopyWith(
    _$DailyEventImpl value,
    $Res Function(_$DailyEventImpl) then,
  ) = __$$DailyEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<EventAvailability> availabilities,
    bool? bookable,
    bool? bookmarkable,
    List<EventCategory> categories,
    String? costAdult,
    String? costChild,
    String? description,
    String? endDateTime,
    LocalizedDateTime? endDateTimeLocalized,
    String? eventCode,
    String? eventId,
    String? eventName,
    String? eventType,
    bool forRestaurant,
    String? image,
    bool openend,
    String? startDateTime,
    LocalizedDateTime? startDateTimeLocalized,
    String? teaser,
    String? title,
    bool useCoverCharge,
    String? venueCode,
    String? venueName,
    String? venueType,
    String? video,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get endDateTimeLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get startDateTimeLocalized;
}

/// @nodoc
class __$$DailyEventImplCopyWithImpl<$Res>
    extends _$DailyEventCopyWithImpl<$Res, _$DailyEventImpl>
    implements _$$DailyEventImplCopyWith<$Res> {
  __$$DailyEventImplCopyWithImpl(
    _$DailyEventImpl _value,
    $Res Function(_$DailyEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availabilities = null,
    Object? bookable = freezed,
    Object? bookmarkable = freezed,
    Object? categories = null,
    Object? costAdult = freezed,
    Object? costChild = freezed,
    Object? description = freezed,
    Object? endDateTime = freezed,
    Object? endDateTimeLocalized = freezed,
    Object? eventCode = freezed,
    Object? eventId = freezed,
    Object? eventName = freezed,
    Object? eventType = freezed,
    Object? forRestaurant = null,
    Object? image = freezed,
    Object? openend = null,
    Object? startDateTime = freezed,
    Object? startDateTimeLocalized = freezed,
    Object? teaser = freezed,
    Object? title = freezed,
    Object? useCoverCharge = null,
    Object? venueCode = freezed,
    Object? venueName = freezed,
    Object? venueType = freezed,
    Object? video = freezed,
  }) {
    return _then(
      _$DailyEventImpl(
        availabilities: null == availabilities
            ? _value._availabilities
            : availabilities // ignore: cast_nullable_to_non_nullable
                  as List<EventAvailability>,
        bookable: freezed == bookable
            ? _value.bookable
            : bookable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        bookmarkable: freezed == bookmarkable
            ? _value.bookmarkable
            : bookmarkable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<EventCategory>,
        costAdult: freezed == costAdult
            ? _value.costAdult
            : costAdult // ignore: cast_nullable_to_non_nullable
                  as String?,
        costChild: freezed == costChild
            ? _value.costChild
            : costChild // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        endDateTime: freezed == endDateTime
            ? _value.endDateTime
            : endDateTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        endDateTimeLocalized: freezed == endDateTimeLocalized
            ? _value.endDateTimeLocalized
            : endDateTimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        eventCode: freezed == eventCode
            ? _value.eventCode
            : eventCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventId: freezed == eventId
            ? _value.eventId
            : eventId // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventName: freezed == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventType: freezed == eventType
            ? _value.eventType
            : eventType // ignore: cast_nullable_to_non_nullable
                  as String?,
        forRestaurant: null == forRestaurant
            ? _value.forRestaurant
            : forRestaurant // ignore: cast_nullable_to_non_nullable
                  as bool,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        openend: null == openend
            ? _value.openend
            : openend // ignore: cast_nullable_to_non_nullable
                  as bool,
        startDateTime: freezed == startDateTime
            ? _value.startDateTime
            : startDateTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDateTimeLocalized: freezed == startDateTimeLocalized
            ? _value.startDateTimeLocalized
            : startDateTimeLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        teaser: freezed == teaser
            ? _value.teaser
            : teaser // ignore: cast_nullable_to_non_nullable
                  as String?,
        title: freezed == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        useCoverCharge: null == useCoverCharge
            ? _value.useCoverCharge
            : useCoverCharge // ignore: cast_nullable_to_non_nullable
                  as bool,
        venueCode: freezed == venueCode
            ? _value.venueCode
            : venueCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        venueName: freezed == venueName
            ? _value.venueName
            : venueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        venueType: freezed == venueType
            ? _value.venueType
            : venueType // ignore: cast_nullable_to_non_nullable
                  as String?,
        video: freezed == video
            ? _value.video
            : video // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyEventImpl implements _DailyEvent {
  const _$DailyEventImpl({
    final List<EventAvailability> availabilities = const [],
    this.bookable,
    this.bookmarkable,
    final List<EventCategory> categories = const [],
    this.costAdult,
    this.costChild,
    this.description,
    this.endDateTime,
    this.endDateTimeLocalized,
    this.eventCode,
    this.eventId,
    this.eventName,
    this.eventType,
    this.forRestaurant = false,
    this.image,
    this.openend = false,
    this.startDateTime,
    this.startDateTimeLocalized,
    this.teaser,
    this.title,
    this.useCoverCharge = false,
    this.venueCode,
    this.venueName,
    this.venueType,
    this.video,
  }) : _availabilities = availabilities,
       _categories = categories;

  factory _$DailyEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyEventImplFromJson(json);

  final List<EventAvailability> _availabilities;
  @override
  @JsonKey()
  List<EventAvailability> get availabilities {
    if (_availabilities is EqualUnmodifiableListView) return _availabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availabilities);
  }

  @override
  final bool? bookable;
  @override
  final bool? bookmarkable;
  final List<EventCategory> _categories;
  @override
  @JsonKey()
  List<EventCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final String? costAdult;
  @override
  final String? costChild;
  @override
  final String? description;
  @override
  final String? endDateTime;
  @override
  final LocalizedDateTime? endDateTimeLocalized;
  @override
  final String? eventCode;
  @override
  final String? eventId;
  @override
  final String? eventName;
  @override
  final String? eventType;
  @override
  @JsonKey()
  final bool forRestaurant;
  @override
  final String? image;
  @override
  @JsonKey()
  final bool openend;
  @override
  final String? startDateTime;
  @override
  final LocalizedDateTime? startDateTimeLocalized;
  @override
  final String? teaser;
  @override
  final String? title;
  @override
  @JsonKey()
  final bool useCoverCharge;
  @override
  final String? venueCode;
  @override
  final String? venueName;
  @override
  final String? venueType;
  @override
  final String? video;

  @override
  String toString() {
    return 'DailyEvent(availabilities: $availabilities, bookable: $bookable, bookmarkable: $bookmarkable, categories: $categories, costAdult: $costAdult, costChild: $costChild, description: $description, endDateTime: $endDateTime, endDateTimeLocalized: $endDateTimeLocalized, eventCode: $eventCode, eventId: $eventId, eventName: $eventName, eventType: $eventType, forRestaurant: $forRestaurant, image: $image, openend: $openend, startDateTime: $startDateTime, startDateTimeLocalized: $startDateTimeLocalized, teaser: $teaser, title: $title, useCoverCharge: $useCoverCharge, venueCode: $venueCode, venueName: $venueName, venueType: $venueType, video: $video)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyEventImpl &&
            const DeepCollectionEquality().equals(
              other._availabilities,
              _availabilities,
            ) &&
            (identical(other.bookable, bookable) ||
                other.bookable == bookable) &&
            (identical(other.bookmarkable, bookmarkable) ||
                other.bookmarkable == bookmarkable) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.costAdult, costAdult) ||
                other.costAdult == costAdult) &&
            (identical(other.costChild, costChild) ||
                other.costChild == costChild) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.endDateTime, endDateTime) ||
                other.endDateTime == endDateTime) &&
            (identical(other.endDateTimeLocalized, endDateTimeLocalized) ||
                other.endDateTimeLocalized == endDateTimeLocalized) &&
            (identical(other.eventCode, eventCode) ||
                other.eventCode == eventCode) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.forRestaurant, forRestaurant) ||
                other.forRestaurant == forRestaurant) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.openend, openend) || other.openend == openend) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.startDateTimeLocalized, startDateTimeLocalized) ||
                other.startDateTimeLocalized == startDateTimeLocalized) &&
            (identical(other.teaser, teaser) || other.teaser == teaser) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.useCoverCharge, useCoverCharge) ||
                other.useCoverCharge == useCoverCharge) &&
            (identical(other.venueCode, venueCode) ||
                other.venueCode == venueCode) &&
            (identical(other.venueName, venueName) ||
                other.venueName == venueName) &&
            (identical(other.venueType, venueType) ||
                other.venueType == venueType) &&
            (identical(other.video, video) || other.video == video));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    const DeepCollectionEquality().hash(_availabilities),
    bookable,
    bookmarkable,
    const DeepCollectionEquality().hash(_categories),
    costAdult,
    costChild,
    description,
    endDateTime,
    endDateTimeLocalized,
    eventCode,
    eventId,
    eventName,
    eventType,
    forRestaurant,
    image,
    openend,
    startDateTime,
    startDateTimeLocalized,
    teaser,
    title,
    useCoverCharge,
    venueCode,
    venueName,
    venueType,
    video,
  ]);

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyEventImplCopyWith<_$DailyEventImpl> get copyWith =>
      __$$DailyEventImplCopyWithImpl<_$DailyEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyEventImplToJson(this);
  }
}

abstract class _DailyEvent implements DailyEvent {
  const factory _DailyEvent({
    final List<EventAvailability> availabilities,
    final bool? bookable,
    final bool? bookmarkable,
    final List<EventCategory> categories,
    final String? costAdult,
    final String? costChild,
    final String? description,
    final String? endDateTime,
    final LocalizedDateTime? endDateTimeLocalized,
    final String? eventCode,
    final String? eventId,
    final String? eventName,
    final String? eventType,
    final bool forRestaurant,
    final String? image,
    final bool openend,
    final String? startDateTime,
    final LocalizedDateTime? startDateTimeLocalized,
    final String? teaser,
    final String? title,
    final bool useCoverCharge,
    final String? venueCode,
    final String? venueName,
    final String? venueType,
    final String? video,
  }) = _$DailyEventImpl;

  factory _DailyEvent.fromJson(Map<String, dynamic> json) =
      _$DailyEventImpl.fromJson;

  @override
  List<EventAvailability> get availabilities;
  @override
  bool? get bookable;
  @override
  bool? get bookmarkable;
  @override
  List<EventCategory> get categories;
  @override
  String? get costAdult;
  @override
  String? get costChild;
  @override
  String? get description;
  @override
  String? get endDateTime;
  @override
  LocalizedDateTime? get endDateTimeLocalized;
  @override
  String? get eventCode;
  @override
  String? get eventId;
  @override
  String? get eventName;
  @override
  String? get eventType;
  @override
  bool get forRestaurant;
  @override
  String? get image;
  @override
  bool get openend;
  @override
  String? get startDateTime;
  @override
  LocalizedDateTime? get startDateTimeLocalized;
  @override
  String? get teaser;
  @override
  String? get title;
  @override
  bool get useCoverCharge;
  @override
  String? get venueCode;
  @override
  String? get venueName;
  @override
  String? get venueType;
  @override
  String? get video;

  /// Create a copy of DailyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyEventImplCopyWith<_$DailyEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyEventsData _$DailyEventsDataFromJson(Map<String, dynamic> json) {
  return _DailyEventsData.fromJson(json);
}

/// @nodoc
mixin _$DailyEventsData {
  List<DailyEvent> get morning => throw _privateConstructorUsedError;
  List<DailyEvent> get afternoon => throw _privateConstructorUsedError;
  List<DailyEvent> get evening => throw _privateConstructorUsedError;
  List<DailyEvent> get night => throw _privateConstructorUsedError;

  /// Serializes this DailyEventsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyEventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyEventsDataCopyWith<DailyEventsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyEventsDataCopyWith<$Res> {
  factory $DailyEventsDataCopyWith(
    DailyEventsData value,
    $Res Function(DailyEventsData) then,
  ) = _$DailyEventsDataCopyWithImpl<$Res, DailyEventsData>;
  @useResult
  $Res call({
    List<DailyEvent> morning,
    List<DailyEvent> afternoon,
    List<DailyEvent> evening,
    List<DailyEvent> night,
  });
}

/// @nodoc
class _$DailyEventsDataCopyWithImpl<$Res, $Val extends DailyEventsData>
    implements $DailyEventsDataCopyWith<$Res> {
  _$DailyEventsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyEventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? morning = null,
    Object? afternoon = null,
    Object? evening = null,
    Object? night = null,
  }) {
    return _then(
      _value.copyWith(
            morning: null == morning
                ? _value.morning
                : morning // ignore: cast_nullable_to_non_nullable
                      as List<DailyEvent>,
            afternoon: null == afternoon
                ? _value.afternoon
                : afternoon // ignore: cast_nullable_to_non_nullable
                      as List<DailyEvent>,
            evening: null == evening
                ? _value.evening
                : evening // ignore: cast_nullable_to_non_nullable
                      as List<DailyEvent>,
            night: null == night
                ? _value.night
                : night // ignore: cast_nullable_to_non_nullable
                      as List<DailyEvent>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyEventsDataImplCopyWith<$Res>
    implements $DailyEventsDataCopyWith<$Res> {
  factory _$$DailyEventsDataImplCopyWith(
    _$DailyEventsDataImpl value,
    $Res Function(_$DailyEventsDataImpl) then,
  ) = __$$DailyEventsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<DailyEvent> morning,
    List<DailyEvent> afternoon,
    List<DailyEvent> evening,
    List<DailyEvent> night,
  });
}

/// @nodoc
class __$$DailyEventsDataImplCopyWithImpl<$Res>
    extends _$DailyEventsDataCopyWithImpl<$Res, _$DailyEventsDataImpl>
    implements _$$DailyEventsDataImplCopyWith<$Res> {
  __$$DailyEventsDataImplCopyWithImpl(
    _$DailyEventsDataImpl _value,
    $Res Function(_$DailyEventsDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyEventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? morning = null,
    Object? afternoon = null,
    Object? evening = null,
    Object? night = null,
  }) {
    return _then(
      _$DailyEventsDataImpl(
        morning: null == morning
            ? _value._morning
            : morning // ignore: cast_nullable_to_non_nullable
                  as List<DailyEvent>,
        afternoon: null == afternoon
            ? _value._afternoon
            : afternoon // ignore: cast_nullable_to_non_nullable
                  as List<DailyEvent>,
        evening: null == evening
            ? _value._evening
            : evening // ignore: cast_nullable_to_non_nullable
                  as List<DailyEvent>,
        night: null == night
            ? _value._night
            : night // ignore: cast_nullable_to_non_nullable
                  as List<DailyEvent>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyEventsDataImpl implements _DailyEventsData {
  const _$DailyEventsDataImpl({
    final List<DailyEvent> morning = const [],
    final List<DailyEvent> afternoon = const [],
    final List<DailyEvent> evening = const [],
    final List<DailyEvent> night = const [],
  }) : _morning = morning,
       _afternoon = afternoon,
       _evening = evening,
       _night = night;

  factory _$DailyEventsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyEventsDataImplFromJson(json);

  final List<DailyEvent> _morning;
  @override
  @JsonKey()
  List<DailyEvent> get morning {
    if (_morning is EqualUnmodifiableListView) return _morning;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_morning);
  }

  final List<DailyEvent> _afternoon;
  @override
  @JsonKey()
  List<DailyEvent> get afternoon {
    if (_afternoon is EqualUnmodifiableListView) return _afternoon;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_afternoon);
  }

  final List<DailyEvent> _evening;
  @override
  @JsonKey()
  List<DailyEvent> get evening {
    if (_evening is EqualUnmodifiableListView) return _evening;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evening);
  }

  final List<DailyEvent> _night;
  @override
  @JsonKey()
  List<DailyEvent> get night {
    if (_night is EqualUnmodifiableListView) return _night;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_night);
  }

  @override
  String toString() {
    return 'DailyEventsData(morning: $morning, afternoon: $afternoon, evening: $evening, night: $night)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyEventsDataImpl &&
            const DeepCollectionEquality().equals(other._morning, _morning) &&
            const DeepCollectionEquality().equals(
              other._afternoon,
              _afternoon,
            ) &&
            const DeepCollectionEquality().equals(other._evening, _evening) &&
            const DeepCollectionEquality().equals(other._night, _night));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_morning),
    const DeepCollectionEquality().hash(_afternoon),
    const DeepCollectionEquality().hash(_evening),
    const DeepCollectionEquality().hash(_night),
  );

  /// Create a copy of DailyEventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyEventsDataImplCopyWith<_$DailyEventsDataImpl> get copyWith =>
      __$$DailyEventsDataImplCopyWithImpl<_$DailyEventsDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyEventsDataImplToJson(this);
  }
}

abstract class _DailyEventsData implements DailyEventsData {
  const factory _DailyEventsData({
    final List<DailyEvent> morning,
    final List<DailyEvent> afternoon,
    final List<DailyEvent> evening,
    final List<DailyEvent> night,
  }) = _$DailyEventsDataImpl;

  factory _DailyEventsData.fromJson(Map<String, dynamic> json) =
      _$DailyEventsDataImpl.fromJson;

  @override
  List<DailyEvent> get morning;
  @override
  List<DailyEvent> get afternoon;
  @override
  List<DailyEvent> get evening;
  @override
  List<DailyEvent> get night;

  /// Create a copy of DailyEventsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyEventsDataImplCopyWith<_$DailyEventsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyEventsResponse _$DailyEventsResponseFromJson(Map<String, dynamic> json) {
  return _DailyEventsResponse.fromJson(json);
}

/// @nodoc
mixin _$DailyEventsResponse {
  DailyEventsData? get data => throw _privateConstructorUsedError;

  /// Serializes this DailyEventsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyEventsResponseCopyWith<DailyEventsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyEventsResponseCopyWith<$Res> {
  factory $DailyEventsResponseCopyWith(
    DailyEventsResponse value,
    $Res Function(DailyEventsResponse) then,
  ) = _$DailyEventsResponseCopyWithImpl<$Res, DailyEventsResponse>;
  @useResult
  $Res call({DailyEventsData? data});

  $DailyEventsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$DailyEventsResponseCopyWithImpl<$Res, $Val extends DailyEventsResponse>
    implements $DailyEventsResponseCopyWith<$Res> {
  _$DailyEventsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _value.copyWith(
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as DailyEventsData?,
          )
          as $Val,
    );
  }

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DailyEventsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DailyEventsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyEventsResponseImplCopyWith<$Res>
    implements $DailyEventsResponseCopyWith<$Res> {
  factory _$$DailyEventsResponseImplCopyWith(
    _$DailyEventsResponseImpl value,
    $Res Function(_$DailyEventsResponseImpl) then,
  ) = __$$DailyEventsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DailyEventsData? data});

  @override
  $DailyEventsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$DailyEventsResponseImplCopyWithImpl<$Res>
    extends _$DailyEventsResponseCopyWithImpl<$Res, _$DailyEventsResponseImpl>
    implements _$$DailyEventsResponseImplCopyWith<$Res> {
  __$$DailyEventsResponseImplCopyWithImpl(
    _$DailyEventsResponseImpl _value,
    $Res Function(_$DailyEventsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = freezed}) {
    return _then(
      _$DailyEventsResponseImpl(
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as DailyEventsData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyEventsResponseImpl implements _DailyEventsResponse {
  const _$DailyEventsResponseImpl({this.data});

  factory _$DailyEventsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyEventsResponseImplFromJson(json);

  @override
  final DailyEventsData? data;

  @override
  String toString() {
    return 'DailyEventsResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyEventsResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyEventsResponseImplCopyWith<_$DailyEventsResponseImpl> get copyWith =>
      __$$DailyEventsResponseImplCopyWithImpl<_$DailyEventsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyEventsResponseImplToJson(this);
  }
}

abstract class _DailyEventsResponse implements DailyEventsResponse {
  const factory _DailyEventsResponse({final DailyEventsData? data}) =
      _$DailyEventsResponseImpl;

  factory _DailyEventsResponse.fromJson(Map<String, dynamic> json) =
      _$DailyEventsResponseImpl.fromJson;

  @override
  DailyEventsData? get data;

  /// Create a copy of DailyEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyEventsResponseImplCopyWith<_$DailyEventsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MealPeriod _$MealPeriodFromJson(Map<String, dynamic> json) {
  return _MealPeriod.fromJson(json);
}

/// @nodoc
mixin _$MealPeriod {
  String? get description => throw _privateConstructorUsedError;
  LocalizedDateTime? get startDateLocalized =>
      throw _privateConstructorUsedError;
  LocalizedDateTime? get endDateLocalized => throw _privateConstructorUsedError;

  /// Serializes this MealPeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealPeriodCopyWith<MealPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPeriodCopyWith<$Res> {
  factory $MealPeriodCopyWith(
    MealPeriod value,
    $Res Function(MealPeriod) then,
  ) = _$MealPeriodCopyWithImpl<$Res, MealPeriod>;
  @useResult
  $Res call({
    String? description,
    LocalizedDateTime? startDateLocalized,
    LocalizedDateTime? endDateLocalized,
  });

  $LocalizedDateTimeCopyWith<$Res>? get startDateLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get endDateLocalized;
}

/// @nodoc
class _$MealPeriodCopyWithImpl<$Res, $Val extends MealPeriod>
    implements $MealPeriodCopyWith<$Res> {
  _$MealPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? startDateLocalized = freezed,
    Object? endDateLocalized = freezed,
  }) {
    return _then(
      _value.copyWith(
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            startDateLocalized: freezed == startDateLocalized
                ? _value.startDateLocalized
                : startDateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            endDateLocalized: freezed == endDateLocalized
                ? _value.endDateLocalized
                : endDateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get startDateLocalized {
    if (_value.startDateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.startDateLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(startDateLocalized: value) as $Val);
    });
  }

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get endDateLocalized {
    if (_value.endDateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.endDateLocalized!, (value) {
      return _then(_value.copyWith(endDateLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealPeriodImplCopyWith<$Res>
    implements $MealPeriodCopyWith<$Res> {
  factory _$$MealPeriodImplCopyWith(
    _$MealPeriodImpl value,
    $Res Function(_$MealPeriodImpl) then,
  ) = __$$MealPeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? description,
    LocalizedDateTime? startDateLocalized,
    LocalizedDateTime? endDateLocalized,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get startDateLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get endDateLocalized;
}

/// @nodoc
class __$$MealPeriodImplCopyWithImpl<$Res>
    extends _$MealPeriodCopyWithImpl<$Res, _$MealPeriodImpl>
    implements _$$MealPeriodImplCopyWith<$Res> {
  __$$MealPeriodImplCopyWithImpl(
    _$MealPeriodImpl _value,
    $Res Function(_$MealPeriodImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? startDateLocalized = freezed,
    Object? endDateLocalized = freezed,
  }) {
    return _then(
      _$MealPeriodImpl(
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        startDateLocalized: freezed == startDateLocalized
            ? _value.startDateLocalized
            : startDateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        endDateLocalized: freezed == endDateLocalized
            ? _value.endDateLocalized
            : endDateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MealPeriodImpl implements _MealPeriod {
  const _$MealPeriodImpl({
    this.description,
    this.startDateLocalized,
    this.endDateLocalized,
  });

  factory _$MealPeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealPeriodImplFromJson(json);

  @override
  final String? description;
  @override
  final LocalizedDateTime? startDateLocalized;
  @override
  final LocalizedDateTime? endDateLocalized;

  @override
  String toString() {
    return 'MealPeriod(description: $description, startDateLocalized: $startDateLocalized, endDateLocalized: $endDateLocalized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPeriodImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDateLocalized, startDateLocalized) ||
                other.startDateLocalized == startDateLocalized) &&
            (identical(other.endDateLocalized, endDateLocalized) ||
                other.endDateLocalized == endDateLocalized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    description,
    startDateLocalized,
    endDateLocalized,
  );

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPeriodImplCopyWith<_$MealPeriodImpl> get copyWith =>
      __$$MealPeriodImplCopyWithImpl<_$MealPeriodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealPeriodImplToJson(this);
  }
}

abstract class _MealPeriod implements MealPeriod {
  const factory _MealPeriod({
    final String? description,
    final LocalizedDateTime? startDateLocalized,
    final LocalizedDateTime? endDateLocalized,
  }) = _$MealPeriodImpl;

  factory _MealPeriod.fromJson(Map<String, dynamic> json) =
      _$MealPeriodImpl.fromJson;

  @override
  String? get description;
  @override
  LocalizedDateTime? get startDateLocalized;
  @override
  LocalizedDateTime? get endDateLocalized;

  /// Create a copy of MealPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealPeriodImplCopyWith<_$MealPeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VenueMealPeriods _$VenueMealPeriodsFromJson(Map<String, dynamic> json) {
  return _VenueMealPeriods.fromJson(json);
}

/// @nodoc
mixin _$VenueMealPeriods {
  List<MealPeriod>? get breakfast => throw _privateConstructorUsedError;
  List<MealPeriod>? get lunch => throw _privateConstructorUsedError;
  List<MealPeriod>? get dinner => throw _privateConstructorUsedError;

  /// Serializes this VenueMealPeriods to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VenueMealPeriods
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueMealPeriodsCopyWith<VenueMealPeriods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueMealPeriodsCopyWith<$Res> {
  factory $VenueMealPeriodsCopyWith(
    VenueMealPeriods value,
    $Res Function(VenueMealPeriods) then,
  ) = _$VenueMealPeriodsCopyWithImpl<$Res, VenueMealPeriods>;
  @useResult
  $Res call({
    List<MealPeriod>? breakfast,
    List<MealPeriod>? lunch,
    List<MealPeriod>? dinner,
  });
}

/// @nodoc
class _$VenueMealPeriodsCopyWithImpl<$Res, $Val extends VenueMealPeriods>
    implements $VenueMealPeriodsCopyWith<$Res> {
  _$VenueMealPeriodsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VenueMealPeriods
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
  }) {
    return _then(
      _value.copyWith(
            breakfast: freezed == breakfast
                ? _value.breakfast
                : breakfast // ignore: cast_nullable_to_non_nullable
                      as List<MealPeriod>?,
            lunch: freezed == lunch
                ? _value.lunch
                : lunch // ignore: cast_nullable_to_non_nullable
                      as List<MealPeriod>?,
            dinner: freezed == dinner
                ? _value.dinner
                : dinner // ignore: cast_nullable_to_non_nullable
                      as List<MealPeriod>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$VenueMealPeriodsImplCopyWith<$Res>
    implements $VenueMealPeriodsCopyWith<$Res> {
  factory _$$VenueMealPeriodsImplCopyWith(
    _$VenueMealPeriodsImpl value,
    $Res Function(_$VenueMealPeriodsImpl) then,
  ) = __$$VenueMealPeriodsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<MealPeriod>? breakfast,
    List<MealPeriod>? lunch,
    List<MealPeriod>? dinner,
  });
}

/// @nodoc
class __$$VenueMealPeriodsImplCopyWithImpl<$Res>
    extends _$VenueMealPeriodsCopyWithImpl<$Res, _$VenueMealPeriodsImpl>
    implements _$$VenueMealPeriodsImplCopyWith<$Res> {
  __$$VenueMealPeriodsImplCopyWithImpl(
    _$VenueMealPeriodsImpl _value,
    $Res Function(_$VenueMealPeriodsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VenueMealPeriods
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakfast = freezed,
    Object? lunch = freezed,
    Object? dinner = freezed,
  }) {
    return _then(
      _$VenueMealPeriodsImpl(
        breakfast: freezed == breakfast
            ? _value._breakfast
            : breakfast // ignore: cast_nullable_to_non_nullable
                  as List<MealPeriod>?,
        lunch: freezed == lunch
            ? _value._lunch
            : lunch // ignore: cast_nullable_to_non_nullable
                  as List<MealPeriod>?,
        dinner: freezed == dinner
            ? _value._dinner
            : dinner // ignore: cast_nullable_to_non_nullable
                  as List<MealPeriod>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueMealPeriodsImpl implements _VenueMealPeriods {
  const _$VenueMealPeriodsImpl({
    final List<MealPeriod>? breakfast,
    final List<MealPeriod>? lunch,
    final List<MealPeriod>? dinner,
  }) : _breakfast = breakfast,
       _lunch = lunch,
       _dinner = dinner;

  factory _$VenueMealPeriodsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueMealPeriodsImplFromJson(json);

  final List<MealPeriod>? _breakfast;
  @override
  List<MealPeriod>? get breakfast {
    final value = _breakfast;
    if (value == null) return null;
    if (_breakfast is EqualUnmodifiableListView) return _breakfast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MealPeriod>? _lunch;
  @override
  List<MealPeriod>? get lunch {
    final value = _lunch;
    if (value == null) return null;
    if (_lunch is EqualUnmodifiableListView) return _lunch;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<MealPeriod>? _dinner;
  @override
  List<MealPeriod>? get dinner {
    final value = _dinner;
    if (value == null) return null;
    if (_dinner is EqualUnmodifiableListView) return _dinner;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VenueMealPeriods(breakfast: $breakfast, lunch: $lunch, dinner: $dinner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueMealPeriodsImpl &&
            const DeepCollectionEquality().equals(
              other._breakfast,
              _breakfast,
            ) &&
            const DeepCollectionEquality().equals(other._lunch, _lunch) &&
            const DeepCollectionEquality().equals(other._dinner, _dinner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_breakfast),
    const DeepCollectionEquality().hash(_lunch),
    const DeepCollectionEquality().hash(_dinner),
  );

  /// Create a copy of VenueMealPeriods
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueMealPeriodsImplCopyWith<_$VenueMealPeriodsImpl> get copyWith =>
      __$$VenueMealPeriodsImplCopyWithImpl<_$VenueMealPeriodsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueMealPeriodsImplToJson(this);
  }
}

abstract class _VenueMealPeriods implements VenueMealPeriods {
  const factory _VenueMealPeriods({
    final List<MealPeriod>? breakfast,
    final List<MealPeriod>? lunch,
    final List<MealPeriod>? dinner,
  }) = _$VenueMealPeriodsImpl;

  factory _VenueMealPeriods.fromJson(Map<String, dynamic> json) =
      _$VenueMealPeriodsImpl.fromJson;

  @override
  List<MealPeriod>? get breakfast;
  @override
  List<MealPeriod>? get lunch;
  @override
  List<MealPeriod>? get dinner;

  /// Create a copy of VenueMealPeriods
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueMealPeriodsImplCopyWith<_$VenueMealPeriodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpeningVenue _$OpeningVenueFromJson(Map<String, dynamic> json) {
  return _OpeningVenue.fromJson(json);
}

/// @nodoc
mixin _$OpeningVenue {
  String? get deck => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  VenueMealPeriods? get mealPeriods => throw _privateConstructorUsedError;
  String? get venueCode => throw _privateConstructorUsedError;
  String? get venueName => throw _privateConstructorUsedError;
  String? get venueType => throw _privateConstructorUsedError;

  /// Serializes this OpeningVenue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpeningVenueCopyWith<OpeningVenue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningVenueCopyWith<$Res> {
  factory $OpeningVenueCopyWith(
    OpeningVenue value,
    $Res Function(OpeningVenue) then,
  ) = _$OpeningVenueCopyWithImpl<$Res, OpeningVenue>;
  @useResult
  $Res call({
    String? deck,
    String? description,
    VenueMealPeriods? mealPeriods,
    String? venueCode,
    String? venueName,
    String? venueType,
  });

  $VenueMealPeriodsCopyWith<$Res>? get mealPeriods;
}

/// @nodoc
class _$OpeningVenueCopyWithImpl<$Res, $Val extends OpeningVenue>
    implements $OpeningVenueCopyWith<$Res> {
  _$OpeningVenueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = freezed,
    Object? description = freezed,
    Object? mealPeriods = freezed,
    Object? venueCode = freezed,
    Object? venueName = freezed,
    Object? venueType = freezed,
  }) {
    return _then(
      _value.copyWith(
            deck: freezed == deck
                ? _value.deck
                : deck // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            mealPeriods: freezed == mealPeriods
                ? _value.mealPeriods
                : mealPeriods // ignore: cast_nullable_to_non_nullable
                      as VenueMealPeriods?,
            venueCode: freezed == venueCode
                ? _value.venueCode
                : venueCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            venueName: freezed == venueName
                ? _value.venueName
                : venueName // ignore: cast_nullable_to_non_nullable
                      as String?,
            venueType: freezed == venueType
                ? _value.venueType
                : venueType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VenueMealPeriodsCopyWith<$Res>? get mealPeriods {
    if (_value.mealPeriods == null) {
      return null;
    }

    return $VenueMealPeriodsCopyWith<$Res>(_value.mealPeriods!, (value) {
      return _then(_value.copyWith(mealPeriods: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OpeningVenueImplCopyWith<$Res>
    implements $OpeningVenueCopyWith<$Res> {
  factory _$$OpeningVenueImplCopyWith(
    _$OpeningVenueImpl value,
    $Res Function(_$OpeningVenueImpl) then,
  ) = __$$OpeningVenueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? deck,
    String? description,
    VenueMealPeriods? mealPeriods,
    String? venueCode,
    String? venueName,
    String? venueType,
  });

  @override
  $VenueMealPeriodsCopyWith<$Res>? get mealPeriods;
}

/// @nodoc
class __$$OpeningVenueImplCopyWithImpl<$Res>
    extends _$OpeningVenueCopyWithImpl<$Res, _$OpeningVenueImpl>
    implements _$$OpeningVenueImplCopyWith<$Res> {
  __$$OpeningVenueImplCopyWithImpl(
    _$OpeningVenueImpl _value,
    $Res Function(_$OpeningVenueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deck = freezed,
    Object? description = freezed,
    Object? mealPeriods = freezed,
    Object? venueCode = freezed,
    Object? venueName = freezed,
    Object? venueType = freezed,
  }) {
    return _then(
      _$OpeningVenueImpl(
        deck: freezed == deck
            ? _value.deck
            : deck // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        mealPeriods: freezed == mealPeriods
            ? _value.mealPeriods
            : mealPeriods // ignore: cast_nullable_to_non_nullable
                  as VenueMealPeriods?,
        venueCode: freezed == venueCode
            ? _value.venueCode
            : venueCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        venueName: freezed == venueName
            ? _value.venueName
            : venueName // ignore: cast_nullable_to_non_nullable
                  as String?,
        venueType: freezed == venueType
            ? _value.venueType
            : venueType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningVenueImpl implements _OpeningVenue {
  const _$OpeningVenueImpl({
    this.deck,
    this.description,
    this.mealPeriods,
    this.venueCode,
    this.venueName,
    this.venueType,
  });

  factory _$OpeningVenueImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningVenueImplFromJson(json);

  @override
  final String? deck;
  @override
  final String? description;
  @override
  final VenueMealPeriods? mealPeriods;
  @override
  final String? venueCode;
  @override
  final String? venueName;
  @override
  final String? venueType;

  @override
  String toString() {
    return 'OpeningVenue(deck: $deck, description: $description, mealPeriods: $mealPeriods, venueCode: $venueCode, venueName: $venueName, venueType: $venueType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningVenueImpl &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mealPeriods, mealPeriods) ||
                other.mealPeriods == mealPeriods) &&
            (identical(other.venueCode, venueCode) ||
                other.venueCode == venueCode) &&
            (identical(other.venueName, venueName) ||
                other.venueName == venueName) &&
            (identical(other.venueType, venueType) ||
                other.venueType == venueType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deck,
    description,
    mealPeriods,
    venueCode,
    venueName,
    venueType,
  );

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningVenueImplCopyWith<_$OpeningVenueImpl> get copyWith =>
      __$$OpeningVenueImplCopyWithImpl<_$OpeningVenueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningVenueImplToJson(this);
  }
}

abstract class _OpeningVenue implements OpeningVenue {
  const factory _OpeningVenue({
    final String? deck,
    final String? description,
    final VenueMealPeriods? mealPeriods,
    final String? venueCode,
    final String? venueName,
    final String? venueType,
  }) = _$OpeningVenueImpl;

  factory _OpeningVenue.fromJson(Map<String, dynamic> json) =
      _$OpeningVenueImpl.fromJson;

  @override
  String? get deck;
  @override
  String? get description;
  @override
  VenueMealPeriods? get mealPeriods;
  @override
  String? get venueCode;
  @override
  String? get venueName;
  @override
  String? get venueType;

  /// Create a copy of OpeningVenue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpeningVenueImplCopyWith<_$OpeningVenueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpeningCategory _$OpeningCategoryFromJson(Map<String, dynamic> json) {
  return _OpeningCategory.fromJson(json);
}

/// @nodoc
mixin _$OpeningCategory {
  String? get categoryName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get sort => throw _privateConstructorUsedError;
  List<OpeningVenue> get venues => throw _privateConstructorUsedError;

  /// Serializes this OpeningCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpeningCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpeningCategoryCopyWith<OpeningCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningCategoryCopyWith<$Res> {
  factory $OpeningCategoryCopyWith(
    OpeningCategory value,
    $Res Function(OpeningCategory) then,
  ) = _$OpeningCategoryCopyWithImpl<$Res, OpeningCategory>;
  @useResult
  $Res call({
    String? categoryName,
    String? description,
    String? sort,
    List<OpeningVenue> venues,
  });
}

/// @nodoc
class _$OpeningCategoryCopyWithImpl<$Res, $Val extends OpeningCategory>
    implements $OpeningCategoryCopyWith<$Res> {
  _$OpeningCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpeningCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? sort = freezed,
    Object? venues = null,
  }) {
    return _then(
      _value.copyWith(
            categoryName: freezed == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            sort: freezed == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                      as String?,
            venues: null == venues
                ? _value.venues
                : venues // ignore: cast_nullable_to_non_nullable
                      as List<OpeningVenue>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpeningCategoryImplCopyWith<$Res>
    implements $OpeningCategoryCopyWith<$Res> {
  factory _$$OpeningCategoryImplCopyWith(
    _$OpeningCategoryImpl value,
    $Res Function(_$OpeningCategoryImpl) then,
  ) = __$$OpeningCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? categoryName,
    String? description,
    String? sort,
    List<OpeningVenue> venues,
  });
}

/// @nodoc
class __$$OpeningCategoryImplCopyWithImpl<$Res>
    extends _$OpeningCategoryCopyWithImpl<$Res, _$OpeningCategoryImpl>
    implements _$$OpeningCategoryImplCopyWith<$Res> {
  __$$OpeningCategoryImplCopyWithImpl(
    _$OpeningCategoryImpl _value,
    $Res Function(_$OpeningCategoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpeningCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = freezed,
    Object? description = freezed,
    Object? sort = freezed,
    Object? venues = null,
  }) {
    return _then(
      _$OpeningCategoryImpl(
        categoryName: freezed == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        sort: freezed == sort
            ? _value.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as String?,
        venues: null == venues
            ? _value._venues
            : venues // ignore: cast_nullable_to_non_nullable
                  as List<OpeningVenue>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningCategoryImpl implements _OpeningCategory {
  const _$OpeningCategoryImpl({
    this.categoryName,
    this.description,
    this.sort,
    final List<OpeningVenue> venues = const [],
  }) : _venues = venues;

  factory _$OpeningCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningCategoryImplFromJson(json);

  @override
  final String? categoryName;
  @override
  final String? description;
  @override
  final String? sort;
  final List<OpeningVenue> _venues;
  @override
  @JsonKey()
  List<OpeningVenue> get venues {
    if (_venues is EqualUnmodifiableListView) return _venues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_venues);
  }

  @override
  String toString() {
    return 'OpeningCategory(categoryName: $categoryName, description: $description, sort: $sort, venues: $venues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningCategoryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            const DeepCollectionEquality().equals(other._venues, _venues));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryName,
    description,
    sort,
    const DeepCollectionEquality().hash(_venues),
  );

  /// Create a copy of OpeningCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningCategoryImplCopyWith<_$OpeningCategoryImpl> get copyWith =>
      __$$OpeningCategoryImplCopyWithImpl<_$OpeningCategoryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningCategoryImplToJson(this);
  }
}

abstract class _OpeningCategory implements OpeningCategory {
  const factory _OpeningCategory({
    final String? categoryName,
    final String? description,
    final String? sort,
    final List<OpeningVenue> venues,
  }) = _$OpeningCategoryImpl;

  factory _OpeningCategory.fromJson(Map<String, dynamic> json) =
      _$OpeningCategoryImpl.fromJson;

  @override
  String? get categoryName;
  @override
  String? get description;
  @override
  String? get sort;
  @override
  List<OpeningVenue> get venues;

  /// Create a copy of OpeningCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpeningCategoryImplCopyWith<_$OpeningCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OpeningHoursResponse _$OpeningHoursResponseFromJson(Map<String, dynamic> json) {
  return _OpeningHoursResponse.fromJson(json);
}

/// @nodoc
mixin _$OpeningHoursResponse {
  List<OpeningCategory> get data => throw _privateConstructorUsedError;

  /// Serializes this OpeningHoursResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OpeningHoursResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OpeningHoursResponseCopyWith<OpeningHoursResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpeningHoursResponseCopyWith<$Res> {
  factory $OpeningHoursResponseCopyWith(
    OpeningHoursResponse value,
    $Res Function(OpeningHoursResponse) then,
  ) = _$OpeningHoursResponseCopyWithImpl<$Res, OpeningHoursResponse>;
  @useResult
  $Res call({List<OpeningCategory> data});
}

/// @nodoc
class _$OpeningHoursResponseCopyWithImpl<
  $Res,
  $Val extends OpeningHoursResponse
>
    implements $OpeningHoursResponseCopyWith<$Res> {
  _$OpeningHoursResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OpeningHoursResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<OpeningCategory>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OpeningHoursResponseImplCopyWith<$Res>
    implements $OpeningHoursResponseCopyWith<$Res> {
  factory _$$OpeningHoursResponseImplCopyWith(
    _$OpeningHoursResponseImpl value,
    $Res Function(_$OpeningHoursResponseImpl) then,
  ) = __$$OpeningHoursResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<OpeningCategory> data});
}

/// @nodoc
class __$$OpeningHoursResponseImplCopyWithImpl<$Res>
    extends _$OpeningHoursResponseCopyWithImpl<$Res, _$OpeningHoursResponseImpl>
    implements _$$OpeningHoursResponseImplCopyWith<$Res> {
  __$$OpeningHoursResponseImplCopyWithImpl(
    _$OpeningHoursResponseImpl _value,
    $Res Function(_$OpeningHoursResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OpeningHoursResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$OpeningHoursResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<OpeningCategory>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OpeningHoursResponseImpl implements _OpeningHoursResponse {
  const _$OpeningHoursResponseImpl({
    final List<OpeningCategory> data = const [],
  }) : _data = data;

  factory _$OpeningHoursResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OpeningHoursResponseImplFromJson(json);

  final List<OpeningCategory> _data;
  @override
  @JsonKey()
  List<OpeningCategory> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'OpeningHoursResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpeningHoursResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of OpeningHoursResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpeningHoursResponseImplCopyWith<_$OpeningHoursResponseImpl>
  get copyWith =>
      __$$OpeningHoursResponseImplCopyWithImpl<_$OpeningHoursResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OpeningHoursResponseImplToJson(this);
  }
}

abstract class _OpeningHoursResponse implements OpeningHoursResponse {
  const factory _OpeningHoursResponse({final List<OpeningCategory> data}) =
      _$OpeningHoursResponseImpl;

  factory _OpeningHoursResponse.fromJson(Map<String, dynamic> json) =
      _$OpeningHoursResponseImpl.fromJson;

  @override
  List<OpeningCategory> get data;

  /// Create a copy of OpeningHoursResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpeningHoursResponseImplCopyWith<_$OpeningHoursResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
