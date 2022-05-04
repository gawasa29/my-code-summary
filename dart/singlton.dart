//シングルトンクラス
class Singleton {
  // 内部から呼び出してインスタンスを作るためのプライベートなコンストラクタ。
  Singleton._internal();

  //コンストラクタSingleton._internal()をプライベート(アンダーバーをつけた状態)にし、外部から呼び出せないように
  //インスタンスを生成してキャッシュし、クラス(staticな)変数にインスタンス(Singleton._internal())を格納
  static final Singleton _singleton = Singleton._internal();
  //_internal();、これは _();でも構わない。_internal()という名前は必ずしもこの名前である必要はない。

  // キャッシュを返すfactoryコンストラクタ。
  factory Singleton() {
    //_singleton という変数に、一度作成したオブジェクト (インスタンス) or（キャッシュ）を保持している
    return _singleton;
  }
//ただのメンバ変数
  String name = "太郎";
}

main() {
  Singleton s1 = Singleton();
  Singleton s2 = Singleton();
  //これはシングルトンクラスじゃなかったらfalseになる
  print(s1 == s2); // true

  print(s1.name);
}
