// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

VenueOpeningSlot _$VenueOpeningSlotFromJson(Map<String, dynamic> json) {
  return _VenueOpeningSlot.fromJson(json);
}

/// @nodoc
mixin _$VenueOpeningSlot {
  String? get description => throw _privateConstructorUsedError;
  LocalizedDateTime? get openFrom => throw _privateConstructorUsedError;
  LocalizedDateTime? get openTo => throw _privateConstructorUsedError;

  /// Serializes this VenueOpeningSlot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VenueOpeningSlotCopyWith<VenueOpeningSlot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VenueOpeningSlotCopyWith<$Res> {
  factory $VenueOpeningSlotCopyWith(
    VenueOpeningSlot value,
    $Res Function(VenueOpeningSlot) then,
  ) = _$VenueOpeningSlotCopyWithImpl<$Res, VenueOpeningSlot>;
  @useResult
  $Res call({
    String? description,
    LocalizedDateTime? openFrom,
    LocalizedDateTime? openTo,
  });

  $LocalizedDateTimeCopyWith<$Res>? get openFrom;
  $LocalizedDateTimeCopyWith<$Res>? get openTo;
}

/// @nodoc
class _$VenueOpeningSlotCopyWithImpl<$Res, $Val extends VenueOpeningSlot>
    implements $VenueOpeningSlotCopyWith<$Res> {
  _$VenueOpeningSlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? openFrom = freezed,
    Object? openTo = freezed,
  }) {
    return _then(
      _value.copyWith(
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            openFrom: freezed == openFrom
                ? _value.openFrom
                : openFrom // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            openTo: freezed == openTo
                ? _value.openTo
                : openTo // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get openFrom {
    if (_value.openFrom == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.openFrom!, (value) {
      return _then(_value.copyWith(openFrom: value) as $Val);
    });
  }

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get openTo {
    if (_value.openTo == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.openTo!, (value) {
      return _then(_value.copyWith(openTo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VenueOpeningSlotImplCopyWith<$Res>
    implements $VenueOpeningSlotCopyWith<$Res> {
  factory _$$VenueOpeningSlotImplCopyWith(
    _$VenueOpeningSlotImpl value,
    $Res Function(_$VenueOpeningSlotImpl) then,
  ) = __$$VenueOpeningSlotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? description,
    LocalizedDateTime? openFrom,
    LocalizedDateTime? openTo,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get openFrom;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get openTo;
}

/// @nodoc
class __$$VenueOpeningSlotImplCopyWithImpl<$Res>
    extends _$VenueOpeningSlotCopyWithImpl<$Res, _$VenueOpeningSlotImpl>
    implements _$$VenueOpeningSlotImplCopyWith<$Res> {
  __$$VenueOpeningSlotImplCopyWithImpl(
    _$VenueOpeningSlotImpl _value,
    $Res Function(_$VenueOpeningSlotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? openFrom = freezed,
    Object? openTo = freezed,
  }) {
    return _then(
      _$VenueOpeningSlotImpl(
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        openFrom: freezed == openFrom
            ? _value.openFrom
            : openFrom // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        openTo: freezed == openTo
            ? _value.openTo
            : openTo // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VenueOpeningSlotImpl implements _VenueOpeningSlot {
  const _$VenueOpeningSlotImpl({this.description, this.openFrom, this.openTo});

  factory _$VenueOpeningSlotImpl.fromJson(Map<String, dynamic> json) =>
      _$$VenueOpeningSlotImplFromJson(json);

  @override
  final String? description;
  @override
  final LocalizedDateTime? openFrom;
  @override
  final LocalizedDateTime? openTo;

  @override
  String toString() {
    return 'VenueOpeningSlot(description: $description, openFrom: $openFrom, openTo: $openTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VenueOpeningSlotImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.openFrom, openFrom) ||
                other.openFrom == openFrom) &&
            (identical(other.openTo, openTo) || other.openTo == openTo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, openFrom, openTo);

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VenueOpeningSlotImplCopyWith<_$VenueOpeningSlotImpl> get copyWith =>
      __$$VenueOpeningSlotImplCopyWithImpl<_$VenueOpeningSlotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$VenueOpeningSlotImplToJson(this);
  }
}

abstract class _VenueOpeningSlot implements VenueOpeningSlot {
  const factory _VenueOpeningSlot({
    final String? description,
    final LocalizedDateTime? openFrom,
    final LocalizedDateTime? openTo,
  }) = _$VenueOpeningSlotImpl;

  factory _VenueOpeningSlot.fromJson(Map<String, dynamic> json) =
      _$VenueOpeningSlotImpl.fromJson;

  @override
  String? get description;
  @override
  LocalizedDateTime? get openFrom;
  @override
  LocalizedDateTime? get openTo;

  /// Create a copy of VenueOpeningSlot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VenueOpeningSlotImplCopyWith<_$VenueOpeningSlotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  bool? get afternoontea => throw _privateConstructorUsedError;
  String? get agerestriction => throw _privateConstructorUsedError;
  bool? get bookable => throw _privateConstructorUsedError;
  bool? get breakfast => throw _privateConstructorUsedError;
  String? get breakfastMenuUrl => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool? get chargeable => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get contact => throw _privateConstructorUsedError;
  String? get deck => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get dinner => throw _privateConstructorUsedError;
  String? get dinnerMenuUrl => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool? get lunch => throw _privateConstructorUsedError;
  String? get lunchMenuUrl => throw _privateConstructorUsedError;
  String? get mealdetail => throw _privateConstructorUsedError;
  List<MediaGalleryItem> get mediaGallery => throw _privateConstructorUsedError;
  bool? get morningtea => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get paxCount => throw _privateConstructorUsedError;
  bool? get special => throw _privateConstructorUsedError;
  bool? get supper => throw _privateConstructorUsedError;
  String? get teaser => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<List<VenueOpeningSlot>> get venueOpening =>
      throw _privateConstructorUsedError;

  /// Serializes this Restaurant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
    Restaurant value,
    $Res Function(Restaurant) then,
  ) = _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call({
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
    List<MediaGalleryItem> mediaGallery,
    bool? morningtea,
    String? name,
    int? paxCount,
    bool? special,
    bool? supper,
    String? teaser,
    String? type,
    List<List<VenueOpeningSlot>> venueOpening,
  });
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? afternoontea = freezed,
    Object? agerestriction = freezed,
    Object? bookable = freezed,
    Object? breakfast = freezed,
    Object? breakfastMenuUrl = freezed,
    Object? category = freezed,
    Object? chargeable = freezed,
    Object? code = freezed,
    Object? contact = freezed,
    Object? deck = freezed,
    Object? description = freezed,
    Object? dinner = freezed,
    Object? dinnerMenuUrl = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? lunch = freezed,
    Object? lunchMenuUrl = freezed,
    Object? mealdetail = freezed,
    Object? mediaGallery = null,
    Object? morningtea = freezed,
    Object? name = freezed,
    Object? paxCount = freezed,
    Object? special = freezed,
    Object? supper = freezed,
    Object? teaser = freezed,
    Object? type = freezed,
    Object? venueOpening = null,
  }) {
    return _then(
      _value.copyWith(
            afternoontea: freezed == afternoontea
                ? _value.afternoontea
                : afternoontea // ignore: cast_nullable_to_non_nullable
                      as bool?,
            agerestriction: freezed == agerestriction
                ? _value.agerestriction
                : agerestriction // ignore: cast_nullable_to_non_nullable
                      as String?,
            bookable: freezed == bookable
                ? _value.bookable
                : bookable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            breakfast: freezed == breakfast
                ? _value.breakfast
                : breakfast // ignore: cast_nullable_to_non_nullable
                      as bool?,
            breakfastMenuUrl: freezed == breakfastMenuUrl
                ? _value.breakfastMenuUrl
                : breakfastMenuUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            chargeable: freezed == chargeable
                ? _value.chargeable
                : chargeable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            code: freezed == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String?,
            contact: freezed == contact
                ? _value.contact
                : contact // ignore: cast_nullable_to_non_nullable
                      as String?,
            deck: freezed == deck
                ? _value.deck
                : deck // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            dinner: freezed == dinner
                ? _value.dinner
                : dinner // ignore: cast_nullable_to_non_nullable
                      as bool?,
            dinnerMenuUrl: freezed == dinnerMenuUrl
                ? _value.dinnerMenuUrl
                : dinnerMenuUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            lunch: freezed == lunch
                ? _value.lunch
                : lunch // ignore: cast_nullable_to_non_nullable
                      as bool?,
            lunchMenuUrl: freezed == lunchMenuUrl
                ? _value.lunchMenuUrl
                : lunchMenuUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            mealdetail: freezed == mealdetail
                ? _value.mealdetail
                : mealdetail // ignore: cast_nullable_to_non_nullable
                      as String?,
            mediaGallery: null == mediaGallery
                ? _value.mediaGallery
                : mediaGallery // ignore: cast_nullable_to_non_nullable
                      as List<MediaGalleryItem>,
            morningtea: freezed == morningtea
                ? _value.morningtea
                : morningtea // ignore: cast_nullable_to_non_nullable
                      as bool?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            paxCount: freezed == paxCount
                ? _value.paxCount
                : paxCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            special: freezed == special
                ? _value.special
                : special // ignore: cast_nullable_to_non_nullable
                      as bool?,
            supper: freezed == supper
                ? _value.supper
                : supper // ignore: cast_nullable_to_non_nullable
                      as bool?,
            teaser: freezed == teaser
                ? _value.teaser
                : teaser // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            venueOpening: null == venueOpening
                ? _value.venueOpening
                : venueOpening // ignore: cast_nullable_to_non_nullable
                      as List<List<VenueOpeningSlot>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
    _$RestaurantImpl value,
    $Res Function(_$RestaurantImpl) then,
  ) = __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
    List<MediaGalleryItem> mediaGallery,
    bool? morningtea,
    String? name,
    int? paxCount,
    bool? special,
    bool? supper,
    String? teaser,
    String? type,
    List<List<VenueOpeningSlot>> venueOpening,
  });
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
    _$RestaurantImpl _value,
    $Res Function(_$RestaurantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? afternoontea = freezed,
    Object? agerestriction = freezed,
    Object? bookable = freezed,
    Object? breakfast = freezed,
    Object? breakfastMenuUrl = freezed,
    Object? category = freezed,
    Object? chargeable = freezed,
    Object? code = freezed,
    Object? contact = freezed,
    Object? deck = freezed,
    Object? description = freezed,
    Object? dinner = freezed,
    Object? dinnerMenuUrl = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? lunch = freezed,
    Object? lunchMenuUrl = freezed,
    Object? mealdetail = freezed,
    Object? mediaGallery = null,
    Object? morningtea = freezed,
    Object? name = freezed,
    Object? paxCount = freezed,
    Object? special = freezed,
    Object? supper = freezed,
    Object? teaser = freezed,
    Object? type = freezed,
    Object? venueOpening = null,
  }) {
    return _then(
      _$RestaurantImpl(
        afternoontea: freezed == afternoontea
            ? _value.afternoontea
            : afternoontea // ignore: cast_nullable_to_non_nullable
                  as bool?,
        agerestriction: freezed == agerestriction
            ? _value.agerestriction
            : agerestriction // ignore: cast_nullable_to_non_nullable
                  as String?,
        bookable: freezed == bookable
            ? _value.bookable
            : bookable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        breakfast: freezed == breakfast
            ? _value.breakfast
            : breakfast // ignore: cast_nullable_to_non_nullable
                  as bool?,
        breakfastMenuUrl: freezed == breakfastMenuUrl
            ? _value.breakfastMenuUrl
            : breakfastMenuUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        chargeable: freezed == chargeable
            ? _value.chargeable
            : chargeable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        code: freezed == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        contact: freezed == contact
            ? _value.contact
            : contact // ignore: cast_nullable_to_non_nullable
                  as String?,
        deck: freezed == deck
            ? _value.deck
            : deck // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        dinner: freezed == dinner
            ? _value.dinner
            : dinner // ignore: cast_nullable_to_non_nullable
                  as bool?,
        dinnerMenuUrl: freezed == dinnerMenuUrl
            ? _value.dinnerMenuUrl
            : dinnerMenuUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        lunch: freezed == lunch
            ? _value.lunch
            : lunch // ignore: cast_nullable_to_non_nullable
                  as bool?,
        lunchMenuUrl: freezed == lunchMenuUrl
            ? _value.lunchMenuUrl
            : lunchMenuUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        mealdetail: freezed == mealdetail
            ? _value.mealdetail
            : mealdetail // ignore: cast_nullable_to_non_nullable
                  as String?,
        mediaGallery: null == mediaGallery
            ? _value._mediaGallery
            : mediaGallery // ignore: cast_nullable_to_non_nullable
                  as List<MediaGalleryItem>,
        morningtea: freezed == morningtea
            ? _value.morningtea
            : morningtea // ignore: cast_nullable_to_non_nullable
                  as bool?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        paxCount: freezed == paxCount
            ? _value.paxCount
            : paxCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        special: freezed == special
            ? _value.special
            : special // ignore: cast_nullable_to_non_nullable
                  as bool?,
        supper: freezed == supper
            ? _value.supper
            : supper // ignore: cast_nullable_to_non_nullable
                  as bool?,
        teaser: freezed == teaser
            ? _value.teaser
            : teaser // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        venueOpening: null == venueOpening
            ? _value._venueOpening
            : venueOpening // ignore: cast_nullable_to_non_nullable
                  as List<List<VenueOpeningSlot>>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  const _$RestaurantImpl({
    this.afternoontea,
    this.agerestriction,
    this.bookable,
    this.breakfast,
    this.breakfastMenuUrl,
    this.category,
    this.chargeable,
    this.code,
    this.contact,
    this.deck,
    this.description,
    this.dinner,
    this.dinnerMenuUrl,
    this.id,
    this.image,
    this.lunch,
    this.lunchMenuUrl,
    this.mealdetail,
    final List<MediaGalleryItem> mediaGallery = const [],
    this.morningtea,
    this.name,
    this.paxCount,
    this.special,
    this.supper,
    this.teaser,
    this.type,
    final List<List<VenueOpeningSlot>> venueOpening = const [],
  }) : _mediaGallery = mediaGallery,
       _venueOpening = venueOpening;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final bool? afternoontea;
  @override
  final String? agerestriction;
  @override
  final bool? bookable;
  @override
  final bool? breakfast;
  @override
  final String? breakfastMenuUrl;
  @override
  final String? category;
  @override
  final bool? chargeable;
  @override
  final String? code;
  @override
  final String? contact;
  @override
  final String? deck;
  @override
  final String? description;
  @override
  final bool? dinner;
  @override
  final String? dinnerMenuUrl;
  @override
  final String? id;
  @override
  final String? image;
  @override
  final bool? lunch;
  @override
  final String? lunchMenuUrl;
  @override
  final String? mealdetail;
  final List<MediaGalleryItem> _mediaGallery;
  @override
  @JsonKey()
  List<MediaGalleryItem> get mediaGallery {
    if (_mediaGallery is EqualUnmodifiableListView) return _mediaGallery;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaGallery);
  }

  @override
  final bool? morningtea;
  @override
  final String? name;
  @override
  final int? paxCount;
  @override
  final bool? special;
  @override
  final bool? supper;
  @override
  final String? teaser;
  @override
  final String? type;
  final List<List<VenueOpeningSlot>> _venueOpening;
  @override
  @JsonKey()
  List<List<VenueOpeningSlot>> get venueOpening {
    if (_venueOpening is EqualUnmodifiableListView) return _venueOpening;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_venueOpening);
  }

  @override
  String toString() {
    return 'Restaurant(afternoontea: $afternoontea, agerestriction: $agerestriction, bookable: $bookable, breakfast: $breakfast, breakfastMenuUrl: $breakfastMenuUrl, category: $category, chargeable: $chargeable, code: $code, contact: $contact, deck: $deck, description: $description, dinner: $dinner, dinnerMenuUrl: $dinnerMenuUrl, id: $id, image: $image, lunch: $lunch, lunchMenuUrl: $lunchMenuUrl, mealdetail: $mealdetail, mediaGallery: $mediaGallery, morningtea: $morningtea, name: $name, paxCount: $paxCount, special: $special, supper: $supper, teaser: $teaser, type: $type, venueOpening: $venueOpening)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.afternoontea, afternoontea) ||
                other.afternoontea == afternoontea) &&
            (identical(other.agerestriction, agerestriction) ||
                other.agerestriction == agerestriction) &&
            (identical(other.bookable, bookable) ||
                other.bookable == bookable) &&
            (identical(other.breakfast, breakfast) ||
                other.breakfast == breakfast) &&
            (identical(other.breakfastMenuUrl, breakfastMenuUrl) ||
                other.breakfastMenuUrl == breakfastMenuUrl) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.chargeable, chargeable) ||
                other.chargeable == chargeable) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.deck, deck) || other.deck == deck) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dinner, dinner) || other.dinner == dinner) &&
            (identical(other.dinnerMenuUrl, dinnerMenuUrl) ||
                other.dinnerMenuUrl == dinnerMenuUrl) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lunch, lunch) || other.lunch == lunch) &&
            (identical(other.lunchMenuUrl, lunchMenuUrl) ||
                other.lunchMenuUrl == lunchMenuUrl) &&
            (identical(other.mealdetail, mealdetail) ||
                other.mealdetail == mealdetail) &&
            const DeepCollectionEquality().equals(
              other._mediaGallery,
              _mediaGallery,
            ) &&
            (identical(other.morningtea, morningtea) ||
                other.morningtea == morningtea) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paxCount, paxCount) ||
                other.paxCount == paxCount) &&
            (identical(other.special, special) || other.special == special) &&
            (identical(other.supper, supper) || other.supper == supper) &&
            (identical(other.teaser, teaser) || other.teaser == teaser) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._venueOpening,
              _venueOpening,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    afternoontea,
    agerestriction,
    bookable,
    breakfast,
    breakfastMenuUrl,
    category,
    chargeable,
    code,
    contact,
    deck,
    description,
    dinner,
    dinnerMenuUrl,
    id,
    image,
    lunch,
    lunchMenuUrl,
    mealdetail,
    const DeepCollectionEquality().hash(_mediaGallery),
    morningtea,
    name,
    paxCount,
    special,
    supper,
    teaser,
    type,
    const DeepCollectionEquality().hash(_venueOpening),
  ]);

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(this);
  }
}

abstract class _Restaurant implements Restaurant {
  const factory _Restaurant({
    final bool? afternoontea,
    final String? agerestriction,
    final bool? bookable,
    final bool? breakfast,
    final String? breakfastMenuUrl,
    final String? category,
    final bool? chargeable,
    final String? code,
    final String? contact,
    final String? deck,
    final String? description,
    final bool? dinner,
    final String? dinnerMenuUrl,
    final String? id,
    final String? image,
    final bool? lunch,
    final String? lunchMenuUrl,
    final String? mealdetail,
    final List<MediaGalleryItem> mediaGallery,
    final bool? morningtea,
    final String? name,
    final int? paxCount,
    final bool? special,
    final bool? supper,
    final String? teaser,
    final String? type,
    final List<List<VenueOpeningSlot>> venueOpening,
  }) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  bool? get afternoontea;
  @override
  String? get agerestriction;
  @override
  bool? get bookable;
  @override
  bool? get breakfast;
  @override
  String? get breakfastMenuUrl;
  @override
  String? get category;
  @override
  bool? get chargeable;
  @override
  String? get code;
  @override
  String? get contact;
  @override
  String? get deck;
  @override
  String? get description;
  @override
  bool? get dinner;
  @override
  String? get dinnerMenuUrl;
  @override
  String? get id;
  @override
  String? get image;
  @override
  bool? get lunch;
  @override
  String? get lunchMenuUrl;
  @override
  String? get mealdetail;
  @override
  List<MediaGalleryItem> get mediaGallery;
  @override
  bool? get morningtea;
  @override
  String? get name;
  @override
  int? get paxCount;
  @override
  bool? get special;
  @override
  bool? get supper;
  @override
  String? get teaser;
  @override
  String? get type;
  @override
  List<List<VenueOpeningSlot>> get venueOpening;

  /// Create a copy of Restaurant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantsResponse _$RestaurantsResponseFromJson(Map<String, dynamic> json) {
  return _RestaurantsResponse.fromJson(json);
}

/// @nodoc
mixin _$RestaurantsResponse {
  List<Restaurant> get data => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this RestaurantsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantsResponseCopyWith<RestaurantsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantsResponseCopyWith<$Res> {
  factory $RestaurantsResponseCopyWith(
    RestaurantsResponse value,
    $Res Function(RestaurantsResponse) then,
  ) = _$RestaurantsResponseCopyWithImpl<$Res, RestaurantsResponse>;
  @useResult
  $Res call({List<Restaurant> data, List<String> messages, bool success});
}

/// @nodoc
class _$RestaurantsResponseCopyWithImpl<$Res, $Val extends RestaurantsResponse>
    implements $RestaurantsResponseCopyWith<$Res> {
  _$RestaurantsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? messages = null,
    Object? success = null,
  }) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<Restaurant>,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantsResponseImplCopyWith<$Res>
    implements $RestaurantsResponseCopyWith<$Res> {
  factory _$$RestaurantsResponseImplCopyWith(
    _$RestaurantsResponseImpl value,
    $Res Function(_$RestaurantsResponseImpl) then,
  ) = __$$RestaurantsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Restaurant> data, List<String> messages, bool success});
}

/// @nodoc
class __$$RestaurantsResponseImplCopyWithImpl<$Res>
    extends _$RestaurantsResponseCopyWithImpl<$Res, _$RestaurantsResponseImpl>
    implements _$$RestaurantsResponseImplCopyWith<$Res> {
  __$$RestaurantsResponseImplCopyWithImpl(
    _$RestaurantsResponseImpl _value,
    $Res Function(_$RestaurantsResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? messages = null,
    Object? success = null,
  }) {
    return _then(
      _$RestaurantsResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Restaurant>,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantsResponseImpl implements _RestaurantsResponse {
  const _$RestaurantsResponseImpl({
    final List<Restaurant> data = const [],
    final List<String> messages = const [],
    this.success = false,
  }) : _data = data,
       _messages = messages;

  factory _$RestaurantsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantsResponseImplFromJson(json);

  final List<Restaurant> _data;
  @override
  @JsonKey()
  List<Restaurant> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'RestaurantsResponse(data: $data, messages: $messages, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantsResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_data),
    const DeepCollectionEquality().hash(_messages),
    success,
  );

  /// Create a copy of RestaurantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantsResponseImplCopyWith<_$RestaurantsResponseImpl> get copyWith =>
      __$$RestaurantsResponseImplCopyWithImpl<_$RestaurantsResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantsResponseImplToJson(this);
  }
}

abstract class _RestaurantsResponse implements RestaurantsResponse {
  const factory _RestaurantsResponse({
    final List<Restaurant> data,
    final List<String> messages,
    final bool success,
  }) = _$RestaurantsResponseImpl;

  factory _RestaurantsResponse.fromJson(Map<String, dynamic> json) =
      _$RestaurantsResponseImpl.fromJson;

  @override
  List<Restaurant> get data;
  @override
  List<String> get messages;
  @override
  bool get success;

  /// Create a copy of RestaurantsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantsResponseImplCopyWith<_$RestaurantsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
