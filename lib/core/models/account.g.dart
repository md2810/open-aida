// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceLocalizedImpl _$$BalanceLocalizedImplFromJson(
  Map<String, dynamic> json,
) => _$BalanceLocalizedImpl(
  currency: json['currency'] as String?,
  floatValue: (json['floatValue'] as num?)?.toDouble(),
  locale: json['locale'] as String?,
  value: json['value'] as String?,
  valueLocalized: json['valueLocalized'] as String?,
);

Map<String, dynamic> _$$BalanceLocalizedImplToJson(
  _$BalanceLocalizedImpl instance,
) => <String, dynamic>{
  'currency': instance.currency,
  'floatValue': instance.floatValue,
  'locale': instance.locale,
  'value': instance.value,
  'valueLocalized': instance.valueLocalized,
};

_$BalanceResponseImpl _$$BalanceResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BalanceResponseImpl(
  balance: json['balance'] as String?,
  balanceList: json['balanceList'] as List<dynamic>? ?? const [],
  balanceLocalized: json['balanceLocalized'] == null
      ? null
      : BalanceLocalized.fromJson(
          json['balanceLocalized'] as Map<String, dynamic>,
        ),
  credit: json['credit'] as String?,
  creditLocalized: json['creditLocalized'] == null
      ? null
      : BalanceLocalized.fromJson(
          json['creditLocalized'] as Map<String, dynamic>,
        ),
  errorMessages:
      (json['errorMessages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  folio: json['folio'] as String?,
  success: json['success'] as bool? ?? false,
  totalCharges: json['totalCharges'] as String?,
  totalChargesLocalized: json['totalChargesLocalized'] == null
      ? null
      : BalanceLocalized.fromJson(
          json['totalChargesLocalized'] as Map<String, dynamic>,
        ),
  url: json['url'] as String?,
);

Map<String, dynamic> _$$BalanceResponseImplToJson(
  _$BalanceResponseImpl instance,
) => <String, dynamic>{
  'balance': instance.balance,
  'balanceList': instance.balanceList,
  'balanceLocalized': instance.balanceLocalized,
  'credit': instance.credit,
  'creditLocalized': instance.creditLocalized,
  'errorMessages': instance.errorMessages,
  'folio': instance.folio,
  'success': instance.success,
  'totalCharges': instance.totalCharges,
  'totalChargesLocalized': instance.totalChargesLocalized,
  'url': instance.url,
};

_$EmailImpl _$$EmailImplFromJson(Map<String, dynamic> json) => _$EmailImpl(
  ccAddresses: json['ccAddresses'] as String?,
  bodyLinkAvailable: json['bodyLinkAvailable'] as bool?,
  emailMessage: json['emailMessage'] as String?,
  emailSubject: json['emailSubject'] as String?,
  fromAddress: json['fromAddress'] as String?,
  id: json['id'] as String?,
  receivedDate: json['receivedDate'] as String?,
  receivedDateLocalized: json['receivedDateLocalized'] == null
      ? null
      : LocalizedDateTime.fromJson(
          json['receivedDateLocalized'] as Map<String, dynamic>,
        ),
  toAddress: json['toAddress'] as String?,
);

Map<String, dynamic> _$$EmailImplToJson(_$EmailImpl instance) =>
    <String, dynamic>{
      'ccAddresses': instance.ccAddresses,
      'bodyLinkAvailable': instance.bodyLinkAvailable,
      'emailMessage': instance.emailMessage,
      'emailSubject': instance.emailSubject,
      'fromAddress': instance.fromAddress,
      'id': instance.id,
      'receivedDate': instance.receivedDate,
      'receivedDateLocalized': instance.receivedDateLocalized,
      'toAddress': instance.toAddress,
    };

_$EmailListResponseImpl _$$EmailListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$EmailListResponseImpl(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  messages:
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  success: json['success'] as bool? ?? false,
);

Map<String, dynamic> _$$EmailListResponseImplToJson(
  _$EmailListResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'messages': instance.messages,
  'success': instance.success,
};

_$ChatConfigImpl _$$ChatConfigImplFromJson(Map<String, dynamic> json) =>
    _$ChatConfigImpl(
      isChatEnabled: json['isChatEnabled'] as bool?,
      isChatBooked: json['isChatBooked'] as bool?,
      isSessionActivated: json['isSessionActivated'] as bool?,
    );

Map<String, dynamic> _$$ChatConfigImplToJson(_$ChatConfigImpl instance) =>
    <String, dynamic>{
      'isChatEnabled': instance.isChatEnabled,
      'isChatBooked': instance.isChatBooked,
      'isSessionActivated': instance.isSessionActivated,
    };

_$ChatConfigResponseImpl _$$ChatConfigResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ChatConfigResponseImpl(
  success: json['success'] as bool? ?? false,
  folioId: json['folioId'] as String?,
  chat: json['chat'] == null
      ? null
      : ChatConfig.fromJson(json['chat'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ChatConfigResponseImplToJson(
  _$ChatConfigResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'folioId': instance.folioId,
  'chat': instance.chat,
};
