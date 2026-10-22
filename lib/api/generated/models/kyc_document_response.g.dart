// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_document_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KycDocumentResponse _$KycDocumentResponseFromJson(Map<String, dynamic> json) =>
    KycDocumentResponse(
      id: json['id'] as String?,
      ownerActorType: json['ownerActorType'] == null
          ? null
          : KycDocumentResponseOwnerActorType.fromJson(
              json['ownerActorType'] as String,
            ),
      ownerActorId: json['ownerActorId'] as String?,
      documentType: json['documentType'] == null
          ? null
          : KycDocumentResponseDocumentType.fromJson(
              json['documentType'] as String,
            ),
      contentHash: json['contentHash'] as String?,
      contentType: json['contentType'] as String?,
      uploadedByActorType: json['uploadedByActorType'] == null
          ? null
          : KycDocumentResponseUploadedByActorType.fromJson(
              json['uploadedByActorType'] as String,
            ),
      uploadedByActorId: json['uploadedByActorId'] as String?,
      uploadedAt: json['uploadedAt'] == null
          ? null
          : DateTime.parse(json['uploadedAt'] as String),
      status: json['status'] == null
          ? null
          : KycDocumentResponseStatus.fromJson(json['status'] as String),
      reviewedByUserId: json['reviewedByUserId'] as String?,
      reviewedAt: json['reviewedAt'] == null
          ? null
          : DateTime.parse(json['reviewedAt'] as String),
      rejectionReason: json['rejectionReason'] as String?,
    );

Map<String, dynamic> _$KycDocumentResponseToJson(
  KycDocumentResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'ownerActorType': instance.ownerActorType,
  'ownerActorId': instance.ownerActorId,
  'documentType': instance.documentType,
  'contentHash': instance.contentHash,
  'contentType': instance.contentType,
  'uploadedByActorType': instance.uploadedByActorType,
  'uploadedByActorId': instance.uploadedByActorId,
  'uploadedAt': instance.uploadedAt?.toIso8601String(),
  'status': instance.status,
  'reviewedByUserId': instance.reviewedByUserId,
  'reviewedAt': instance.reviewedAt?.toIso8601String(),
  'rejectionReason': instance.rejectionReason,
};
