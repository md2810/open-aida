// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'excursion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MediaGalleryItem _$MediaGalleryItemFromJson(Map<String, dynamic> json) {
  return _MediaGalleryItem.fromJson(json);
}

/// @nodoc
mixin _$MediaGalleryItem {
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this MediaGalleryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaGalleryItemCopyWith<MediaGalleryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaGalleryItemCopyWith<$Res> {
  factory $MediaGalleryItemCopyWith(
    MediaGalleryItem value,
    $Res Function(MediaGalleryItem) then,
  ) = _$MediaGalleryItemCopyWithImpl<$Res, MediaGalleryItem>;
  @useResult
  $Res call({String? description, String? type, String? url});
}

/// @nodoc
class _$MediaGalleryItemCopyWithImpl<$Res, $Val extends MediaGalleryItem>
    implements $MediaGalleryItemCopyWith<$Res> {
  _$MediaGalleryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _value.copyWith(
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MediaGalleryItemImplCopyWith<$Res>
    implements $MediaGalleryItemCopyWith<$Res> {
  factory _$$MediaGalleryItemImplCopyWith(
    _$MediaGalleryItemImpl value,
    $Res Function(_$MediaGalleryItemImpl) then,
  ) = __$$MediaGalleryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? description, String? type, String? url});
}

/// @nodoc
class __$$MediaGalleryItemImplCopyWithImpl<$Res>
    extends _$MediaGalleryItemCopyWithImpl<$Res, _$MediaGalleryItemImpl>
    implements _$$MediaGalleryItemImplCopyWith<$Res> {
  __$$MediaGalleryItemImplCopyWithImpl(
    _$MediaGalleryItemImpl _value,
    $Res Function(_$MediaGalleryItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MediaGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? type = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _$MediaGalleryItemImpl(
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: freezed == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaGalleryItemImpl implements _MediaGalleryItem {
  const _$MediaGalleryItemImpl({this.description, this.type, this.url});

  factory _$MediaGalleryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaGalleryItemImplFromJson(json);

  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? url;

  @override
  String toString() {
    return 'MediaGalleryItem(description: $description, type: $type, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaGalleryItemImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, description, type, url);

  /// Create a copy of MediaGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaGalleryItemImplCopyWith<_$MediaGalleryItemImpl> get copyWith =>
      __$$MediaGalleryItemImplCopyWithImpl<_$MediaGalleryItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaGalleryItemImplToJson(this);
  }
}

abstract class _MediaGalleryItem implements MediaGalleryItem {
  const factory _MediaGalleryItem({
    final String? description,
    final String? type,
    final String? url,
  }) = _$MediaGalleryItemImpl;

  factory _MediaGalleryItem.fromJson(Map<String, dynamic> json) =
      _$MediaGalleryItemImpl.fromJson;

  @override
  String? get description;
  @override
  String? get type;
  @override
  String? get url;

  /// Create a copy of MediaGalleryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaGalleryItemImplCopyWith<_$MediaGalleryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Excursion _$ExcursionFromJson(Map<String, dynamic> json) {
  return _Excursion.fromJson(json);
}

/// @nodoc
mixin _$Excursion {
  String? get adultprice => throw _privateConstructorUsedError;
  String? get adultstatus => throw _privateConstructorUsedError;
  String? get begdate => throw _privateConstructorUsedError;
  LocalizedDateTime? get begdateLocalized => throw _privateConstructorUsedError;
  String? get booked => throw _privateConstructorUsedError;
  String? get childprice => throw _privateConstructorUsedError;
  String? get childstatus => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get enddate => throw _privateConstructorUsedError;
  LocalizedDateTime? get enddateLocalized => throw _privateConstructorUsedError;
  bool? get excBooked => throw _privateConstructorUsedError;
  String? get excNotes => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get longdesc => throw _privateConstructorUsedError;
  int? get maxSeatsAvailable => throw _privateConstructorUsedError;
  String? get meetdate => throw _privateConstructorUsedError;
  LocalizedDateTime? get meetdateLocalized =>
      throw _privateConstructorUsedError;
  String? get meetplace => throw _privateConstructorUsedError;
  String? get minAge => throw _privateConstructorUsedError;
  String? get minseat => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get no => throw _privateConstructorUsedError;
  String? get port => throw _privateConstructorUsedError;
  List<MediaGalleryItem> get mediaGallery => throw _privateConstructorUsedError;

  /// Serializes this Excursion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExcursionCopyWith<Excursion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcursionCopyWith<$Res> {
  factory $ExcursionCopyWith(Excursion value, $Res Function(Excursion) then) =
      _$ExcursionCopyWithImpl<$Res, Excursion>;
  @useResult
  $Res call({
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
    List<MediaGalleryItem> mediaGallery,
  });

  $LocalizedDateTimeCopyWith<$Res>? get begdateLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get enddateLocalized;
  $LocalizedDateTimeCopyWith<$Res>? get meetdateLocalized;
}

/// @nodoc
class _$ExcursionCopyWithImpl<$Res, $Val extends Excursion>
    implements $ExcursionCopyWith<$Res> {
  _$ExcursionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adultprice = freezed,
    Object? adultstatus = freezed,
    Object? begdate = freezed,
    Object? begdateLocalized = freezed,
    Object? booked = freezed,
    Object? childprice = freezed,
    Object? childstatus = freezed,
    Object? currency = freezed,
    Object? duration = freezed,
    Object? enddate = freezed,
    Object? enddateLocalized = freezed,
    Object? excBooked = freezed,
    Object? excNotes = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? longdesc = freezed,
    Object? maxSeatsAvailable = freezed,
    Object? meetdate = freezed,
    Object? meetdateLocalized = freezed,
    Object? meetplace = freezed,
    Object? minAge = freezed,
    Object? minseat = freezed,
    Object? name = freezed,
    Object? no = freezed,
    Object? port = freezed,
    Object? mediaGallery = null,
  }) {
    return _then(
      _value.copyWith(
            adultprice: freezed == adultprice
                ? _value.adultprice
                : adultprice // ignore: cast_nullable_to_non_nullable
                      as String?,
            adultstatus: freezed == adultstatus
                ? _value.adultstatus
                : adultstatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            begdate: freezed == begdate
                ? _value.begdate
                : begdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            begdateLocalized: freezed == begdateLocalized
                ? _value.begdateLocalized
                : begdateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            booked: freezed == booked
                ? _value.booked
                : booked // ignore: cast_nullable_to_non_nullable
                      as String?,
            childprice: freezed == childprice
                ? _value.childprice
                : childprice // ignore: cast_nullable_to_non_nullable
                      as String?,
            childstatus: freezed == childstatus
                ? _value.childstatus
                : childstatus // ignore: cast_nullable_to_non_nullable
                      as String?,
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            duration: freezed == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as String?,
            enddate: freezed == enddate
                ? _value.enddate
                : enddate // ignore: cast_nullable_to_non_nullable
                      as String?,
            enddateLocalized: freezed == enddateLocalized
                ? _value.enddateLocalized
                : enddateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            excBooked: freezed == excBooked
                ? _value.excBooked
                : excBooked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            excNotes: freezed == excNotes
                ? _value.excNotes
                : excNotes // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            image: freezed == image
                ? _value.image
                : image // ignore: cast_nullable_to_non_nullable
                      as String?,
            longdesc: freezed == longdesc
                ? _value.longdesc
                : longdesc // ignore: cast_nullable_to_non_nullable
                      as String?,
            maxSeatsAvailable: freezed == maxSeatsAvailable
                ? _value.maxSeatsAvailable
                : maxSeatsAvailable // ignore: cast_nullable_to_non_nullable
                      as int?,
            meetdate: freezed == meetdate
                ? _value.meetdate
                : meetdate // ignore: cast_nullable_to_non_nullable
                      as String?,
            meetdateLocalized: freezed == meetdateLocalized
                ? _value.meetdateLocalized
                : meetdateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            meetplace: freezed == meetplace
                ? _value.meetplace
                : meetplace // ignore: cast_nullable_to_non_nullable
                      as String?,
            minAge: freezed == minAge
                ? _value.minAge
                : minAge // ignore: cast_nullable_to_non_nullable
                      as String?,
            minseat: freezed == minseat
                ? _value.minseat
                : minseat // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            no: freezed == no
                ? _value.no
                : no // ignore: cast_nullable_to_non_nullable
                      as String?,
            port: freezed == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as String?,
            mediaGallery: null == mediaGallery
                ? _value.mediaGallery
                : mediaGallery // ignore: cast_nullable_to_non_nullable
                      as List<MediaGalleryItem>,
          )
          as $Val,
    );
  }

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get begdateLocalized {
    if (_value.begdateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.begdateLocalized!, (value) {
      return _then(_value.copyWith(begdateLocalized: value) as $Val);
    });
  }

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get enddateLocalized {
    if (_value.enddateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.enddateLocalized!, (value) {
      return _then(_value.copyWith(enddateLocalized: value) as $Val);
    });
  }

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get meetdateLocalized {
    if (_value.meetdateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.meetdateLocalized!, (value) {
      return _then(_value.copyWith(meetdateLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExcursionImplCopyWith<$Res>
    implements $ExcursionCopyWith<$Res> {
  factory _$$ExcursionImplCopyWith(
    _$ExcursionImpl value,
    $Res Function(_$ExcursionImpl) then,
  ) = __$$ExcursionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
    List<MediaGalleryItem> mediaGallery,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get begdateLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get enddateLocalized;
  @override
  $LocalizedDateTimeCopyWith<$Res>? get meetdateLocalized;
}

/// @nodoc
class __$$ExcursionImplCopyWithImpl<$Res>
    extends _$ExcursionCopyWithImpl<$Res, _$ExcursionImpl>
    implements _$$ExcursionImplCopyWith<$Res> {
  __$$ExcursionImplCopyWithImpl(
    _$ExcursionImpl _value,
    $Res Function(_$ExcursionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adultprice = freezed,
    Object? adultstatus = freezed,
    Object? begdate = freezed,
    Object? begdateLocalized = freezed,
    Object? booked = freezed,
    Object? childprice = freezed,
    Object? childstatus = freezed,
    Object? currency = freezed,
    Object? duration = freezed,
    Object? enddate = freezed,
    Object? enddateLocalized = freezed,
    Object? excBooked = freezed,
    Object? excNotes = freezed,
    Object? id = freezed,
    Object? image = freezed,
    Object? longdesc = freezed,
    Object? maxSeatsAvailable = freezed,
    Object? meetdate = freezed,
    Object? meetdateLocalized = freezed,
    Object? meetplace = freezed,
    Object? minAge = freezed,
    Object? minseat = freezed,
    Object? name = freezed,
    Object? no = freezed,
    Object? port = freezed,
    Object? mediaGallery = null,
  }) {
    return _then(
      _$ExcursionImpl(
        adultprice: freezed == adultprice
            ? _value.adultprice
            : adultprice // ignore: cast_nullable_to_non_nullable
                  as String?,
        adultstatus: freezed == adultstatus
            ? _value.adultstatus
            : adultstatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        begdate: freezed == begdate
            ? _value.begdate
            : begdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        begdateLocalized: freezed == begdateLocalized
            ? _value.begdateLocalized
            : begdateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        booked: freezed == booked
            ? _value.booked
            : booked // ignore: cast_nullable_to_non_nullable
                  as String?,
        childprice: freezed == childprice
            ? _value.childprice
            : childprice // ignore: cast_nullable_to_non_nullable
                  as String?,
        childstatus: freezed == childstatus
            ? _value.childstatus
            : childstatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        duration: freezed == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as String?,
        enddate: freezed == enddate
            ? _value.enddate
            : enddate // ignore: cast_nullable_to_non_nullable
                  as String?,
        enddateLocalized: freezed == enddateLocalized
            ? _value.enddateLocalized
            : enddateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        excBooked: freezed == excBooked
            ? _value.excBooked
            : excBooked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        excNotes: freezed == excNotes
            ? _value.excNotes
            : excNotes // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as String?,
        longdesc: freezed == longdesc
            ? _value.longdesc
            : longdesc // ignore: cast_nullable_to_non_nullable
                  as String?,
        maxSeatsAvailable: freezed == maxSeatsAvailable
            ? _value.maxSeatsAvailable
            : maxSeatsAvailable // ignore: cast_nullable_to_non_nullable
                  as int?,
        meetdate: freezed == meetdate
            ? _value.meetdate
            : meetdate // ignore: cast_nullable_to_non_nullable
                  as String?,
        meetdateLocalized: freezed == meetdateLocalized
            ? _value.meetdateLocalized
            : meetdateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        meetplace: freezed == meetplace
            ? _value.meetplace
            : meetplace // ignore: cast_nullable_to_non_nullable
                  as String?,
        minAge: freezed == minAge
            ? _value.minAge
            : minAge // ignore: cast_nullable_to_non_nullable
                  as String?,
        minseat: freezed == minseat
            ? _value.minseat
            : minseat // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        no: freezed == no
            ? _value.no
            : no // ignore: cast_nullable_to_non_nullable
                  as String?,
        port: freezed == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as String?,
        mediaGallery: null == mediaGallery
            ? _value._mediaGallery
            : mediaGallery // ignore: cast_nullable_to_non_nullable
                  as List<MediaGalleryItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExcursionImpl implements _Excursion {
  const _$ExcursionImpl({
    this.adultprice,
    this.adultstatus,
    this.begdate,
    this.begdateLocalized,
    this.booked,
    this.childprice,
    this.childstatus,
    this.currency,
    this.duration,
    this.enddate,
    this.enddateLocalized,
    this.excBooked,
    this.excNotes,
    this.id,
    this.image,
    this.longdesc,
    this.maxSeatsAvailable,
    this.meetdate,
    this.meetdateLocalized,
    this.meetplace,
    this.minAge,
    this.minseat,
    this.name,
    this.no,
    this.port,
    final List<MediaGalleryItem> mediaGallery = const [],
  }) : _mediaGallery = mediaGallery;

  factory _$ExcursionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExcursionImplFromJson(json);

  @override
  final String? adultprice;
  @override
  final String? adultstatus;
  @override
  final String? begdate;
  @override
  final LocalizedDateTime? begdateLocalized;
  @override
  final String? booked;
  @override
  final String? childprice;
  @override
  final String? childstatus;
  @override
  final String? currency;
  @override
  final String? duration;
  @override
  final String? enddate;
  @override
  final LocalizedDateTime? enddateLocalized;
  @override
  final bool? excBooked;
  @override
  final String? excNotes;
  @override
  final String? id;
  @override
  final String? image;
  @override
  final String? longdesc;
  @override
  final int? maxSeatsAvailable;
  @override
  final String? meetdate;
  @override
  final LocalizedDateTime? meetdateLocalized;
  @override
  final String? meetplace;
  @override
  final String? minAge;
  @override
  final String? minseat;
  @override
  final String? name;
  @override
  final String? no;
  @override
  final String? port;
  final List<MediaGalleryItem> _mediaGallery;
  @override
  @JsonKey()
  List<MediaGalleryItem> get mediaGallery {
    if (_mediaGallery is EqualUnmodifiableListView) return _mediaGallery;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaGallery);
  }

  @override
  String toString() {
    return 'Excursion(adultprice: $adultprice, adultstatus: $adultstatus, begdate: $begdate, begdateLocalized: $begdateLocalized, booked: $booked, childprice: $childprice, childstatus: $childstatus, currency: $currency, duration: $duration, enddate: $enddate, enddateLocalized: $enddateLocalized, excBooked: $excBooked, excNotes: $excNotes, id: $id, image: $image, longdesc: $longdesc, maxSeatsAvailable: $maxSeatsAvailable, meetdate: $meetdate, meetdateLocalized: $meetdateLocalized, meetplace: $meetplace, minAge: $minAge, minseat: $minseat, name: $name, no: $no, port: $port, mediaGallery: $mediaGallery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExcursionImpl &&
            (identical(other.adultprice, adultprice) ||
                other.adultprice == adultprice) &&
            (identical(other.adultstatus, adultstatus) ||
                other.adultstatus == adultstatus) &&
            (identical(other.begdate, begdate) || other.begdate == begdate) &&
            (identical(other.begdateLocalized, begdateLocalized) ||
                other.begdateLocalized == begdateLocalized) &&
            (identical(other.booked, booked) || other.booked == booked) &&
            (identical(other.childprice, childprice) ||
                other.childprice == childprice) &&
            (identical(other.childstatus, childstatus) ||
                other.childstatus == childstatus) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.enddate, enddate) || other.enddate == enddate) &&
            (identical(other.enddateLocalized, enddateLocalized) ||
                other.enddateLocalized == enddateLocalized) &&
            (identical(other.excBooked, excBooked) ||
                other.excBooked == excBooked) &&
            (identical(other.excNotes, excNotes) ||
                other.excNotes == excNotes) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.longdesc, longdesc) ||
                other.longdesc == longdesc) &&
            (identical(other.maxSeatsAvailable, maxSeatsAvailable) ||
                other.maxSeatsAvailable == maxSeatsAvailable) &&
            (identical(other.meetdate, meetdate) ||
                other.meetdate == meetdate) &&
            (identical(other.meetdateLocalized, meetdateLocalized) ||
                other.meetdateLocalized == meetdateLocalized) &&
            (identical(other.meetplace, meetplace) ||
                other.meetplace == meetplace) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.minseat, minseat) || other.minseat == minseat) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.port, port) || other.port == port) &&
            const DeepCollectionEquality().equals(
              other._mediaGallery,
              _mediaGallery,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    adultprice,
    adultstatus,
    begdate,
    begdateLocalized,
    booked,
    childprice,
    childstatus,
    currency,
    duration,
    enddate,
    enddateLocalized,
    excBooked,
    excNotes,
    id,
    image,
    longdesc,
    maxSeatsAvailable,
    meetdate,
    meetdateLocalized,
    meetplace,
    minAge,
    minseat,
    name,
    no,
    port,
    const DeepCollectionEquality().hash(_mediaGallery),
  ]);

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExcursionImplCopyWith<_$ExcursionImpl> get copyWith =>
      __$$ExcursionImplCopyWithImpl<_$ExcursionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExcursionImplToJson(this);
  }
}

abstract class _Excursion implements Excursion {
  const factory _Excursion({
    final String? adultprice,
    final String? adultstatus,
    final String? begdate,
    final LocalizedDateTime? begdateLocalized,
    final String? booked,
    final String? childprice,
    final String? childstatus,
    final String? currency,
    final String? duration,
    final String? enddate,
    final LocalizedDateTime? enddateLocalized,
    final bool? excBooked,
    final String? excNotes,
    final String? id,
    final String? image,
    final String? longdesc,
    final int? maxSeatsAvailable,
    final String? meetdate,
    final LocalizedDateTime? meetdateLocalized,
    final String? meetplace,
    final String? minAge,
    final String? minseat,
    final String? name,
    final String? no,
    final String? port,
    final List<MediaGalleryItem> mediaGallery,
  }) = _$ExcursionImpl;

  factory _Excursion.fromJson(Map<String, dynamic> json) =
      _$ExcursionImpl.fromJson;

  @override
  String? get adultprice;
  @override
  String? get adultstatus;
  @override
  String? get begdate;
  @override
  LocalizedDateTime? get begdateLocalized;
  @override
  String? get booked;
  @override
  String? get childprice;
  @override
  String? get childstatus;
  @override
  String? get currency;
  @override
  String? get duration;
  @override
  String? get enddate;
  @override
  LocalizedDateTime? get enddateLocalized;
  @override
  bool? get excBooked;
  @override
  String? get excNotes;
  @override
  String? get id;
  @override
  String? get image;
  @override
  String? get longdesc;
  @override
  int? get maxSeatsAvailable;
  @override
  String? get meetdate;
  @override
  LocalizedDateTime? get meetdateLocalized;
  @override
  String? get meetplace;
  @override
  String? get minAge;
  @override
  String? get minseat;
  @override
  String? get name;
  @override
  String? get no;
  @override
  String? get port;
  @override
  List<MediaGalleryItem> get mediaGallery;

  /// Create a copy of Excursion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExcursionImplCopyWith<_$ExcursionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExcursionResponse _$ExcursionResponseFromJson(Map<String, dynamic> json) {
  return _ExcursionResponse.fromJson(json);
}

/// @nodoc
mixin _$ExcursionResponse {
  String? get balance => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;
  List<Excursion> get excursionList => throw _privateConstructorUsedError;

  /// Serializes this ExcursionResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExcursionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExcursionResponseCopyWith<ExcursionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExcursionResponseCopyWith<$Res> {
  factory $ExcursionResponseCopyWith(
    ExcursionResponse value,
    $Res Function(ExcursionResponse) then,
  ) = _$ExcursionResponseCopyWithImpl<$Res, ExcursionResponse>;
  @useResult
  $Res call({
    String? balance,
    List<String> errorMessages,
    List<Excursion> excursionList,
  });
}

/// @nodoc
class _$ExcursionResponseCopyWithImpl<$Res, $Val extends ExcursionResponse>
    implements $ExcursionResponseCopyWith<$Res> {
  _$ExcursionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExcursionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? errorMessages = null,
    Object? excursionList = null,
  }) {
    return _then(
      _value.copyWith(
            balance: freezed == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMessages: null == errorMessages
                ? _value.errorMessages
                : errorMessages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            excursionList: null == excursionList
                ? _value.excursionList
                : excursionList // ignore: cast_nullable_to_non_nullable
                      as List<Excursion>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ExcursionResponseImplCopyWith<$Res>
    implements $ExcursionResponseCopyWith<$Res> {
  factory _$$ExcursionResponseImplCopyWith(
    _$ExcursionResponseImpl value,
    $Res Function(_$ExcursionResponseImpl) then,
  ) = __$$ExcursionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? balance,
    List<String> errorMessages,
    List<Excursion> excursionList,
  });
}

/// @nodoc
class __$$ExcursionResponseImplCopyWithImpl<$Res>
    extends _$ExcursionResponseCopyWithImpl<$Res, _$ExcursionResponseImpl>
    implements _$$ExcursionResponseImplCopyWith<$Res> {
  __$$ExcursionResponseImplCopyWithImpl(
    _$ExcursionResponseImpl _value,
    $Res Function(_$ExcursionResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ExcursionResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? errorMessages = null,
    Object? excursionList = null,
  }) {
    return _then(
      _$ExcursionResponseImpl(
        balance: freezed == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessages: null == errorMessages
            ? _value._errorMessages
            : errorMessages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        excursionList: null == excursionList
            ? _value._excursionList
            : excursionList // ignore: cast_nullable_to_non_nullable
                  as List<Excursion>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExcursionResponseImpl implements _ExcursionResponse {
  const _$ExcursionResponseImpl({
    this.balance,
    final List<String> errorMessages = const [],
    final List<Excursion> excursionList = const [],
  }) : _errorMessages = errorMessages,
       _excursionList = excursionList;

  factory _$ExcursionResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExcursionResponseImplFromJson(json);

  @override
  final String? balance;
  final List<String> _errorMessages;
  @override
  @JsonKey()
  List<String> get errorMessages {
    if (_errorMessages is EqualUnmodifiableListView) return _errorMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorMessages);
  }

  final List<Excursion> _excursionList;
  @override
  @JsonKey()
  List<Excursion> get excursionList {
    if (_excursionList is EqualUnmodifiableListView) return _excursionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_excursionList);
  }

  @override
  String toString() {
    return 'ExcursionResponse(balance: $balance, errorMessages: $errorMessages, excursionList: $excursionList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExcursionResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(
              other._errorMessages,
              _errorMessages,
            ) &&
            const DeepCollectionEquality().equals(
              other._excursionList,
              _excursionList,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    balance,
    const DeepCollectionEquality().hash(_errorMessages),
    const DeepCollectionEquality().hash(_excursionList),
  );

  /// Create a copy of ExcursionResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExcursionResponseImplCopyWith<_$ExcursionResponseImpl> get copyWith =>
      __$$ExcursionResponseImplCopyWithImpl<_$ExcursionResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ExcursionResponseImplToJson(this);
  }
}

abstract class _ExcursionResponse implements ExcursionResponse {
  const factory _ExcursionResponse({
    final String? balance,
    final List<String> errorMessages,
    final List<Excursion> excursionList,
  }) = _$ExcursionResponseImpl;

  factory _ExcursionResponse.fromJson(Map<String, dynamic> json) =
      _$ExcursionResponseImpl.fromJson;

  @override
  String? get balance;
  @override
  List<String> get errorMessages;
  @override
  List<Excursion> get excursionList;

  /// Create a copy of ExcursionResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExcursionResponseImplCopyWith<_$ExcursionResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
