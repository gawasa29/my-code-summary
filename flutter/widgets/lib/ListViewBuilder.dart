import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //FutureBuilderは非同期的な処理に対してwidgetを作るときに使うwidget（名前の通り未来のbuilderを決めれる）
        child: FutureBuilder<dynamic>(
            future: getData(), // 👈 非同期なデータ
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  //ローディングなどの待ち時間に表示することが多いグルグルです。
                  return const CircularProgressIndicator();
                } else {
                  List nameList =
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;
                    return data['full_name']; // 👈 field from your document
                  }).toList();
                  return ListView.builder(
                    itemCount: nameList.length, // 👈 リストの数を指定
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          nameList[index], // 👈indexはfor in 文みたいにlistの中身を繰り返し取得
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18.0),
                        ),
                        onTap: () {
                          print("onTap called.");
                        }, // タップ
                        onLongPress: () {
                          print("onLongTap called.");
                        }, // 長押し
                      );
                    },
                  );
                }
                // 通信が失敗した場合
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //ローディングなどの待ち時間に表示することが多いグルグルです。
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

getData() async {
  //firestoreからデータを取得
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('books').get();
  return querySnapshot;
}
