import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/User.dart';

class FireStoreUtils {
  //firebaseからデータを取得
  static Future<User?> getCurrentUser() async {
    DocumentSnapshot<Map<String, dynamic>> userDocument =
        await FirebaseFirestore.instance.collection('users').doc("uid").get();
    if (userDocument.exists) {
      return User.fromJson(userDocument.data() ?? {});
    } else {
      return null;
    }
  }

//データをfirebaseに追加
  static Future<void> updateCurrentUser(User user) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc("uid")
        .set(user.toJson());
  }
}
