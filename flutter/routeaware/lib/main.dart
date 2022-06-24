import 'package:flutter/material.dart';

//RouteObserverを定義する
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //定義したrouteObserverをMaterialAppに設定する
      navigatorObservers: [routeObserver],
      home: const RouteAwareSample(),
    );
  }
}

class RouteAwareSample extends StatefulWidget {
  const RouteAwareSample({Key? key}) : super(key: key);

  @override
  _RouteAwareSample createState() => _RouteAwareSample();
}

// with RouteAware を記述する
class _RouteAwareSample extends State<RouteAwareSample> with RouteAware {
  @override
  void didChangeDependencies() {
    // 遷移時に呼ばれる関数
    // routeObserverに自身を設定
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void dispose() {
    // routeObserverから自身を外す
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    debugPrint("popされて、この画面に戻ってきました！");
  }

  @override
  void didPush() {
    debugPrint("pushされてきました、この画面にやってきました！");
  }

  @override
  void didPop() {
    debugPrint("この画面がpopされました");
  }

  @override
  void didPushNext() {
    debugPrint("この画面からpushして違う画面に遷移しました！");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                child: const Text('Button'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Sanple()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}

class Sanple extends StatelessWidget {
  const Sanple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: Column(
            children: const <Widget>[],
          ),
        ));
  }
}
