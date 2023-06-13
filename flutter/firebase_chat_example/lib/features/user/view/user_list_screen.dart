import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:firebase_chat_example/features/user/repo/refs/user_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

import '../../chat/view/chat_room_screen.dart';
import '../domain/user_entity.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});
  static const routeName = 'UserList';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserList'),
        ),
        body: FirestoreListView(
          query:
              usersRef.where('userId', whereNotIn: [authRef.currentUser!.uid]),
          errorBuilder: (context, error, stackTrace) =>
              Center(child: Text(error.toString())),
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          itemBuilder:
              (BuildContext context, QueryDocumentSnapshot<UserEntity> doc) {
            final user = doc.data();
            return Card(
              child: ListTile(
                title: Text(user.name),
                trailing: IconButton(
                  icon: const Icon(Icons.person_add),
                  onPressed: () {
                    context.goNamed(
                      ChatRoomScreen.routeName,
                      pathParameters: <String, String>{'userId': user.userId},
                    );
                  },
                ),
              ),
            );
          },
        ));
  }
}
