// StatelessWidget の代わりに Riverpod の ConsumerWidget を継承します。
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/ChangeNotifierProvider/counter.dart';

// 値（ここでは Counterクラス）を格納する「プロバイダ」を作成します。
// プロバイダを使うことで値のモックやオーバーライドが可能になります。
// ChangeNotifierProviderを定義
final counterProvider = ChangeNotifierProvider((ref) => Counter());

class ChangeNotifierProviderScreeen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを監視し値を取得するには `watch` を使います。
    // `Counter` の状態が更新されるとbuildメソッドが再実行され、画面が更新される
    final counter = ref.watch(counterProvider);
    return MaterialApp(
        home: Scaffold(
      // counter.countインスタンスを文字列に変換して表示
      body: Center(child: Text(counter.count.toString())),
      floatingActionButton: FloatingActionButton(
        // ボタンタップで Counterの `increase()` メソッドを実行
        onPressed: counter.increase,
        child: const Icon(Icons.add),
      ),
    ));
  }
}
