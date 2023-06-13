import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

import '../domain/chat_room_entity.dart';
import '../repo/refs/chat_refs.dart';
import 'chat_room_screen.dart';

class ChatRoomListScreen extends StatelessWidget {
  const ChatRoomListScreen({super.key});
  static const routeName = 'ChatRoomList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ChatRoomList'),
        ),
        body: FirestoreListView(
          query: chatRoomRef(userId: authRef.currentUser!.uid),
          errorBuilder: (context, error, stackTrace) =>
              Center(child: Text(error.toString())),
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          itemBuilder: (BuildContext context,
              QueryDocumentSnapshot<ChatRoomEntity> doc) {
            final room = doc.data();
            return Card(
              child: ListTile(
                title: Text(room.chatUserName),
                trailing: IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () {
                    context.goNamed(
                      ChatRoomScreen.routeName,
                      pathParameters: <String, String>{
                        'userId': room.chatRoomId
                      },
                    );
                  },
                ),
              ),
            );
          },
        ));
  }
}
