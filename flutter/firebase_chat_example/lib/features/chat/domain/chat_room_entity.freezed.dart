// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatRoomEntity _$ChatRoomEntityFromJson(Map<String, dynamic> json) {
  return _ChatRoomEntity.fromJson(json);
}

/// @nodoc
mixin _$ChatRoomEntity {
  String get chatRoomId => throw _privateConstructorUsedError;
  String get chatUserName => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatRoomEntityCopyWith<ChatRoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomEntityCopyWith<$Res> {
  factory $ChatRoomEntityCopyWith(
          ChatRoomEntity value, $Res Function(ChatRoomEntity) then) =
      _$ChatRoomEntityCopyWithImpl<$Res, ChatRoomEntity>;
  @useResult
  $Res call(
      {String chatRoomId,
      String chatUserName,
      String lastMessage,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp updatedAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class _$ChatRoomEntityCopyWithImpl<$Res, $Val extends ChatRoomEntity>
    implements $ChatRoomEntityCopyWith<$Res> {
  _$ChatRoomEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? chatUserName = null,
    Object? lastMessage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      chatUserName: null == chatUserName
          ? _value.chatUserName
          : chatUserName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $UnionTimestampCopyWith<$Res> get updatedAt {
    return $UnionTimestampCopyWith<$Res>(_value.updatedAt, (value) {
      return _then(_value.copyWith(updatedAt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatRoomEntityCopyWith<$Res>
    implements $ChatRoomEntityCopyWith<$Res> {
  factory _$$_ChatRoomEntityCopyWith(
          _$_ChatRoomEntity value, $Res Function(_$_ChatRoomEntity) then) =
      __$$_ChatRoomEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatRoomId,
      String chatUserName,
      String lastMessage,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp updatedAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
  @override
  $UnionTimestampCopyWith<$Res> get updatedAt;
}

/// @nodoc
class __$$_ChatRoomEntityCopyWithImpl<$Res>
    extends _$ChatRoomEntityCopyWithImpl<$Res, _$_ChatRoomEntity>
    implements _$$_ChatRoomEntityCopyWith<$Res> {
  __$$_ChatRoomEntityCopyWithImpl(
      _$_ChatRoomEntity _value, $Res Function(_$_ChatRoomEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? chatUserName = null,
    Object? lastMessage = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_ChatRoomEntity(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      chatUserName: null == chatUserName
          ? _value.chatUserName
          : chatUserName // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatRoomEntity
    with DiagnosticableTreeMixin
    implements _ChatRoomEntity {
  const _$_ChatRoomEntity(
      {required this.chatRoomId,
      required this.chatUserName,
      required this.lastMessage,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp(),
      @alwaysUseServerTimestampUnionTimestampConverter
          this.updatedAt = const UnionTimestamp.serverTimestamp()});

  factory _$_ChatRoomEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ChatRoomEntityFromJson(json);

  @override
  final String chatRoomId;
  @override
  final String chatUserName;
  @override
  final String lastMessage;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;
  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatRoomEntity(chatRoomId: $chatRoomId, chatUserName: $chatUserName, lastMessage: $lastMessage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatRoomEntity'))
      ..add(DiagnosticsProperty('chatRoomId', chatRoomId))
      ..add(DiagnosticsProperty('chatUserName', chatUserName))
      ..add(DiagnosticsProperty('lastMessage', lastMessage))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomEntity &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.chatUserName, chatUserName) ||
                other.chatUserName == chatUserName) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, chatRoomId, chatUserName, lastMessage, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomEntityCopyWith<_$_ChatRoomEntity> get copyWith =>
      __$$_ChatRoomEntityCopyWithImpl<_$_ChatRoomEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatRoomEntityToJson(
      this,
    );
  }
}

abstract class _ChatRoomEntity implements ChatRoomEntity {
  const factory _ChatRoomEntity(
      {required final String chatRoomId,
      required final String chatUserName,
      required final String lastMessage,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp updatedAt}) = _$_ChatRoomEntity;

  factory _ChatRoomEntity.fromJson(Map<String, dynamic> json) =
      _$_ChatRoomEntity.fromJson;

  @override
  String get chatRoomId;
  @override
  String get chatUserName;
  @override
  String get lastMessage;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomEntityCopyWith<_$_ChatRoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
