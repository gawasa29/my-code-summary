// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) {
  return _PostEntity.fromJson(json);
}

/// @nodoc
mixin _$PostEntity {
  String get postId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get postUserId => throw _privateConstructorUsedError;
  String get hashtag => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostEntityCopyWith<PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) then) =
      _$PostEntityCopyWithImpl<$Res, PostEntity>;
  @useResult
  $Res call(
      {String postId,
      String content,
      String postUserId,
      String hashtag,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res, $Val extends PostEntity>
    implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? content = null,
    Object? postUserId = null,
    Object? hashtag = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postUserId: null == postUserId
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get createdAt {
    return $UnionTimestampCopyWith<$Res>(_value.createdAt, (value) {
      return _then(_value.copyWith(createdAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostEntityCopyWith<$Res>
    implements $PostEntityCopyWith<$Res> {
  factory _$$_PostEntityCopyWith(
          _$_PostEntity value, $Res Function(_$_PostEntity) then) =
      __$$_PostEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String postId,
      String content,
      String postUserId,
      String hashtag,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_PostEntityCopyWithImpl<$Res>
    extends _$PostEntityCopyWithImpl<$Res, _$_PostEntity>
    implements _$$_PostEntityCopyWith<$Res> {
  __$$_PostEntityCopyWithImpl(
      _$_PostEntity _value, $Res Function(_$_PostEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? content = null,
    Object? postUserId = null,
    Object? hashtag = null,
    Object? createdAt = null,
  }) {
    return _then(_$_PostEntity(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      postUserId: null == postUserId
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      hashtag: null == hashtag
          ? _value.hashtag
          : hashtag // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostEntity with DiagnosticableTreeMixin implements _PostEntity {
  const _$_PostEntity(
      {required this.postId,
      required this.content,
      required this.postUserId,
      required this.hashtag,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()});

  factory _$_PostEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PostEntityFromJson(json);

  @override
  final String postId;
  @override
  final String content;
  @override
  final String postUserId;
  @override
  final String hashtag;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostEntity(postId: $postId, content: $content, postUserId: $postUserId, hashtag: $hashtag, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostEntity'))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('postUserId', postUserId))
      ..add(DiagnosticsProperty('hashtag', hashtag))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostEntity &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.postUserId, postUserId) ||
                other.postUserId == postUserId) &&
            (identical(other.hashtag, hashtag) || other.hashtag == hashtag) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, postId, content, postUserId, hashtag, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostEntityCopyWith<_$_PostEntity> get copyWith =>
      __$$_PostEntityCopyWithImpl<_$_PostEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostEntityToJson(
      this,
    );
  }
}

abstract class _PostEntity implements PostEntity {
  const factory _PostEntity(
      {required final String postId,
      required final String content,
      required final String postUserId,
      required final String hashtag,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_PostEntity;

  factory _PostEntity.fromJson(Map<String, dynamic> json) =
      _$_PostEntity.fromJson;

  @override
  String get postId;
  @override
  String get content;
  @override
  String get postUserId;
  @override
  String get hashtag;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_PostEntityCopyWith<_$_PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
