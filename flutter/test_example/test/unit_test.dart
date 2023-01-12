// test(テスト名, () {
//    前処理
//   expect(処理や変数, 処理による結果や変数の期待値);
// });

//expect()関数には、1つ目のパラメータに処理や変数で得られた値を入れ、
//2つ目のパラメータには自分が期待する値や結果を入れます。そうする事により、テストで得られた値と自分が期待する値を比較可能です。
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('unit Test', () {
    var test = 5;
    expect(test, 5);
  });
}
