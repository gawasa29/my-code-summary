void main() {
  caloriesTograms(calorie, p, f, c) {
    int protein = 4;
    int fat = 9;
    int carbo = 4;
    Map pfcGrams = {};

    //少数に戻す
    num proteinRate = p / 100;
    //プロテインのカロリーを割り出す
    num proteinCalori = calorie * proteinRate;
    //カロリーからグラムを割り出す
    num proteinGram = proteinCalori / protein;
    print("$calorie,kcal中の$p％のプロテインは$proteinGram,gです");

    num fatRate = f / 100;
    num fatCalori = calorie * fatRate;
    num fatGram = fatCalori / fat;
    print("$calorie,kcal中の$f％の脂質は$fatGram,gです");

    num carboRate = c / 100;
    num carboCalori = calorie * carboRate;
    num carboGram = carboCalori / carbo;
    print("$calorie,kcal中の$c％の炭水化物は$carboGram,gです");

//mapに値を追加する and .round()で四捨五入
    pfcGrams['proteinGram'] = proteinGram.round();
    pfcGrams["fatGram"] = fatGram.round();
    pfcGrams["carboGram"] = carboGram.round();
    print(pfcGrams);

    return pfcGrams;
  }

//mapの値を自由に使うために変数に代入
  dynamic pfc = caloriesTograms(2000, 35, 60, 5);
  //mapのproteinGram kyeを指定
  print(pfc["proteinGram"]);
}
