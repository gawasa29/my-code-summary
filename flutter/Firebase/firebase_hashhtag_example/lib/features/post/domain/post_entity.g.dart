// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostEntity _$$_PostEntityFromJson(Map<String, dynamic> json) =>
    _$_PostEntity(
      postId: json['postId'] as String,
      content: json['content'] as String,
      postUserId: json['postUserId'] as String,
      hashtag: json['hashtag'] as String,
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_PostEntityToJson(_$_PostEntity instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'content': instance.content,
      'postUserId': instance.postUserId,
      'hashtag': instance.hashtag,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };
