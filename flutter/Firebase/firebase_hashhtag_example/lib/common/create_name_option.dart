Future<List<String>> createNameOption(String value) async {
  var name = value;
  final times = <int>[];
//分割する文字数（かつ回数）を規定（大きい数順で２文字目まで）
  for (var i = name.length; i >= 1; i--) {
    times.add(i);
  }
  final nameList = <String>[];
  for (final time in times) {
//繰り返す回数
    for (var i = name.length; i >= 0; i--) {
//１ずつ数字を減らしていく（１文字以上、名前の文字数以下の分割Gramが生成される）
      if (i + time <= name.length) {
//文字数を超えて分割の後ろを指定できないので、if分で制御
        final getName = name.substring(i, i + time);
        nameList.add(getName);
        name = value;
      }
    }
  }
  return nameList;
}
