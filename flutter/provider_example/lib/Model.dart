import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  late String lastName;
  late String firstName;

  UserModel({this.lastName = "山田", this.firstName = "太郎"});
}
