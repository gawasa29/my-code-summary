import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//StateProviderは外部から変更可能な値を公開できるProvider
final userModelProvider = StateProvider((ref) {
  return User();
});

class User with ChangeNotifier {
  String userID;

  String name;

  String photoUrl;

  String aboutMe;

  User({
    this.userID = "",
    this.name = "",
    this.photoUrl = "",
    this.aboutMe = "",
  });

  //Firebaseからデータを取得する際の変換処理
  User.fromJson(Map<String, dynamic> json)
      : this(
          userID: json['userID'],
          name: json['name'],
          photoUrl: json['photoUrl'],
          aboutMe: json['aboutMe'],
        );

  //DartのオブジェクトからFirebaseへ渡す際の変換処理
  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      "name": name,
      'photoUrl': photoUrl,
      'aboutMe': aboutMe,
    };
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String name = "";
    try {
      aboutMe = doc.get("aboutMe");
    } catch (e) {}
    try {
      photoUrl = doc.get("photoUrl");
    } catch (e) {}
    try {
      name = doc.get("name");
    } catch (e) {}
    return User(
      userID: doc.id,
      photoUrl: photoUrl,
      name: name,
      aboutMe: aboutMe,
    );
  }
}
