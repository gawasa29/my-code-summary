import 'package:fluttertoast/fluttertoast.dart';

Future<void> toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
  );
  return Future.value(null);
}
