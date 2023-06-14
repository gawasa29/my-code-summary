import 'package:firebase_chat_example/features/chat/domain/message_entity.dart';

import 'refs/chat_refs.dart';

Future<void> sendMessage({
  required MessageEntity message,
  required String receiverUserId,
  required String senderUserId,
}) async {
  print('🐯 sendMessage Now !!!');
  // 自分のメッセージ作成
  await messagesDocRef(userId: senderUserId, chatRoomId: receiverUserId)
      .set(message);
  // 相手のメッセージ作成
  await messagesDocRef(userId: receiverUserId, chatRoomId: senderUserId)
      .set(message);
}
