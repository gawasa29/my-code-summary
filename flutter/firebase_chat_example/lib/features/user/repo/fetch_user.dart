import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:firebase_chat_example/features/user/repo/refs/user_refs.dart';

import '../domain/user_entity.dart';

Stream<UserEntity> fetchUser() {
  print('🐯 fetchUser Now !!!');

  return userDocRef(userId: authRef.currentUser!.uid)
      .snapshots()
      .map((snap) => snap.data()!);
}
