import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/User.dart';
import '../utils/FirebaseHelper.dart';
import '../utils/utilities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FireStoreUtils fireStoreUtils = FireStoreUtils();
  final ScrollController listScrollController = ScrollController();
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
              Container(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .limit(20)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemBuilder: (context, index) {
                            return buildItem(
                                context, snapshot.data?.docs[index]);
                          },
                          itemCount: snapshot.data?.docs.length,
                          controller: listScrollController,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? document) {
    if (document != null) {
      User userChat = User.fromDocument(document);
      return Container(
        margin: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: TextButton(
          onPressed: () {
            if (Utilities.isKeyboardShowing()) {
              Utilities.closeKeyboard(context);
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xffE8E8E8)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          child: Row(
            children: <Widget>[
              Material(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                clipBehavior: Clip.hardEdge,
                child: userChat.photoUrl.isNotEmpty
                    ? Image.network(
                        userChat.photoUrl,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: const Color(0xfff5a623),
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, object, stackTrace) {
                          return const Icon(
                            Icons.account_circle,
                            size: 50,
                            color: Color(0xffaeaeae),
                          );
                        },
                      )
                    : const Icon(
                        Icons.account_circle,
                        size: 50,
                        color: Color(0xffaeaeae),
                      ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                        child: Text(
                          'Nickname: ${userChat.name}',
                          maxLines: 1,
                          style: const TextStyle(color: Color(0xff203152)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'About me: ${userChat.aboutMe}',
                          maxLines: 1,
                          style: const TextStyle(color: Color(0xff203152)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
