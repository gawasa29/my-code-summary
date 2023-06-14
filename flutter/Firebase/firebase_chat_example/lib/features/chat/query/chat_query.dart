import 'package:firebase_chat_example/features/chat/domain/chat_room_entity.dart';
import 'package:firebase_chat_example/features/chat/repo/refs/chat_refs.dart';
import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRoomProvider = StreamProvider.autoDispose
    .family<ChatRoomEntity?, String>((ref, chatRoomId) {
  return chatRoomDocRef(
          userId: chatRoomId, chatRoomId: authRef.currentUser!.uid)
      .snapshots()
      .map((snap) => snap.data());
});
