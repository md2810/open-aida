// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BalanceLocalized _$BalanceLocalizedFromJson(Map<String, dynamic> json) {
  return _BalanceLocalized.fromJson(json);
}

/// @nodoc
mixin _$BalanceLocalized {
  String? get currency => throw _privateConstructorUsedError;
  double? get floatValue => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get valueLocalized => throw _privateConstructorUsedError;

  /// Serializes this BalanceLocalized to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceLocalized
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceLocalizedCopyWith<BalanceLocalized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceLocalizedCopyWith<$Res> {
  factory $BalanceLocalizedCopyWith(
    BalanceLocalized value,
    $Res Function(BalanceLocalized) then,
  ) = _$BalanceLocalizedCopyWithImpl<$Res, BalanceLocalized>;
  @useResult
  $Res call({
    String? currency,
    double? floatValue,
    String? locale,
    String? value,
    String? valueLocalized,
  });
}

/// @nodoc
class _$BalanceLocalizedCopyWithImpl<$Res, $Val extends BalanceLocalized>
    implements $BalanceLocalizedCopyWith<$Res> {
  _$BalanceLocalizedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceLocalized
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? floatValue = freezed,
    Object? locale = freezed,
    Object? value = freezed,
    Object? valueLocalized = freezed,
  }) {
    return _then(
      _value.copyWith(
            currency: freezed == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String?,
            floatValue: freezed == floatValue
                ? _value.floatValue
                : floatValue // ignore: cast_nullable_to_non_nullable
                      as double?,
            locale: freezed == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String?,
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as String?,
            valueLocalized: freezed == valueLocalized
                ? _value.valueLocalized
                : valueLocalized // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BalanceLocalizedImplCopyWith<$Res>
    implements $BalanceLocalizedCopyWith<$Res> {
  factory _$$BalanceLocalizedImplCopyWith(
    _$BalanceLocalizedImpl value,
    $Res Function(_$BalanceLocalizedImpl) then,
  ) = __$$BalanceLocalizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? currency,
    double? floatValue,
    String? locale,
    String? value,
    String? valueLocalized,
  });
}

/// @nodoc
class __$$BalanceLocalizedImplCopyWithImpl<$Res>
    extends _$BalanceLocalizedCopyWithImpl<$Res, _$BalanceLocalizedImpl>
    implements _$$BalanceLocalizedImplCopyWith<$Res> {
  __$$BalanceLocalizedImplCopyWithImpl(
    _$BalanceLocalizedImpl _value,
    $Res Function(_$BalanceLocalizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BalanceLocalized
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? floatValue = freezed,
    Object? locale = freezed,
    Object? value = freezed,
    Object? valueLocalized = freezed,
  }) {
    return _then(
      _$BalanceLocalizedImpl(
        currency: freezed == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String?,
        floatValue: freezed == floatValue
            ? _value.floatValue
            : floatValue // ignore: cast_nullable_to_non_nullable
                  as double?,
        locale: freezed == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as String?,
        valueLocalized: freezed == valueLocalized
            ? _value.valueLocalized
            : valueLocalized // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceLocalizedImpl implements _BalanceLocalized {
  const _$BalanceLocalizedImpl({
    this.currency,
    this.floatValue,
    this.locale,
    this.value,
    this.valueLocalized,
  });

  factory _$BalanceLocalizedImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceLocalizedImplFromJson(json);

  @override
  final String? currency;
  @override
  final double? floatValue;
  @override
  final String? locale;
  @override
  final String? value;
  @override
  final String? valueLocalized;

  @override
  String toString() {
    return 'BalanceLocalized(currency: $currency, floatValue: $floatValue, locale: $locale, value: $value, valueLocalized: $valueLocalized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceLocalizedImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.floatValue, floatValue) ||
                other.floatValue == floatValue) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueLocalized, valueLocalized) ||
                other.valueLocalized == valueLocalized));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currency,
    floatValue,
    locale,
    value,
    valueLocalized,
  );

  /// Create a copy of BalanceLocalized
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceLocalizedImplCopyWith<_$BalanceLocalizedImpl> get copyWith =>
      __$$BalanceLocalizedImplCopyWithImpl<_$BalanceLocalizedImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceLocalizedImplToJson(this);
  }
}

abstract class _BalanceLocalized implements BalanceLocalized {
  const factory _BalanceLocalized({
    final String? currency,
    final double? floatValue,
    final String? locale,
    final String? value,
    final String? valueLocalized,
  }) = _$BalanceLocalizedImpl;

  factory _BalanceLocalized.fromJson(Map<String, dynamic> json) =
      _$BalanceLocalizedImpl.fromJson;

  @override
  String? get currency;
  @override
  double? get floatValue;
  @override
  String? get locale;
  @override
  String? get value;
  @override
  String? get valueLocalized;

  /// Create a copy of BalanceLocalized
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceLocalizedImplCopyWith<_$BalanceLocalizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) {
  return _BalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$BalanceResponse {
  String? get balance => throw _privateConstructorUsedError;
  List<dynamic> get balanceList => throw _privateConstructorUsedError;
  BalanceLocalized? get balanceLocalized => throw _privateConstructorUsedError;
  String? get credit => throw _privateConstructorUsedError;
  BalanceLocalized? get creditLocalized => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;
  String? get folio => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  String? get totalCharges => throw _privateConstructorUsedError;
  BalanceLocalized? get totalChargesLocalized =>
      throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Serializes this BalanceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceResponseCopyWith<BalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceResponseCopyWith<$Res> {
  factory $BalanceResponseCopyWith(
    BalanceResponse value,
    $Res Function(BalanceResponse) then,
  ) = _$BalanceResponseCopyWithImpl<$Res, BalanceResponse>;
  @useResult
  $Res call({
    String? balance,
    List<dynamic> balanceList,
    BalanceLocalized? balanceLocalized,
    String? credit,
    BalanceLocalized? creditLocalized,
    List<String> errorMessages,
    String? folio,
    bool success,
    String? totalCharges,
    BalanceLocalized? totalChargesLocalized,
    String? url,
  });

  $BalanceLocalizedCopyWith<$Res>? get balanceLocalized;
  $BalanceLocalizedCopyWith<$Res>? get creditLocalized;
  $BalanceLocalizedCopyWith<$Res>? get totalChargesLocalized;
}

/// @nodoc
class _$BalanceResponseCopyWithImpl<$Res, $Val extends BalanceResponse>
    implements $BalanceResponseCopyWith<$Res> {
  _$BalanceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? balanceList = null,
    Object? balanceLocalized = freezed,
    Object? credit = freezed,
    Object? creditLocalized = freezed,
    Object? errorMessages = null,
    Object? folio = freezed,
    Object? success = null,
    Object? totalCharges = freezed,
    Object? totalChargesLocalized = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _value.copyWith(
            balance: freezed == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as String?,
            balanceList: null == balanceList
                ? _value.balanceList
                : balanceList // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            balanceLocalized: freezed == balanceLocalized
                ? _value.balanceLocalized
                : balanceLocalized // ignore: cast_nullable_to_non_nullable
                      as BalanceLocalized?,
            credit: freezed == credit
                ? _value.credit
                : credit // ignore: cast_nullable_to_non_nullable
                      as String?,
            creditLocalized: freezed == creditLocalized
                ? _value.creditLocalized
                : creditLocalized // ignore: cast_nullable_to_non_nullable
                      as BalanceLocalized?,
            errorMessages: null == errorMessages
                ? _value.errorMessages
                : errorMessages // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            folio: freezed == folio
                ? _value.folio
                : folio // ignore: cast_nullable_to_non_nullable
                      as String?,
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            totalCharges: freezed == totalCharges
                ? _value.totalCharges
                : totalCharges // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalChargesLocalized: freezed == totalChargesLocalized
                ? _value.totalChargesLocalized
                : totalChargesLocalized // ignore: cast_nullable_to_non_nullable
                      as BalanceLocalized?,
            url: freezed == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceLocalizedCopyWith<$Res>? get balanceLocalized {
    if (_value.balanceLocalized == null) {
      return null;
    }

    return $BalanceLocalizedCopyWith<$Res>(_value.balanceLocalized!, (value) {
      return _then(_value.copyWith(balanceLocalized: value) as $Val);
    });
  }

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceLocalizedCopyWith<$Res>? get creditLocalized {
    if (_value.creditLocalized == null) {
      return null;
    }

    return $BalanceLocalizedCopyWith<$Res>(_value.creditLocalized!, (value) {
      return _then(_value.copyWith(creditLocalized: value) as $Val);
    });
  }

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceLocalizedCopyWith<$Res>? get totalChargesLocalized {
    if (_value.totalChargesLocalized == null) {
      return null;
    }

    return $BalanceLocalizedCopyWith<$Res>(_value.totalChargesLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(totalChargesLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BalanceResponseImplCopyWith<$Res>
    implements $BalanceResponseCopyWith<$Res> {
  factory _$$BalanceResponseImplCopyWith(
    _$BalanceResponseImpl value,
    $Res Function(_$BalanceResponseImpl) then,
  ) = __$$BalanceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? balance,
    List<dynamic> balanceList,
    BalanceLocalized? balanceLocalized,
    String? credit,
    BalanceLocalized? creditLocalized,
    List<String> errorMessages,
    String? folio,
    bool success,
    String? totalCharges,
    BalanceLocalized? totalChargesLocalized,
    String? url,
  });

  @override
  $BalanceLocalizedCopyWith<$Res>? get balanceLocalized;
  @override
  $BalanceLocalizedCopyWith<$Res>? get creditLocalized;
  @override
  $BalanceLocalizedCopyWith<$Res>? get totalChargesLocalized;
}

/// @nodoc
class __$$BalanceResponseImplCopyWithImpl<$Res>
    extends _$BalanceResponseCopyWithImpl<$Res, _$BalanceResponseImpl>
    implements _$$BalanceResponseImplCopyWith<$Res> {
  __$$BalanceResponseImplCopyWithImpl(
    _$BalanceResponseImpl _value,
    $Res Function(_$BalanceResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = freezed,
    Object? balanceList = null,
    Object? balanceLocalized = freezed,
    Object? credit = freezed,
    Object? creditLocalized = freezed,
    Object? errorMessages = null,
    Object? folio = freezed,
    Object? success = null,
    Object? totalCharges = freezed,
    Object? totalChargesLocalized = freezed,
    Object? url = freezed,
  }) {
    return _then(
      _$BalanceResponseImpl(
        balance: freezed == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as String?,
        balanceList: null == balanceList
            ? _value._balanceList
            : balanceList // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        balanceLocalized: freezed == balanceLocalized
            ? _value.balanceLocalized
            : balanceLocalized // ignore: cast_nullable_to_non_nullable
                  as BalanceLocalized?,
        credit: freezed == credit
            ? _value.credit
            : credit // ignore: cast_nullable_to_non_nullable
                  as String?,
        creditLocalized: freezed == creditLocalized
            ? _value.creditLocalized
            : creditLocalized // ignore: cast_nullable_to_non_nullable
                  as BalanceLocalized?,
        errorMessages: null == errorMessages
            ? _value._errorMessages
            : errorMessages // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        folio: freezed == folio
            ? _value.folio
            : folio // ignore: cast_nullable_to_non_nullable
                  as String?,
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        totalCharges: freezed == totalCharges
            ? _value.totalCharges
            : totalCharges // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalChargesLocalized: freezed == totalChargesLocalized
            ? _value.totalChargesLocalized
            : totalChargesLocalized // ignore: cast_nullable_to_non_nullable
                  as BalanceLocalized?,
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
class _$BalanceResponseImpl implements _BalanceResponse {
  const _$BalanceResponseImpl({
    this.balance,
    final List<dynamic> balanceList = const [],
    this.balanceLocalized,
    this.credit,
    this.creditLocalized,
    final List<String> errorMessages = const [],
    this.folio,
    this.success = false,
    this.totalCharges,
    this.totalChargesLocalized,
    this.url,
  }) : _balanceList = balanceList,
       _errorMessages = errorMessages;

  factory _$BalanceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceResponseImplFromJson(json);

  @override
  final String? balance;
  final List<dynamic> _balanceList;
  @override
  @JsonKey()
  List<dynamic> get balanceList {
    if (_balanceList is EqualUnmodifiableListView) return _balanceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_balanceList);
  }

  @override
  final BalanceLocalized? balanceLocalized;
  @override
  final String? credit;
  @override
  final BalanceLocalized? creditLocalized;
  final List<String> _errorMessages;
  @override
  @JsonKey()
  List<String> get errorMessages {
    if (_errorMessages is EqualUnmodifiableListView) return _errorMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorMessages);
  }

  @override
  final String? folio;
  @override
  @JsonKey()
  final bool success;
  @override
  final String? totalCharges;
  @override
  final BalanceLocalized? totalChargesLocalized;
  @override
  final String? url;

  @override
  String toString() {
    return 'BalanceResponse(balance: $balance, balanceList: $balanceList, balanceLocalized: $balanceLocalized, credit: $credit, creditLocalized: $creditLocalized, errorMessages: $errorMessages, folio: $folio, success: $success, totalCharges: $totalCharges, totalChargesLocalized: $totalChargesLocalized, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceResponseImpl &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(
              other._balanceList,
              _balanceList,
            ) &&
            (identical(other.balanceLocalized, balanceLocalized) ||
                other.balanceLocalized == balanceLocalized) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.creditLocalized, creditLocalized) ||
                other.creditLocalized == creditLocalized) &&
            const DeepCollectionEquality().equals(
              other._errorMessages,
              _errorMessages,
            ) &&
            (identical(other.folio, folio) || other.folio == folio) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalCharges, totalCharges) ||
                other.totalCharges == totalCharges) &&
            (identical(other.totalChargesLocalized, totalChargesLocalized) ||
                other.totalChargesLocalized == totalChargesLocalized) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    balance,
    const DeepCollectionEquality().hash(_balanceList),
    balanceLocalized,
    credit,
    creditLocalized,
    const DeepCollectionEquality().hash(_errorMessages),
    folio,
    success,
    totalCharges,
    totalChargesLocalized,
    url,
  );

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceResponseImplCopyWith<_$BalanceResponseImpl> get copyWith =>
      __$$BalanceResponseImplCopyWithImpl<_$BalanceResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceResponseImplToJson(this);
  }
}

abstract class _BalanceResponse implements BalanceResponse {
  const factory _BalanceResponse({
    final String? balance,
    final List<dynamic> balanceList,
    final BalanceLocalized? balanceLocalized,
    final String? credit,
    final BalanceLocalized? creditLocalized,
    final List<String> errorMessages,
    final String? folio,
    final bool success,
    final String? totalCharges,
    final BalanceLocalized? totalChargesLocalized,
    final String? url,
  }) = _$BalanceResponseImpl;

  factory _BalanceResponse.fromJson(Map<String, dynamic> json) =
      _$BalanceResponseImpl.fromJson;

  @override
  String? get balance;
  @override
  List<dynamic> get balanceList;
  @override
  BalanceLocalized? get balanceLocalized;
  @override
  String? get credit;
  @override
  BalanceLocalized? get creditLocalized;
  @override
  List<String> get errorMessages;
  @override
  String? get folio;
  @override
  bool get success;
  @override
  String? get totalCharges;
  @override
  BalanceLocalized? get totalChargesLocalized;
  @override
  String? get url;

  /// Create a copy of BalanceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceResponseImplCopyWith<_$BalanceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Email _$EmailFromJson(Map<String, dynamic> json) {
  return _Email.fromJson(json);
}

/// @nodoc
mixin _$Email {
  String? get ccAddresses => throw _privateConstructorUsedError;
  bool? get bodyLinkAvailable => throw _privateConstructorUsedError;
  String? get emailMessage => throw _privateConstructorUsedError;
  String? get emailSubject => throw _privateConstructorUsedError;
  String? get fromAddress => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get receivedDate => throw _privateConstructorUsedError;
  LocalizedDateTime? get receivedDateLocalized =>
      throw _privateConstructorUsedError;
  String? get toAddress => throw _privateConstructorUsedError;

  /// Serializes this Email to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailCopyWith<Email> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailCopyWith<$Res> {
  factory $EmailCopyWith(Email value, $Res Function(Email) then) =
      _$EmailCopyWithImpl<$Res, Email>;
  @useResult
  $Res call({
    String? ccAddresses,
    bool? bodyLinkAvailable,
    String? emailMessage,
    String? emailSubject,
    String? fromAddress,
    String? id,
    String? receivedDate,
    LocalizedDateTime? receivedDateLocalized,
    String? toAddress,
  });

  $LocalizedDateTimeCopyWith<$Res>? get receivedDateLocalized;
}

/// @nodoc
class _$EmailCopyWithImpl<$Res, $Val extends Email>
    implements $EmailCopyWith<$Res> {
  _$EmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ccAddresses = freezed,
    Object? bodyLinkAvailable = freezed,
    Object? emailMessage = freezed,
    Object? emailSubject = freezed,
    Object? fromAddress = freezed,
    Object? id = freezed,
    Object? receivedDate = freezed,
    Object? receivedDateLocalized = freezed,
    Object? toAddress = freezed,
  }) {
    return _then(
      _value.copyWith(
            ccAddresses: freezed == ccAddresses
                ? _value.ccAddresses
                : ccAddresses // ignore: cast_nullable_to_non_nullable
                      as String?,
            bodyLinkAvailable: freezed == bodyLinkAvailable
                ? _value.bodyLinkAvailable
                : bodyLinkAvailable // ignore: cast_nullable_to_non_nullable
                      as bool?,
            emailMessage: freezed == emailMessage
                ? _value.emailMessage
                : emailMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailSubject: freezed == emailSubject
                ? _value.emailSubject
                : emailSubject // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromAddress: freezed == fromAddress
                ? _value.fromAddress
                : fromAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            receivedDate: freezed == receivedDate
                ? _value.receivedDate
                : receivedDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            receivedDateLocalized: freezed == receivedDateLocalized
                ? _value.receivedDateLocalized
                : receivedDateLocalized // ignore: cast_nullable_to_non_nullable
                      as LocalizedDateTime?,
            toAddress: freezed == toAddress
                ? _value.toAddress
                : toAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalizedDateTimeCopyWith<$Res>? get receivedDateLocalized {
    if (_value.receivedDateLocalized == null) {
      return null;
    }

    return $LocalizedDateTimeCopyWith<$Res>(_value.receivedDateLocalized!, (
      value,
    ) {
      return _then(_value.copyWith(receivedDateLocalized: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmailImplCopyWith<$Res> implements $EmailCopyWith<$Res> {
  factory _$$EmailImplCopyWith(
    _$EmailImpl value,
    $Res Function(_$EmailImpl) then,
  ) = __$$EmailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? ccAddresses,
    bool? bodyLinkAvailable,
    String? emailMessage,
    String? emailSubject,
    String? fromAddress,
    String? id,
    String? receivedDate,
    LocalizedDateTime? receivedDateLocalized,
    String? toAddress,
  });

  @override
  $LocalizedDateTimeCopyWith<$Res>? get receivedDateLocalized;
}

/// @nodoc
class __$$EmailImplCopyWithImpl<$Res>
    extends _$EmailCopyWithImpl<$Res, _$EmailImpl>
    implements _$$EmailImplCopyWith<$Res> {
  __$$EmailImplCopyWithImpl(
    _$EmailImpl _value,
    $Res Function(_$EmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ccAddresses = freezed,
    Object? bodyLinkAvailable = freezed,
    Object? emailMessage = freezed,
    Object? emailSubject = freezed,
    Object? fromAddress = freezed,
    Object? id = freezed,
    Object? receivedDate = freezed,
    Object? receivedDateLocalized = freezed,
    Object? toAddress = freezed,
  }) {
    return _then(
      _$EmailImpl(
        ccAddresses: freezed == ccAddresses
            ? _value.ccAddresses
            : ccAddresses // ignore: cast_nullable_to_non_nullable
                  as String?,
        bodyLinkAvailable: freezed == bodyLinkAvailable
            ? _value.bodyLinkAvailable
            : bodyLinkAvailable // ignore: cast_nullable_to_non_nullable
                  as bool?,
        emailMessage: freezed == emailMessage
            ? _value.emailMessage
            : emailMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailSubject: freezed == emailSubject
            ? _value.emailSubject
            : emailSubject // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromAddress: freezed == fromAddress
            ? _value.fromAddress
            : fromAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        receivedDate: freezed == receivedDate
            ? _value.receivedDate
            : receivedDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        receivedDateLocalized: freezed == receivedDateLocalized
            ? _value.receivedDateLocalized
            : receivedDateLocalized // ignore: cast_nullable_to_non_nullable
                  as LocalizedDateTime?,
        toAddress: freezed == toAddress
            ? _value.toAddress
            : toAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmailImpl implements _Email {
  const _$EmailImpl({
    this.ccAddresses,
    this.bodyLinkAvailable,
    this.emailMessage,
    this.emailSubject,
    this.fromAddress,
    this.id,
    this.receivedDate,
    this.receivedDateLocalized,
    this.toAddress,
  });

  factory _$EmailImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailImplFromJson(json);

  @override
  final String? ccAddresses;
  @override
  final bool? bodyLinkAvailable;
  @override
  final String? emailMessage;
  @override
  final String? emailSubject;
  @override
  final String? fromAddress;
  @override
  final String? id;
  @override
  final String? receivedDate;
  @override
  final LocalizedDateTime? receivedDateLocalized;
  @override
  final String? toAddress;

  @override
  String toString() {
    return 'Email(ccAddresses: $ccAddresses, bodyLinkAvailable: $bodyLinkAvailable, emailMessage: $emailMessage, emailSubject: $emailSubject, fromAddress: $fromAddress, id: $id, receivedDate: $receivedDate, receivedDateLocalized: $receivedDateLocalized, toAddress: $toAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailImpl &&
            (identical(other.ccAddresses, ccAddresses) ||
                other.ccAddresses == ccAddresses) &&
            (identical(other.bodyLinkAvailable, bodyLinkAvailable) ||
                other.bodyLinkAvailable == bodyLinkAvailable) &&
            (identical(other.emailMessage, emailMessage) ||
                other.emailMessage == emailMessage) &&
            (identical(other.emailSubject, emailSubject) ||
                other.emailSubject == emailSubject) &&
            (identical(other.fromAddress, fromAddress) ||
                other.fromAddress == fromAddress) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receivedDate, receivedDate) ||
                other.receivedDate == receivedDate) &&
            (identical(other.receivedDateLocalized, receivedDateLocalized) ||
                other.receivedDateLocalized == receivedDateLocalized) &&
            (identical(other.toAddress, toAddress) ||
                other.toAddress == toAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    ccAddresses,
    bodyLinkAvailable,
    emailMessage,
    emailSubject,
    fromAddress,
    id,
    receivedDate,
    receivedDateLocalized,
    toAddress,
  );

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith =>
      __$$EmailImplCopyWithImpl<_$EmailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailImplToJson(this);
  }
}

abstract class _Email implements Email {
  const factory _Email({
    final String? ccAddresses,
    final bool? bodyLinkAvailable,
    final String? emailMessage,
    final String? emailSubject,
    final String? fromAddress,
    final String? id,
    final String? receivedDate,
    final LocalizedDateTime? receivedDateLocalized,
    final String? toAddress,
  }) = _$EmailImpl;

  factory _Email.fromJson(Map<String, dynamic> json) = _$EmailImpl.fromJson;

  @override
  String? get ccAddresses;
  @override
  bool? get bodyLinkAvailable;
  @override
  String? get emailMessage;
  @override
  String? get emailSubject;
  @override
  String? get fromAddress;
  @override
  String? get id;
  @override
  String? get receivedDate;
  @override
  LocalizedDateTime? get receivedDateLocalized;
  @override
  String? get toAddress;

  /// Create a copy of Email
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailImplCopyWith<_$EmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmailListResponse _$EmailListResponseFromJson(Map<String, dynamic> json) {
  return _EmailListResponse.fromJson(json);
}

/// @nodoc
mixin _$EmailListResponse {
  List<Email> get data => throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  /// Serializes this EmailListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmailListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmailListResponseCopyWith<EmailListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailListResponseCopyWith<$Res> {
  factory $EmailListResponseCopyWith(
    EmailListResponse value,
    $Res Function(EmailListResponse) then,
  ) = _$EmailListResponseCopyWithImpl<$Res, EmailListResponse>;
  @useResult
  $Res call({List<Email> data, List<String> messages, bool success});
}

/// @nodoc
class _$EmailListResponseCopyWithImpl<$Res, $Val extends EmailListResponse>
    implements $EmailListResponseCopyWith<$Res> {
  _$EmailListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmailListResponse
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
                      as List<Email>,
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
abstract class _$$EmailListResponseImplCopyWith<$Res>
    implements $EmailListResponseCopyWith<$Res> {
  factory _$$EmailListResponseImplCopyWith(
    _$EmailListResponseImpl value,
    $Res Function(_$EmailListResponseImpl) then,
  ) = __$$EmailListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Email> data, List<String> messages, bool success});
}

/// @nodoc
class __$$EmailListResponseImplCopyWithImpl<$Res>
    extends _$EmailListResponseCopyWithImpl<$Res, _$EmailListResponseImpl>
    implements _$$EmailListResponseImplCopyWith<$Res> {
  __$$EmailListResponseImplCopyWithImpl(
    _$EmailListResponseImpl _value,
    $Res Function(_$EmailListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmailListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? messages = null,
    Object? success = null,
  }) {
    return _then(
      _$EmailListResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Email>,
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
class _$EmailListResponseImpl implements _EmailListResponse {
  const _$EmailListResponseImpl({
    final List<Email> data = const [],
    final List<String> messages = const [],
    this.success = false,
  }) : _data = data,
       _messages = messages;

  factory _$EmailListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmailListResponseImplFromJson(json);

  final List<Email> _data;
  @override
  @JsonKey()
  List<Email> get data {
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
    return 'EmailListResponse(data: $data, messages: $messages, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailListResponseImpl &&
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

  /// Create a copy of EmailListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailListResponseImplCopyWith<_$EmailListResponseImpl> get copyWith =>
      __$$EmailListResponseImplCopyWithImpl<_$EmailListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmailListResponseImplToJson(this);
  }
}

abstract class _EmailListResponse implements EmailListResponse {
  const factory _EmailListResponse({
    final List<Email> data,
    final List<String> messages,
    final bool success,
  }) = _$EmailListResponseImpl;

  factory _EmailListResponse.fromJson(Map<String, dynamic> json) =
      _$EmailListResponseImpl.fromJson;

  @override
  List<Email> get data;
  @override
  List<String> get messages;
  @override
  bool get success;

  /// Create a copy of EmailListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailListResponseImplCopyWith<_$EmailListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatConfig _$ChatConfigFromJson(Map<String, dynamic> json) {
  return _ChatConfig.fromJson(json);
}

/// @nodoc
mixin _$ChatConfig {
  bool? get isChatEnabled => throw _privateConstructorUsedError;
  bool? get isChatBooked => throw _privateConstructorUsedError;
  bool? get isSessionActivated => throw _privateConstructorUsedError;

  /// Serializes this ChatConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatConfigCopyWith<ChatConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConfigCopyWith<$Res> {
  factory $ChatConfigCopyWith(
    ChatConfig value,
    $Res Function(ChatConfig) then,
  ) = _$ChatConfigCopyWithImpl<$Res, ChatConfig>;
  @useResult
  $Res call({
    bool? isChatEnabled,
    bool? isChatBooked,
    bool? isSessionActivated,
  });
}

/// @nodoc
class _$ChatConfigCopyWithImpl<$Res, $Val extends ChatConfig>
    implements $ChatConfigCopyWith<$Res> {
  _$ChatConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChatEnabled = freezed,
    Object? isChatBooked = freezed,
    Object? isSessionActivated = freezed,
  }) {
    return _then(
      _value.copyWith(
            isChatEnabled: freezed == isChatEnabled
                ? _value.isChatEnabled
                : isChatEnabled // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isChatBooked: freezed == isChatBooked
                ? _value.isChatBooked
                : isChatBooked // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isSessionActivated: freezed == isSessionActivated
                ? _value.isSessionActivated
                : isSessionActivated // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatConfigImplCopyWith<$Res>
    implements $ChatConfigCopyWith<$Res> {
  factory _$$ChatConfigImplCopyWith(
    _$ChatConfigImpl value,
    $Res Function(_$ChatConfigImpl) then,
  ) = __$$ChatConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool? isChatEnabled,
    bool? isChatBooked,
    bool? isSessionActivated,
  });
}

/// @nodoc
class __$$ChatConfigImplCopyWithImpl<$Res>
    extends _$ChatConfigCopyWithImpl<$Res, _$ChatConfigImpl>
    implements _$$ChatConfigImplCopyWith<$Res> {
  __$$ChatConfigImplCopyWithImpl(
    _$ChatConfigImpl _value,
    $Res Function(_$ChatConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isChatEnabled = freezed,
    Object? isChatBooked = freezed,
    Object? isSessionActivated = freezed,
  }) {
    return _then(
      _$ChatConfigImpl(
        isChatEnabled: freezed == isChatEnabled
            ? _value.isChatEnabled
            : isChatEnabled // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isChatBooked: freezed == isChatBooked
            ? _value.isChatBooked
            : isChatBooked // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isSessionActivated: freezed == isSessionActivated
            ? _value.isSessionActivated
            : isSessionActivated // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConfigImpl implements _ChatConfig {
  const _$ChatConfigImpl({
    this.isChatEnabled,
    this.isChatBooked,
    this.isSessionActivated,
  });

  factory _$ChatConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConfigImplFromJson(json);

  @override
  final bool? isChatEnabled;
  @override
  final bool? isChatBooked;
  @override
  final bool? isSessionActivated;

  @override
  String toString() {
    return 'ChatConfig(isChatEnabled: $isChatEnabled, isChatBooked: $isChatBooked, isSessionActivated: $isSessionActivated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConfigImpl &&
            (identical(other.isChatEnabled, isChatEnabled) ||
                other.isChatEnabled == isChatEnabled) &&
            (identical(other.isChatBooked, isChatBooked) ||
                other.isChatBooked == isChatBooked) &&
            (identical(other.isSessionActivated, isSessionActivated) ||
                other.isSessionActivated == isSessionActivated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, isChatEnabled, isChatBooked, isSessionActivated);

  /// Create a copy of ChatConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConfigImplCopyWith<_$ChatConfigImpl> get copyWith =>
      __$$ChatConfigImplCopyWithImpl<_$ChatConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConfigImplToJson(this);
  }
}

abstract class _ChatConfig implements ChatConfig {
  const factory _ChatConfig({
    final bool? isChatEnabled,
    final bool? isChatBooked,
    final bool? isSessionActivated,
  }) = _$ChatConfigImpl;

  factory _ChatConfig.fromJson(Map<String, dynamic> json) =
      _$ChatConfigImpl.fromJson;

  @override
  bool? get isChatEnabled;
  @override
  bool? get isChatBooked;
  @override
  bool? get isSessionActivated;

  /// Create a copy of ChatConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatConfigImplCopyWith<_$ChatConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatConfigResponse _$ChatConfigResponseFromJson(Map<String, dynamic> json) {
  return _ChatConfigResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatConfigResponse {
  bool get success => throw _privateConstructorUsedError;
  String? get folioId => throw _privateConstructorUsedError;
  ChatConfig? get chat => throw _privateConstructorUsedError;

  /// Serializes this ChatConfigResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatConfigResponseCopyWith<ChatConfigResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatConfigResponseCopyWith<$Res> {
  factory $ChatConfigResponseCopyWith(
    ChatConfigResponse value,
    $Res Function(ChatConfigResponse) then,
  ) = _$ChatConfigResponseCopyWithImpl<$Res, ChatConfigResponse>;
  @useResult
  $Res call({bool success, String? folioId, ChatConfig? chat});

  $ChatConfigCopyWith<$Res>? get chat;
}

/// @nodoc
class _$ChatConfigResponseCopyWithImpl<$Res, $Val extends ChatConfigResponse>
    implements $ChatConfigResponseCopyWith<$Res> {
  _$ChatConfigResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? folioId = freezed,
    Object? chat = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            folioId: freezed == folioId
                ? _value.folioId
                : folioId // ignore: cast_nullable_to_non_nullable
                      as String?,
            chat: freezed == chat
                ? _value.chat
                : chat // ignore: cast_nullable_to_non_nullable
                      as ChatConfig?,
          )
          as $Val,
    );
  }

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatConfigCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $ChatConfigCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatConfigResponseImplCopyWith<$Res>
    implements $ChatConfigResponseCopyWith<$Res> {
  factory _$$ChatConfigResponseImplCopyWith(
    _$ChatConfigResponseImpl value,
    $Res Function(_$ChatConfigResponseImpl) then,
  ) = __$$ChatConfigResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String? folioId, ChatConfig? chat});

  @override
  $ChatConfigCopyWith<$Res>? get chat;
}

/// @nodoc
class __$$ChatConfigResponseImplCopyWithImpl<$Res>
    extends _$ChatConfigResponseCopyWithImpl<$Res, _$ChatConfigResponseImpl>
    implements _$$ChatConfigResponseImplCopyWith<$Res> {
  __$$ChatConfigResponseImplCopyWithImpl(
    _$ChatConfigResponseImpl _value,
    $Res Function(_$ChatConfigResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? folioId = freezed,
    Object? chat = freezed,
  }) {
    return _then(
      _$ChatConfigResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        folioId: freezed == folioId
            ? _value.folioId
            : folioId // ignore: cast_nullable_to_non_nullable
                  as String?,
        chat: freezed == chat
            ? _value.chat
            : chat // ignore: cast_nullable_to_non_nullable
                  as ChatConfig?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatConfigResponseImpl implements _ChatConfigResponse {
  const _$ChatConfigResponseImpl({
    this.success = false,
    this.folioId,
    this.chat,
  });

  factory _$ChatConfigResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatConfigResponseImplFromJson(json);

  @override
  @JsonKey()
  final bool success;
  @override
  final String? folioId;
  @override
  final ChatConfig? chat;

  @override
  String toString() {
    return 'ChatConfigResponse(success: $success, folioId: $folioId, chat: $chat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatConfigResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.folioId, folioId) || other.folioId == folioId) &&
            (identical(other.chat, chat) || other.chat == chat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, folioId, chat);

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatConfigResponseImplCopyWith<_$ChatConfigResponseImpl> get copyWith =>
      __$$ChatConfigResponseImplCopyWithImpl<_$ChatConfigResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatConfigResponseImplToJson(this);
  }
}

abstract class _ChatConfigResponse implements ChatConfigResponse {
  const factory _ChatConfigResponse({
    final bool success,
    final String? folioId,
    final ChatConfig? chat,
  }) = _$ChatConfigResponseImpl;

  factory _ChatConfigResponse.fromJson(Map<String, dynamic> json) =
      _$ChatConfigResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String? get folioId;
  @override
  ChatConfig? get chat;

  /// Create a copy of ChatConfigResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatConfigResponseImplCopyWith<_$ChatConfigResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
