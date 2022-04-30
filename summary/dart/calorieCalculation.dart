void main() {
  //プロテイン,脂肪,炭水化物の順番
  print(totalCalorie(176, 133, 25));
}

//入力された各PFCグラムの値を計算して％を参照する関数
totalCalorie(x, y, z) {
  //一グラムあたりのカロリー
  int protein = 4;
  int fat = 9;
  int carbo = 4;
  //グラムからカロリーに変換
  int calorieProtein = x * protein;
  int calorieFat = y * fat;
  int calorieCarbo = z * carbo;

  int totalcalorie = calorieProtein + calorieFat + calorieCarbo;
  print("合計カロリーは$totalcalorieです");
  //割合を計算
  num rate1 = calorieProtein / totalcalorie;
  //％を計算
  num percent1 = rate1 * 100;
  //四捨五入
  int proteinPercent = percent1.round();
  print("プロテインは$proteinPercent％");

  num rate2 = calorieFat / totalcalorie;
  num percent2 = rate2 * 100;
  int fatPercent = percent2.round();
  print("脂肪は$fatPercent％");

  num rate3 = calorieCarbo / totalcalorie;
  num percent3 = rate3 * 100;
  int carboPercent = percent3.round();
  print("炭水化物は$carboPercent％");
}
