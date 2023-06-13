import 'dart:async';

import 'package:firebase_chat_example/features/chat/domain/message_entity.dart';
import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:firebase_chat_example/features/user/repo/refs/user_refs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/chat_room_entity.dart';
import '../repo/create_chat_room.dart';
import '../repo/send_message.dart';

final chatAsyncNotifierCommand = AsyncNotifierProvider<ChatCommand, void>(() {
  return ChatCommand();
});

class ChatCommand extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // commandなので必ずvoid型でなければならない。
  }

  Future<void> sendEvent({
    required String content,
    required String receiverId,
  }) async {
    final currentUid = authRef.currentUser!.uid;
    final receiverUser = await userDocRef(userId: receiverId).get();
    final senderUser = await userDocRef(userId: currentUid).get();
    //相手の
    final receiverChatRoom = ChatRoomEntity(
      chatRoomId: currentUid,
      chatUserName: senderUser.data()!.name,
      lastMessage: content,
    );
    //自分の
    final senderChatRoom = ChatRoomEntity(
      chatRoomId: receiverId,
      chatUserName: receiverUser.data()!.name,
      lastMessage: content,
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await createChatRoom(
        receiverChatRoom: receiverChatRoom,
        receiverUserId: receiverId,
        senderChatRoom: senderChatRoom,
        senderUserId: currentUid,
      );
    });
    final message = MessageEntity(
      content: content,
      receiverId: receiverId,
      senderId: currentUid,
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        return await sendMessage(
          message: message,
          receiverId: receiverId,
          senderId: currentUid,
        );
      },
    );
    if (!state.isLoading && !state.hasError) {
      print('🐯 メッセージ送信 !!!');
    }
  }
}
