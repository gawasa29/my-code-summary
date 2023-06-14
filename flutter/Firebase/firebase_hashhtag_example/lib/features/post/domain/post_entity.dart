// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:firebase_hashhtag_example/common/json_converters/union_timestamp.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';
part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String postId,
    required String content,
    required String postUserId,
    required String hashtag,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
