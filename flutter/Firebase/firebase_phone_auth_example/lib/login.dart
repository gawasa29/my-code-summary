import 'package:flutter/material.dart';

import 'otpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String phone = '';
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            children: [
              const Text(
                '電話番号を入力してください',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                maxLength: 11,
                onChanged: (String? val) {
                  phone = "+81${val!}";
                },
              ),
            ],
          ),
          ElevatedButton(
            child: const Text('Button'),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("コードをこの番号に送信します"),
                    content: Text(phone),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen(phone)),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
