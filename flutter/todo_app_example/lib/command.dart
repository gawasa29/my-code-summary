import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ssot.dart';
import 'todo.dart';

// CQRSのCommand
final todoCommandProvider = Provider(TodoCommand.new);

//これはStateNotifierじゃない、
//理由はStateNotifierだと、SSOTから得られる値が流れる以外に、
//任意のタイミングで state = で値をセットできる余地があるため、
//周辺コードをよく確認しないとデータの流れを正確に読み解けなくなるので、
//StateNotifierは本当に必要なところで最小限の利用にとどめるのが良いです。
class TodoCommand {
  TodoCommand(this._ref);
  final Ref _ref;

  /// 新しいTODOを追加するメソッド
  void add(Todo todo) {
    _ref.read(todoRefProvider).doc(todo.id).set(todo);
  }

  /// IDを指定して、TODOを削除するメソッド
  void remove(String todoId) {
    _ref.read(todoRefProvider).doc(todoId).delete();
  }

  /// IDを指定して、TODOの完了状態を切り替えるメソッド
  void toggle(String todoId) {
    _ref.read(todoRefProvider).doc(todoId).update({'completed': true});
  }
}
