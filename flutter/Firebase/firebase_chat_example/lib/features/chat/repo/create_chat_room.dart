import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/chat_room_entity.dart';
import 'refs/chat_refs.dart';

Future<void> createChatRoom({
  required ChatRoomEntity receiverChatRoom,
  required String receiverUserId,
  required ChatRoomEntity senderChatRoom,
  required String senderUserId,
}) async {
  print('🐯 createChatRoom Now !!!');
  // 相手のチャットルームを作成
  await chatRoomDocRef(userId: receiverUserId, chatRoomId: senderUserId)
      .set(receiverChatRoom, SetOptions(merge: true));
  // 自分のチャットルームを作成
  await chatRoomDocRef(userId: senderUserId, chatRoomId: receiverUserId)
      .set(senderChatRoom, SetOptions(merge: true));
}
