// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoList {
  List<Todo> get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoListCopyWith<TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoListCopyWith<$Res> {
  factory $TodoListCopyWith(TodoList value, $Res Function(TodoList) then) =
      _$TodoListCopyWithImpl<$Res, TodoList>;
  @useResult
  $Res call({List<Todo> todo});
}

/// @nodoc
class _$TodoListCopyWithImpl<$Res, $Val extends TodoList>
    implements $TodoListCopyWith<$Res> {
  _$TodoListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_value.copyWith(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoListCopyWith<$Res> implements $TodoListCopyWith<$Res> {
  factory _$$_TodoListCopyWith(
          _$_TodoList value, $Res Function(_$_TodoList) then) =
      __$$_TodoListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Todo> todo});
}

/// @nodoc
class __$$_TodoListCopyWithImpl<$Res>
    extends _$TodoListCopyWithImpl<$Res, _$_TodoList>
    implements _$$_TodoListCopyWith<$Res> {
  __$$_TodoListCopyWithImpl(
      _$_TodoList _value, $Res Function(_$_TodoList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$_TodoList(
      todo: null == todo
          ? _value._todo
          : todo // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_TodoList implements _TodoList {
  const _$_TodoList({required final List<Todo> todo}) : _todo = todo;

  final List<Todo> _todo;
  @override
  List<Todo> get todo {
    if (_todo is EqualUnmodifiableListView) return _todo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todo);
  }

  @override
  String toString() {
    return 'TodoList(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoList &&
            const DeepCollectionEquality().equals(other._todo, _todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoListCopyWith<_$_TodoList> get copyWith =>
      __$$_TodoListCopyWithImpl<_$_TodoList>(this, _$identity);
}

abstract class _TodoList implements TodoList {
  const factory _TodoList({required final List<Todo> todo}) = _$_TodoList;

  @override
  List<Todo> get todo;
  @override
  @JsonKey(ignore: true)
  _$$_TodoListCopyWith<_$_TodoList> get copyWith =>
      throw _privateConstructorUsedError;
}
