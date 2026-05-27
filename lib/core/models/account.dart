import 'package:freezed_annotation/freezed_annotation.dart';
import 'localized_date_time.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class BalanceLocalized with _$BalanceLocalized {
  const factory BalanceLocalized({
    String? currency,
    double? floatValue,
    String? locale,
    String? value,
    String? valueLocalized,
  }) = _BalanceLocalized;
  factory BalanceLocalized.fromJson(Map<String, dynamic> json) =>
      _$BalanceLocalizedFromJson(json);
}

@freezed
class BalanceResponse with _$BalanceResponse {
  const factory BalanceResponse({
    String? balance,
    @Default([]) List<dynamic> balanceList,
    BalanceLocalized? balanceLocalized,
    String? credit,
    BalanceLocalized? creditLocalized,
    @Default([]) List<String> errorMessages,
    String? folio,
    @Default(false) bool success,
    String? totalCharges,
    BalanceLocalized? totalChargesLocalized,
    String? url,
  }) = _BalanceResponse;
  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);
}

@freezed
class Email with _$Email {
  const factory Email({
    String? ccAddresses,
    bool? bodyLinkAvailable,
    String? emailMessage,
    String? emailSubject,
    String? fromAddress,
    String? id,
    String? receivedDate,
    LocalizedDateTime? receivedDateLocalized,
    String? toAddress,
  }) = _Email;
  factory Email.fromJson(Map<String, dynamic> json) => _$EmailFromJson(json);
}

@freezed
class EmailListResponse with _$EmailListResponse {
  const factory EmailListResponse({
    @Default([]) List<Email> data,
    @Default([]) List<String> messages,
    @Default(false) bool success,
  }) = _EmailListResponse;
  factory EmailListResponse.fromJson(Map<String, dynamic> json) =>
      _$EmailListResponseFromJson(json);
}

@freezed
class ChatConfig with _$ChatConfig {
  const factory ChatConfig({
    bool? isChatEnabled,
    bool? isChatBooked,
    bool? isSessionActivated,
  }) = _ChatConfig;
  factory ChatConfig.fromJson(Map<String, dynamic> json) =>
      _$ChatConfigFromJson(json);
}

@freezed
class ChatConfigResponse with _$ChatConfigResponse {
  const factory ChatConfigResponse({
    @Default(false) bool success,
    String? folioId,
    ChatConfig? chat,
  }) = _ChatConfigResponse;
  factory ChatConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatConfigResponseFromJson(json);
}
