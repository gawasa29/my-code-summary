// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatRoomEntity _$$_ChatRoomEntityFromJson(Map<String, dynamic> json) =>
    _$_ChatRoomEntity(
      chatRoomId: json['chatRoomId'] as String,
      chatUserName: json['chatUserName'] as String,
      lastMessage: json['lastMessage'] as String,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
      updatedAt: json['updatedAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['updatedAt'] as Object),
    );

Map<String, dynamic> _$$_ChatRoomEntityToJson(_$_ChatRoomEntity instance) =>
    <String, dynamic>{
      'chatRoomId': instance.chatRoomId,
      'chatUserName': instance.chatUserName,
      'lastMessage': instance.lastMessage,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
      'updatedAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.updatedAt),
    };
