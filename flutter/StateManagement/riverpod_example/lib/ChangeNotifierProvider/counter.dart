import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  // 状態を定義・保持
  int count = 0;

  // 以下は状態を操作するメソッド

  // `notifyListeners()` で状態(count)の変化を通知し、
  // `count` を使用しているWidgetの再構築が行われる

  void increase() {
    count++;
    notifyListeners();
  }
}
