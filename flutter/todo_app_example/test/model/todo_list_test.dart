import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_example/query.dart';

import '../helper/fake_todo_list.dart';

void main() {
  // テストケースを定義
  test('TodoList and todoListQueryProvider test', () async {
    // プロバイダのコンテナを作成し、todoListQueryProviderをオーバーライド
    final container = ProviderContainer(
        overrides: [todoListQueryProvider.overrideWith(fakeTodoList)]);

    // テストが終了したら、プロバイダのコンテナを破棄
    addTearDown(container.dispose);

    // todoListQueryProviderをリッスンし、TodoListが取得されるまで待機
    final todoList =
        await container.listen(todoListQueryProvider.future, (_, __) {}).read();

    // TodoListが1つのTodoを含んでいることを確認
    expect(todoList.todo.length, 2);

    // TodoList内のTodoが正しいことを確認
    final todo = todoList.todo.first;
    expect(todo.id, '0.06367177154765036');
    expect(todo.description, 'テストです。');
    expect(todo.completed, false);
  });
}
