import 'package:flutter/material.dart';
import 'package:my_test/model/User.dart';

class TestScreeen extends StatefulWidget {
  final User user;
  TestScreeen({Key? key, required this.user}) : super(key: key);

  @override
  State<TestScreeen> createState() => _TestScreeenState();
}

class _TestScreeenState extends State<TestScreeen> {
  late User user;
  initState() {
    user = widget.user;
    super.initState();
  }

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
        body: Center(
          child: Column(
            children: <Widget>[
              Text(user.name),
              Text(user.age),
              Text(user.height),
              Text(user.weight),
            ],
          ),
        ));
  }
}
