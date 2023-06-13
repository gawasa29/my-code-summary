import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRef = FirebaseAuth.instance;

final authUserProvider = StreamProvider<User?>(
  (ref) => authRef.userChanges(),
);

final authUidProvider = Provider.autoDispose<String>((ref) {
  final user = authRef.currentUser;
  if (user == null) {
    throw AssertionError("User can't be null when fetching entries");
  }
  return user.uid;
});
