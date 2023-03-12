// 抽象クラス
// 抽象クラスとは継承されることを前提として、処理内容を記述しないメソッド（抽象メソッド）を含むクラスです。
// 抽象クラス単体ではインスタンス化することはできません。

// 反対にインスタンス化できるクラスは具象クラスと呼びます。
// 抽象クラスを定義する際はabstractキーワードを指定します。
// 主にインターフェースで使われる
abstract class Interface {
  void hello();
}

///////////////////////////////////

class PersonA implements Interface {
  @override
  void hello() {
    print('こんにちは私はPersonAです。');
  }
}

class PersonB implements Interface {
  final String voice;
  PersonB({required this.voice});

  @override
  void hello() {
    print('こんにちは私は${voice}です。');
  }
}

void main() {
  //Interfaceクラス型やのにhello()メソッド実行できてる。
  Interface personA = PersonA();
  Interface personB = PersonB(voice: 'PersonB');
  personA.hello();
  personB.hello();
}
