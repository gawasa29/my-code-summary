import 'package:flutter/material.dart';
import 'package:my_test/ui/TestScreen.dart';
import 'package:provider/provider.dart';

import '../model/User.dart';
import '../services/FirebaseHelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  //値を保存用のUserインスタンス
  User currentUser = User();
  //値を出力用
  User? user;
  FireStoreUtils fireStoreUtils = FireStoreUtils();

  @override
  Widget build(BuildContext context) {
    //あんまわかってない
    return ChangeNotifierProvider.value(
      value: currentUser,
      child: Consumer<User>(
        builder: (context, currentUser, _) {
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
              body: Center(
                child: Column(
                  children: <Widget>[
                    TextField(
                      textAlign: TextAlign.right,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "名前",
                        hintText: "まぁ何か入力してみてよ！",
                      ),
                      // 最大入力可能文字数
                      maxLength: 10,
                      // 変更を即時反映する。
                      onChanged: (text) {
                        if (text.length > 0) {
                          // 入力値があるなら、それを反映する。
                          setState(() {
                            currentUser.name = text;
                          });
                        } else {
                          setState(() {
                            currentUser.name = "入力してください。";
                          });
                        }
                      },
                    ),
                    TextField(
                      textAlign: TextAlign.right,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "年齢",
                        hintText: "まぁ何か入力してみてよ！",
                      ),
                      maxLength: 2,
                      onChanged: (text) {
                        if (text.length > 0) {
                          setState(() {
                            currentUser.age = text;
                          });
                        } else {
                          setState(() {
                            currentUser.age = "入力してください。";
                          });
                        }
                      },
                    ),
                    TextField(
                      textAlign: TextAlign.right,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "身長",
                        hintText: "まぁ何か入力してみてよ！",
                      ),
                      maxLength: 10,
                      onChanged: (text) {
                        if (text.length > 0) {
                          setState(() {
                            currentUser.height = text;
                          });
                        } else {
                          setState(() {
                            currentUser.height = "入力してください。";
                          });
                        }
                      },
                    ),
                    TextField(
                      textAlign: TextAlign.right,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "体重",
                        hintText: "まぁ何か入力してみてよ！",
                      ),
                      maxLength: 3,
                      onChanged: (text) {
                        if (text.length > 0) {
                          setState(() {
                            currentUser.weight = text;
                          });
                        } else {
                          setState(() {
                            currentUser.weight = "入力してください。";
                          });
                        }
                      },
                    ),
                    ElevatedButton(
                      child: const Text('値をfirebaseに追加'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        //テキストフィールドでcurrentUserに入れた値をfirestoreに追加
                        await FireStoreUtils.updateCurrentUser(currentUser);
                      },
                    ),
                    ElevatedButton(
                      child: const Text('次の画面に移動して値を渡す'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        user = await FireStoreUtils.getCurrentUser();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            //本当はうまいこと値をTestScreeenに渡したいけど型が違うから渡せないのでダイナミックで無理やり渡す
                            dynamic user2 = user;
                            return TestScreeen(user: user2);
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
