import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app_example/todo.dart';

void main() {
  test('Todo fromJson toJson test', () async {
    // JSONオブジェクトを作成
    final json = {
      'id': "123",
      'description': "テストです",
      'completed': false,
    };
    // JSONオブジェクトからTodoインスタンスを作成
    final target = Todo.fromJson(json);
    //expect(処理や変数, 期待する値);
    expect(
      target,
      const Todo(
        id: "123",
        description: "テストです",
        completed: false,
      ),
    );
    // TodoインスタンスをJSONオブジェクトに変換
    final toJsonResult = target.toJson();
    // 変換されたJSONオブジェクトが正しいか確認
    expect(toJsonResult, json);
  });
}
