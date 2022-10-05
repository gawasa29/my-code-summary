import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/Chat_room.dart';
import '../utils/FirebaseHelper.dart';
import 'chat_room_screen.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('トークルーム'),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FireStoreUtils.joindRoomSnapshot,
          //streamSnapshotとfutereSnapshotはややこしくなるから変数名変えてるだけ本来はsnapshotだけ。
          builder: (context, streamSnapshot) {
            //データがあったらの処理
            if (streamSnapshot.hasData) {
              return FutureBuilder<List<ChatRoom>?>(
                  future: FireStoreUtils.fetchMyRoom(streamSnapshot.data!),
                  builder: (context, futereSnapshot) {
                    if (futereSnapshot.hasData) {
                      List<ChatRoom> chatRooms = futereSnapshot.data!;
                      return ListView.builder(
                        itemCount: chatRooms.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(
                                chatRooms[index].talkUser.name,
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.question_answer),
                                onPressed: () {
                                  print('トークルームIDは${chatRooms[index].roomId}');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChatRoomScreen(chatRooms[index])),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  });
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
