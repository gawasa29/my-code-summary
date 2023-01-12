import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_example/main.dart' as app;

void main() {
  //おまじない
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('start', (WidgetTester tester) async {
      app.main();
      //ここからテスト
      //アニメーションなどを待つ描画されなくなるまでtestの実行を待つ。
      await tester.pumpAndSettle();

      // カウンタが0から始まることを確認する
      // 画面内の'0'textを探す
      expect(find.text('0'), findsOneWidget);

      //変数に指定したキーを入れる
      const testKey = Key('increment');

      // タップするキーを探して変数に入れます。
      final Finder fab = find.byKey(testKey);

      // フローティングアクションボタン（キー）へのタップをエミュレートします。
      await tester.tap(fab);

      //描画するまで待つ
      await tester.pumpAndSettle();

      //フローティングアクションボタンを押すとカウンタが１追加されるのを確認
      // 画面内の'1'textを探す
      expect(find.text('1'), findsOneWidget);
    });
  });
}
