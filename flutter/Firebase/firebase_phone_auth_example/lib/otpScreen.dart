import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen(this.phone, {Key? key}) : super(key: key);

  final String phone;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // 6 text editing controllers that associate with the 6 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String _otp = "";

  String _verificationCode = "";

  dynamic phone;

  _verifyPhone(phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {
        // iosの場合は空欄で問題なし
      },
      verificationFailed: (FirebaseAuthException e) {
        //エラーの時の処理
        if (e.code == 'invalid-phone-number') {
          print('電話番号が正しくありません。');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        //codeSentはコードを送信した後の処理
        //コードを送信した後にPhoneAuthProvider.credentialで使えるように変数を代入
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //タイムアウト時間を指定して、指定時間が過ぎたらこちらのハンドラが発火します。
        // デフォルトでは30秒で発火
      },
    );
  }

  @override
  void initState() {
    super.initState();
    //widget.phoneはLoginScreenから受け取ったphone変数をOtpScreenのphone変数に入れ直して使えるようにしている
    phone = widget.phone;
    _verifyPhone(phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(style: const TextStyle(fontSize: 20), "あなたの番号$phone"),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true),
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false),
              OtpInput(_fieldFive, false),
              OtpInput(_fieldSix, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () async {
                setState(() {
                  _otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text +
                      _fieldFive.text +
                      _fieldSix.text;
                });
                // 認証コード(smsCode)とverificationIdをfirebaseに送信して認証
                final credential = PhoneAuthProvider.credential(
                    verificationId: _verificationCode, smsCode: _otp);
                // 認証が完了したらFirebaseAuthにユーザー登録
                await FirebaseAuth.instance.signInWithCredential(credential);
              },
              child: const Text('OK')),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
          Text(
            _otp,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
