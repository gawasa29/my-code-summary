import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRef = FirebaseAuth.instance;

final authUserRef = authRef.currentUser;

final authUserProvider = StreamProvider<User?>(
  (ref) => authRef.userChanges(),
);

final authUidProvider = Provider.autoDispose<String>((ref) {
  final user = authRef.currentUser;
  if (user == null) {
    return 'ユーザーがいません';
  }
  return user.uid;
});
