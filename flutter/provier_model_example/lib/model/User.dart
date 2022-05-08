import 'package:flutter/material.dart';

class User with ChangeNotifier {
// フィールド　（データのこと）
  String name;
  String age;
  String weight;
  String height;
//　コンストラクタ　（オブジェクトを使用する前に必要な初期化）
  User({
    this.name = "",
    this.age = "",
    this.weight = "",
    this.height = "",
  });

  //Firebaseからデータを取得する際の変換処理
  User.fromJson(Map<String, dynamic> json)
      : this(
          weight: json['weight'],
          name: json['name'],
          age: json['age'],
          height: json['height'],
        );

//DartのオブジェクトからFirebaseへ渡す際の変換処理
  Map<String, dynamic> toJson() {
    return {"name": name, "age": age, 'weight': weight, "height": height};
  }
}
