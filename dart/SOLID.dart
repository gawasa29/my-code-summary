// 1. 単一責任の原則
// その名前から明らかなように、単一責任である。つまり、クラスが変更される可能性があるのは1つの理由だけだということだ。

class Result {
  checkResult(int rollno) {
    bool isRollnoValidate = Validate().isRollnovalidate();
    if (isRollnoValidate) {
      ResultModel resultModel = NetworkApi().searchResult();
      Printing().showResult(resultModel);
    } else {
      return "Invalid rollno";
    }
  }
}

class Validate {
  // 検証する。
  isRollnovalidate() {
    return true;
  }
}

class ResultModel {}

class Printing {
  // このクラスは印刷を担当する。
  showResult(ResultModel model) {
    // 気持ちよく結果を見せる
  }
}

class NetworkApi {
  // このクラスは結果のフェッチを担当する
  searchResult() {
    return ResultModel();
  }
}

// 2.開放/閉鎖の原則
// クラスは、拡張にはオープンで、変更にはクローズドであるべきだ。

abstract class Result2 {
  checkResult();
}

class ComputerScience implements Result2 {
  @override
  checkResult() {
    // some code
  }
}

class Civil implements Result2 {
  @override
  checkResult() {
    // some code
  }
}

class Mechanical implements Result2 {
  @override
  checkResult() {
    // some code
  }
}

// 3.リスコフの置換原則
// 子クラス は、その親クラス として常に使用できるべきである、というものです。

abstract class OfflineResult {
  checkResult();
}

abstract class CodingResult {
  codingTestResult();
}

class MechanicalBranch implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}

class ComputerScienceBranch implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }

  @override
  codingTestResult() {
    // somecode
  }
}

// 4.インターフェイス分離の原則
// クライアントが使用しないメソッドへの依存を、強制すべきではない。

abstract class OfflineResult2 {
  checkResult();
}

abstract class CodingResult2 {
  codingTestResult();
}

class MechanicalBranch2 implements OfflineResult {
  @override
  checkResult() {
    //  some code
  }
}

class ComputerScienceBranch2 implements OfflineResult, CodingResult {
  @override
  checkResult() {
    // somecode
  }

  @override
  codingTestResult() {
    // somecode
  }
}

//5. 依存関係逆転の原則
// 抽象化は詳細 (具体的な実装) に依存すべきではありません。それらは抽象化に依存する必要があります。
abstract class Payment {
  payment();
}

class PaymentViaCreditCard implements Payment {
  @override
  payment() {
    // some code
  }
}

class PaymentViaDebitCard implements Payment {
  @override
  payment() {
    // some code
  }
}

class PaymentViaBhimUPI implements Payment {
  @override
  payment() {
    // some code
  }
}

class Checkout {
  // チェックアウト・クラスは、支払いの仕組みについて何も知らない。
  // pay.payment()が支払いメソッドであることを知っている
  checkOut(Payment pay) {
    pay.payment();
  }
}

// 結論 ：
// ソリッドに囚われるな

// : S.O.L.I.D 原則は原則であり、ルールではない

// : これを適用するときは、常に常識を働かせること。あなたのゴールは、コードをメンテナンスしやすく、拡張しやすくすることだ。

// : SRPやS.O.L.I.Dのためにコードを断片化しすぎないこと。

// : S.O.L.I.Dを達成しようとするのではなく、保守性を達成するためにS.O.L.I.Dを使うのだ。S.O.L.I.Dはツールであって、あなたのゴールではない
