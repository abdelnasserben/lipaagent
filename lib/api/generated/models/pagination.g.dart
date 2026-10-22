// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
  nextCursor: json['nextCursor'] as String?,
  hasMore: json['hasMore'] as bool?,
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'nextCursor': instance.nextCursor,
      'hasMore': instance.hasMore,
      'limit': instance.limit,
    };
