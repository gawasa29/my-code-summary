import 'package:firebase_chat_example/features/chat/domain/message_entity.dart';

import 'refs/chat_refs.dart';

Future<void> sendMessage({
  required MessageEntity message,
  required String receiverId,
  required String senderId,
}) async {
  print('🐯 sendMessage Now !!!');
  // 自分のメッセージ作成
  await messagesDocRef(userId: senderId, chatRoomId: receiverId).set(message);
  // 相手のメッセージ作成
  await messagesDocRef(userId: receiverId, chatRoomId: senderId).set(message);
}
