// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_card_stock_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgentCardStockView _$AgentCardStockViewFromJson(Map<String, dynamic> json) =>
    AgentCardStockView(
      id: json['id'] as String?,
      nfcUid: json['nfcUid'] as String?,
      internalCardNumber: json['internalCardNumber'] as String?,
      batchRef: json['batchRef'] as String?,
      producedAt: json['producedAt'] as String?,
      assignedAt: json['assignedAt'] == null
          ? null
          : DateTime.parse(json['assignedAt'] as String),
      status: json['status'] == null
          ? null
          : AgentCardStockViewStatus.fromJson(json['status'] as String),
    );

Map<String, dynamic> _$AgentCardStockViewToJson(AgentCardStockView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nfcUid': instance.nfcUid,
      'internalCardNumber': instance.internalCardNumber,
      'batchRef': instance.batchRef,
      'producedAt': instance.producedAt,
      'assignedAt': instance.assignedAt?.toIso8601String(),
      'status': instance.status,
    };
