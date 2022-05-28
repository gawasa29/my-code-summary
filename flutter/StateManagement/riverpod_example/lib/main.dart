import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/StateProvider/StateProviderScreen.dart';

import 'ChangeNotifierProvider/ChangeNotifierProviderScreen.dart';

//現時点では目標設定画面
Future<void> main() async {
  return runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Represents the MyApp class
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text('ChangeNotifierProvider'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChangeNotifierProviderScreeen()),
                  );
                },
              ),
              ElevatedButton(
                child: const Text('StateProvider'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateProviderScreen()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
