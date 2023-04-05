//シングルトンクラス
class Singleton {
  // 内部からしか呼び出せないPrivate Constructors
  Singleton._();

  //インスタンスを生成してキャッシュし、クラス(staticな)変数にインスタンスSingleton._()を格納
  static final Singleton _singleton = Singleton._();

  // キャッシュを返すfactoryコンストラクタ。
  factory Singleton() {
    //_singleton という変数に、一度作成したオブジェクト (インスタンス) or（キャッシュ）を保持している
    return _singleton;
  }
}

main() {
  Singleton s1 = Singleton();
  Singleton s2 = Singleton();
  //これはシングルトンクラスじゃなかったらfalseになる
  print(s1 == s2); // true
}
