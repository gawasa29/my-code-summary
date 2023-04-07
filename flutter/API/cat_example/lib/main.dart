import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const publicKey =
    "live_PrA9LdM19BRwkm3n6NG2GNrH56w3s2qywHUim6UdbtOc7Ky5cqp4XCz1TQvECdvi";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cat_API"),
      ),
      body: FutureBuilder(
          future: _get(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      data!.single["url"],
                      errorBuilder: (c, err, stack) {
                        return const Center(child: Text('error'));
                      },
                      frameBuilder: (c, image, frame, sync) {
                        if (!sync && frame == null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return image;
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _get();
          setState(() {});
        },
        tooltip: 'Increment',
        label: const Text('画像を更新'),
        icon: const Icon(Icons.change_circle),
      ),
    );
  }
}

Future<List> _get() async {
  final result = await Dio().get(
    //なんらかの情報を取得したい場合はこのGETメソッドを使います。GETはURL指定してサーバにリクエストします（このURLのことをAPIエンドポイントと言う）。
    "https://api.thecatapi.com/v1/images/search",
    //URL「?」以降にパラメータを指定できる。
    queryParameters: <String, Object?>{
      'apikey': publicKey,
    },
  );
  //これが最終的なGETリクエストURL
  print(result
      .realUri); //https://api.thecatapi.com/v1/images/search?apikey=live_PrA9LdM19BRwkm3n6NG2GNrH56w3s2qywHUim6UdbtOc7Ky5cqp4XCz1TQvECdvi
  //result.dataで中身を取り出す。
  print(result.data);
  //List<dynamic>型
  print(result.data.runtimeType);
  return result.data;
}
