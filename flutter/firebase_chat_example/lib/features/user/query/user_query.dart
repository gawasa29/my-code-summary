import 'package:firebase_chat_example/features/user/domain/user_entity.dart';
import 'package:firebase_chat_example/features/user/repo/fetch_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repo/refs/user_refs.dart';

final userQueryProvider = StreamProvider.autoDispose<UserEntity>((ref) {
  print('🐯 userQueryProvider IN !!! ');
  return fetchUser();
});

final appUserProvider =
    StreamProvider.autoDispose.family<UserEntity?, String>((ref, userId) {
  return userDocRef(userId: userId).snapshots().map((snap) => snap.data());
});
