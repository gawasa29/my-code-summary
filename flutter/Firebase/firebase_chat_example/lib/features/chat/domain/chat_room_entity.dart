// 保存時の自動整形でfoundationが消えないように警告を消している
// ignore: unused_import, directives_ordering
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/json_converters/union_timestamp.dart';

part 'chat_room_entity.freezed.dart';
part 'chat_room_entity.g.dart';

@freezed
class ChatRoomEntity with _$ChatRoomEntity {
  const factory ChatRoomEntity({
    required String chatRoomId,
    required String chatUserName,
    required String lastMessage,
    @Default(0) int messageCount,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp createdAt,
    @alwaysUseServerTimestampUnionTimestampConverter
    @Default(UnionTimestamp.serverTimestamp())
    UnionTimestamp updatedAt,
  }) = _ChatRoomEntity;

  factory ChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomEntityFromJson(json);
}
