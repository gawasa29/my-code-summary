import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/user_entity.dart';

final CollectionReference<UserEntity> usersRef =
    FirebaseFirestore.instance.collection('users').withConverter(
          fromFirestore: (snapshot, _) => UserEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// User ドキュメントの参照。
DocumentReference<UserEntity> userDocRef({
  required String userId,
}) =>
    usersRef.doc(userId);
