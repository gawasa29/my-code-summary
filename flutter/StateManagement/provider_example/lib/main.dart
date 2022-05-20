import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //処理がどこに通るかの確認のためのprint
    print("MyHomePageStateをビルド");

    //ChangeNotifierProvider を使ってデータを渡す
    //受け渡すデータは ChangeNotifier を継承し notifyListeners() を使って変更を知らせる
    return ChangeNotifierProvider(
      create: (context) => MyHomePageState(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("gawasa"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePageState extends ChangeNotifier {
  int counter = 0;

  void increnemt() {
    counter++;
    // 値が変更したことを知らせUIを再構築するたぶんsetStateみたいなもん
    notifyListeners();
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("WidgetAをビルド");
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //処理がどこに通るかの確認のためのprint
    print("WidgetBをビルド");

    //データを受け取って変数に代入
    //context.watch()：受け取ったデータを元にUIの構築を行う時に使う（Textにデータを渡す時など）
    final int counter = context.watch<MyHomePageState>().counter;
    return Text(
      '$counter',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("WidgetCをビルド");
    //データを受け取って変数に代入
    //context.read()：受け取ったデータを元にUIの構築を行わない時に使う（クリック時の処理など）
    final Function increment = context.read<MyHomePageState>().increnemt;
    return ElevatedButton(
        onPressed: () {
          increment();
        },
        child: const Text("カウント"));
  }
}
