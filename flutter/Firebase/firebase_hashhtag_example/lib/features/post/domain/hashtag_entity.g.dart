// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtag_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HashtagEntity _$$_HashtagEntityFromJson(Map<String, dynamic> json) =>
    _$_HashtagEntity(
      hashtagName: json['hashtagName'] as String,
      hashtagOption: (json['hashtagOption'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? const UnionTimestamp.serverTimestamp()
          : alwaysUseServerTimestampUnionTimestampConverter
              .fromJson(json['createdAt'] as Object),
    );

Map<String, dynamic> _$$_HashtagEntityToJson(_$_HashtagEntity instance) =>
    <String, dynamic>{
      'hashtagName': instance.hashtagName,
      'hashtagOption': instance.hashtagOption,
      'createdAt': alwaysUseServerTimestampUnionTimestampConverter
          .toJson(instance.createdAt),
    };
