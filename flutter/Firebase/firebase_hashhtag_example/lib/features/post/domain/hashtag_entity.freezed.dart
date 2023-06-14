// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hashtag_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HashtagEntity _$HashtagEntityFromJson(Map<String, dynamic> json) {
  return _HashtagEntity.fromJson(json);
}

/// @nodoc
mixin _$HashtagEntity {
  String get hashtagName => throw _privateConstructorUsedError;
  List<String> get hashtagOption => throw _privateConstructorUsedError;
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HashtagEntityCopyWith<HashtagEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HashtagEntityCopyWith<$Res> {
  factory $HashtagEntityCopyWith(
          HashtagEntity value, $Res Function(HashtagEntity) then) =
      _$HashtagEntityCopyWithImpl<$Res, HashtagEntity>;
  @useResult
  $Res call(
      {String hashtagName,
      List<String> hashtagOption,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class _$HashtagEntityCopyWithImpl<$Res, $Val extends HashtagEntity>
    implements $HashtagEntityCopyWith<$Res> {
  _$HashtagEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashtagName = null,
    Object? hashtagOption = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      hashtagName: null == hashtagName
          ? _value.hashtagName
          : hashtagName // ignore: cast_nullable_to_non_nullable
              as String,
      hashtagOption: null == hashtagOption
          ? _value.hashtagOption
          : hashtagOption // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$_HashtagEntityCopyWith<$Res>
    implements $HashtagEntityCopyWith<$Res> {
  factory _$$_HashtagEntityCopyWith(
          _$_HashtagEntity value, $Res Function(_$_HashtagEntity) then) =
      __$$_HashtagEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String hashtagName,
      List<String> hashtagOption,
      @alwaysUseServerTimestampUnionTimestampConverter
          UnionTimestamp createdAt});

  @override
  $UnionTimestampCopyWith<$Res> get createdAt;
}

/// @nodoc
class __$$_HashtagEntityCopyWithImpl<$Res>
    extends _$HashtagEntityCopyWithImpl<$Res, _$_HashtagEntity>
    implements _$$_HashtagEntityCopyWith<$Res> {
  __$$_HashtagEntityCopyWithImpl(
      _$_HashtagEntity _value, $Res Function(_$_HashtagEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashtagName = null,
    Object? hashtagOption = null,
    Object? createdAt = null,
  }) {
    return _then(_$_HashtagEntity(
      hashtagName: null == hashtagName
          ? _value.hashtagName
          : hashtagName // ignore: cast_nullable_to_non_nullable
              as String,
      hashtagOption: null == hashtagOption
          ? _value._hashtagOption
          : hashtagOption // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as UnionTimestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HashtagEntity with DiagnosticableTreeMixin implements _HashtagEntity {
  const _$_HashtagEntity(
      {required this.hashtagName,
      required final List<String> hashtagOption,
      @alwaysUseServerTimestampUnionTimestampConverter
          this.createdAt = const UnionTimestamp.serverTimestamp()})
      : _hashtagOption = hashtagOption;

  factory _$_HashtagEntity.fromJson(Map<String, dynamic> json) =>
      _$$_HashtagEntityFromJson(json);

  @override
  final String hashtagName;
  final List<String> _hashtagOption;
  @override
  List<String> get hashtagOption {
    if (_hashtagOption is EqualUnmodifiableListView) return _hashtagOption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hashtagOption);
  }

  @override
  @JsonKey()
  @alwaysUseServerTimestampUnionTimestampConverter
  final UnionTimestamp createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HashtagEntity(hashtagName: $hashtagName, hashtagOption: $hashtagOption, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HashtagEntity'))
      ..add(DiagnosticsProperty('hashtagName', hashtagName))
      ..add(DiagnosticsProperty('hashtagOption', hashtagOption))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HashtagEntity &&
            (identical(other.hashtagName, hashtagName) ||
                other.hashtagName == hashtagName) &&
            const DeepCollectionEquality()
                .equals(other._hashtagOption, _hashtagOption) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hashtagName,
      const DeepCollectionEquality().hash(_hashtagOption), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HashtagEntityCopyWith<_$_HashtagEntity> get copyWith =>
      __$$_HashtagEntityCopyWithImpl<_$_HashtagEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HashtagEntityToJson(
      this,
    );
  }
}

abstract class _HashtagEntity implements HashtagEntity {
  const factory _HashtagEntity(
      {required final String hashtagName,
      required final List<String> hashtagOption,
      @alwaysUseServerTimestampUnionTimestampConverter
          final UnionTimestamp createdAt}) = _$_HashtagEntity;

  factory _HashtagEntity.fromJson(Map<String, dynamic> json) =
      _$_HashtagEntity.fromJson;

  @override
  String get hashtagName;
  @override
  List<String> get hashtagOption;
  @override
  @alwaysUseServerTimestampUnionTimestampConverter
  UnionTimestamp get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_HashtagEntityCopyWith<_$_HashtagEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
