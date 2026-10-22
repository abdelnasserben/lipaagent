// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  const Pagination({this.nextCursor, this.hasMore, this.limit});

  factory Pagination.fromJson(Map<String, Object?> json) =>
      _$PaginationFromJson(json);

  final String? nextCursor;
  final bool? hasMore;
  final int? limit;

  Map<String, Object?> toJson() => _$PaginationToJson(this);
}
