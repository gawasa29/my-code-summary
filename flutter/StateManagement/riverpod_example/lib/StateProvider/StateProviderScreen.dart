import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// StateProvider - 変更可能な状態を公開する
// （外部から）変更可能な値を公開できるProvider
//現在選択されているアイテムやフィルタリングの状態など、単純な状態を保持するのに適しています。

// StateProviderを定義
// Providerの定数をグローバルに宣言
final counterProvider = StateProvider((ref) => 0);

class StateProviderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerを読み取る。 `.notifier` を付けると `StateController` が、
    // 付けなければ、 `state` つまり int が取得できる。
    final counter = ref.watch(counterProvider.notifier);

    return MaterialApp(
        home: Scaffold(
      // counterProviderの状態（カウント数）をTextで表示。値が変わると再描画される。
      body: Center(child: Text('${ref.watch(counterProvider)}')),
      floatingActionButton: FloatingActionButton(
        // ボタンタップでcounterProviderの状態をプラス１する
        // ↓ `counter.state++` や、 `counter.state = counter.state + 1` と書いても同じ。
        onPressed: () {
          counter.state = counter.state + 1;
        },
        child: const Icon(Icons.add),
      ),
    ));
  }
}
