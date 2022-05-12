import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //おまじない
  WidgetsFlutterBinding.ensureInitialized();
  //ファイアベースコアの初期化
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TopScreen(),
    );
  }
}

// サインアップの初期画面

class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(
              width: 300.0,
              height: 300.0,
              image: NetworkImage(
                  'https://cdn.dribbble.com/users/25514/avatars/normal/070810be04e642201206c8fbdffcbf8a.png?1455536235')),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                primary: const Color.fromRGBO(128, 128, 128, 1.0),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text('登録'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                primary: const Color.fromRGBO(128, 128, 128, 1.0),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text('ログイン'),
            ),
          ),
        ],
      ),
    ));
  }
}

//ログイン入力画面

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 入力されたメールアドレス
  String LoginUserEmail = "";
  // 入力されたパスワード
  String LoginUserPassword = "";
  // 登録・ログインに関する情報を表示
  String LogininfoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: (50.0), right: (50.0)),
            child: Column(children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "ログイン",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    const SizedBox(
                      height: (80.0),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          // テキスト入力のラベルを設定
                          decoration:
                              const InputDecoration(labelText: "メールアドレス"),
                          onChanged: (String value) {
                            setState(() {
                              LoginUserEmail = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "パスワード（６文字以上）"),
                          // パスワードが見えないようにする
                          obscureText: true,
                          onChanged: (String value) {
                            setState(() {
                              LoginUserPassword = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 66,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          primary: const Color.fromRGBO(128, 128, 128, 1.0),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .signInWithEmailAndPassword(
                                    email: LoginUserEmail,
                                    password: LoginUserPassword);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              print('Wrong password provided for that user.');
                            }
                          }
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}

// メールアドレス登録画面

// 入力されたメールアドレス
String newUserEmail = "";
// 入力されたパスワード
String newUserPassword = "";
// 登録・ログインに関する情報を表示
String infoText = "";

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: (50.0), right: (50.0)),
            child: Column(children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "メールアドレス登録",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    const SizedBox(
                      height: (80.0),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          // テキスト入力のラベルを設定
                          decoration:
                              const InputDecoration(labelText: "メールアドレス"),
                          onChanged: (String value) {
                            setState(() {
                              newUserEmail = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: "パスワード（６文字以上）"),
                          // パスワードが見えないようにする
                          obscureText: true,
                          onChanged: (String value) {
                            setState(() {
                              newUserPassword = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 66,
                    ),
                    // 登録失敗時のエラーメッセージ
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
                      child: Text(
                        infoText,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          primary: const Color.fromRGBO(128, 128, 128, 1.0),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            // メール/パスワードでユーザー登録
                            final UserCredential result = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                              email: newUserEmail,
                              password: newUserPassword,
                            );
                            //メール確認コード
                            await FirebaseAuth.instance.currentUser!
                                .sendEmailVerification();
                            // 登録したユーザー情報
                            final User user = result.user!;
                            print(user);
                            setState(() {
                              infoText = "登録OK：${user.email}";
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AuthScreen()),
                            );
                          } catch (e) {
                            // 登録に失敗した場合
                            print(e);
                            setState(() {
                              infoText = "失敗しました";
                            });
                          }
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}

//メール確認画面
class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  _AuthScreenScreenState createState() => _AuthScreenScreenState();
}

class _AuthScreenScreenState extends State<AuthScreen> {
  String _infoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("メールアドレスの確認"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('確認しました'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  //メール確認をできているか確認して処理分ける
                  if (userCredential.user!.emailVerified) {
                    setState(() {
                      _infoText = "確認が成功";
                    });
                  } else {
                    setState(() {
                      _infoText = "確認が終わっていません";
                    });
                  }
                } catch (e) {
                  print('NG');
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
