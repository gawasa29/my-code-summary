import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Model.dart';

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
    // Providerで状態管理する箇所を囲む
    return ChangeNotifierProvider<UserModel>(
      // この画面が作成されたときにUserModelも読み込ませる
      create: (context) => UserModel(),
      child: Consumer<UserModel>(
          builder: (context, model, child) => Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(Provider.of<UserModel>(context).lastName),
                      Text(Provider.of<UserModel>(context).firstName),
                    ],
                  ),
                ),
              )),
    );
  }
}
