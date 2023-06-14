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
            return InkWell(
              onTap: () {
                context.goNamed(
                  ChatRoomScreen.routeName,
                  pathParameters: <String, String>{
                    'receiverUserId': room.chatRoomId,
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            room.chatUserName,
                            style: const TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            room.lastMessage,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          (room.messageCount == 0)
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.centerRight,
                                  child: Badge.count(count: room.messageCount),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
