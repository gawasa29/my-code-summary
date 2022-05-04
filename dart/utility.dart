//型チェック関数
ceackType(value) {
  print(value);
  if (value is String) {
    print('型はStringです');
  } else if (value is int) {
    print("型はintです");
  } else if (value is double) {
    print("型はdoubleです");
  } else if (value is bool) {
    print("型はboolです");
  } else if (value is DateTime) {
    print("型はDateTimeです");
  } else if (value is List) {
    print("型はListです");
  } else if (value is Map) {
    print("型はMapです");
  } else {
    print("ここでは定義されていない型です");
  }
}
