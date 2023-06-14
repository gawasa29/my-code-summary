import 'refs/chat_refs.dart';

Future<void> updateChatRoom({
  required String currentUserUserId,
  required String receiverUserId,
}) async {
  print('🐯 updateChatRoom Now !!!');

  await chatRoomDocRef(userId: currentUserUserId, chatRoomId: receiverUserId)
      .update({'messageCount': 0});
}
