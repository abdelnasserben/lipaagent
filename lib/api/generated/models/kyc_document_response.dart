// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'kyc_document_response_document_type.dart';
import 'kyc_document_response_owner_actor_type.dart';
import 'kyc_document_response_status.dart';
import 'kyc_document_response_uploaded_by_actor_type.dart';

part 'kyc_document_response.g.dart';

@JsonSerializable()
class KycDocumentResponse {
  const KycDocumentResponse({
    this.id,
    this.ownerActorType,
    this.ownerActorId,
    this.documentType,
    this.contentHash,
    this.contentType,
    this.uploadedByActorType,
    this.uploadedByActorId,
    this.uploadedAt,
    this.status,
    this.reviewedByUserId,
    this.reviewedAt,
    this.rejectionReason,
  });

  factory KycDocumentResponse.fromJson(Map<String, Object?> json) =>
      _$KycDocumentResponseFromJson(json);

  final String? id;
  final KycDocumentResponseOwnerActorType? ownerActorType;
  final String? ownerActorId;
  final KycDocumentResponseDocumentType? documentType;
  final String? contentHash;
  final String? contentType;
  final KycDocumentResponseUploadedByActorType? uploadedByActorType;
  final String? uploadedByActorId;
  final DateTime? uploadedAt;
  final KycDocumentResponseStatus? status;
  final String? reviewedByUserId;
  final DateTime? reviewedAt;
  final String? rejectionReason;

  Map<String, Object?> toJson() => _$KycDocumentResponseToJson(this);
}
