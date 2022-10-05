import 'package:chat_example/model/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/FirebaseHelper.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(userModelProvider);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('全ユーザー'),
        ),
        body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>?>(
          future: FireStoreUtils.fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].data()['name']),
                      trailing: IconButton(
                        icon: Icon(Icons.person_add),
                        onPressed: () {
                          FireStoreUtils.createRoom(
                              snapshot.data!.docs[index].data()['userID'],
                              currentUser.userID);
                          print(
                              'このユーザーとのトークルームを作成しました${snapshot.data!.docs[index].data()}');
                        },
                      ),
                    ),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ));
  }
}
