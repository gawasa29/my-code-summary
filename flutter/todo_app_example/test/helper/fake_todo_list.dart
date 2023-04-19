import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_example/query.dart';
import 'package:todo_app_example/todo.dart';

Stream<TodoList> fakeTodoList(Ref ref) => Stream<TodoList>.value(
      const TodoList(
        todo: [
          Todo(
              id: '0.06367177154765036',
              description: 'テストです。',
              completed: false),
          Todo(
              id: '0.4272628292470455',
              description: 'テストです2。',
              completed: true),
        ],
      ),
    );
