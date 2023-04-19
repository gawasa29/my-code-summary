import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_example/todo.dart';

import 'ssot.dart';

// ignore: unused_import, directives_ordering

part 'query.freezed.dart';

// CQRSのQuery
final todoListQueryProvider = StreamProvider<TodoList>((ref) {
  // todoRefProviderを監視し、TodoリストのFirestoreスナップショットを取得
  final todoSnapshotStream = ref.watch(todoRefProvider).snapshots();

  // Firestoreから取得したデータをTodoオブジェクトのリストに変換して、TodoListオブジェクトにまとめる
  return todoSnapshotStream.map(
      (snap) => TodoList(todo: snap.docs.map((doc) => doc.data()).toList()));
});

@freezed
class TodoList with _$TodoList {
  const factory TodoList({
    required List<Todo> todo,
  }) = _TodoList;
}
