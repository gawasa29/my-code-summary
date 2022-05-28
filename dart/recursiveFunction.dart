//再帰関数(recursiveFunction)とは、関数の中で自分自身を呼び出し、処理を行う関数のことです。
void main() {
  print(recursiveSum(5));
}

int recursiveSum(int n) {
  //n=0でtrueとなるため、nが0になると0を返してこの関数の処理は終了となります。
  if (n <= 0) {
    return 0;
  }

  return n + recursiveSum(n - 1);
}
//わかりやすい実際の処理
// 5 + recursiveSum(5 - 1)
// => 5 + ( 4 + recursiveSum(4 - 1) )
// => 5 + ( 4 + ( 3 +recursiveSum(3 - 1) ) )
// => 5 + ( 4 + ( 3 +  ( 2 + recursiveSum(2 - 1) ) ) )
// => 5 + ( 4 + ( 3 +  ( 2 + ( 1 + recursiveSum(1 - 1) ) ) ) )
// => 5 + ( 4 + ( 3 +  ( 2 + ( 1 + 0 ) ) ) )
// => 15