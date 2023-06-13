import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../user/repo/refs/user_refs.dart';
import '../../domain/chat_room_entity.dart';
import '../../domain/message_entity.dart';

/// chatRooms コレクションの参照。
CollectionReference<ChatRoomEntity> chatRoomRef({
  required String userId,
}) =>
    userDocRef(userId: userId).collection('chatRooms').withConverter(
          fromFirestore: (snapshot, _) =>
              ChatRoomEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// chatRoom ドキュメントの参照。
DocumentReference<ChatRoomEntity> chatRoomDocRef({
  required String userId,
  required String chatRoomId,
}) =>
    chatRoomRef(userId: userId).doc(chatRoomId);

/// messages コレクションの参照。
CollectionReference<MessageEntity> messagesRef({
  required String userId,
  required String chatRoomId,
}) =>
    chatRoomDocRef(userId: userId, chatRoomId: chatRoomId)
        .collection('messages')
        .withConverter(
          fromFirestore: (snapshot, _) =>
              MessageEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// message ドキュメントの参照。
DocumentReference<MessageEntity> messagesDocRef({
  required String userId,
  required String chatRoomId,
}) =>
    messagesRef(userId: userId, chatRoomId: chatRoomId).doc();
