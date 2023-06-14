// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/json_converters/union_timestamp.dart';

part 'hashtag_entity.freezed.dart';
part 'hashtag_entity.g.dart';

@freezed
class HashtagEntity with _$HashtagEntity {
  const factory HashtagEntity({
    required String hashtagName,
    required List<String> hashtagOption,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,
  }) = _HashtagEntity;

  factory HashtagEntity.fromJson(Map<String, dynamic> json) =>
      _$HashtagEntityFromJson(json);
}
