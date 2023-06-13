import 'dart:async';

import 'package:firebase_chat_example/features/user/repo/refs/auth_refs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_entity.dart';
import '../repo/create_user.dart';

final userAsyncNotifierCommand = AsyncNotifierProvider<UserCommand, void>(() {
  return UserCommand();
});

class UserCommand extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // commandなので必ずvoid型でなければならない。
  }

  Future<void> createUserEvent({
    required String name,
  }) async {
    UserEntity user = UserEntity(name: name, userId: authRef.currentUser!.uid);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await createUser(user);
    });
    if (!state.isLoading && !state.hasError) {
      print('🐯 新しいユーザーを作成しました !!!');
    }
  }
}
