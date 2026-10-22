// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totp_setup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotpSetupResponse _$TotpSetupResponseFromJson(Map<String, dynamic> json) =>
    TotpSetupResponse(
      secret: json['secret'] as String?,
      qrUri: json['qrUri'] as String?,
    );

Map<String, dynamic> _$TotpSetupResponseToJson(TotpSetupResponse instance) =>
    <String, dynamic>{'secret': instance.secret, 'qrUri': instance.qrUri};
