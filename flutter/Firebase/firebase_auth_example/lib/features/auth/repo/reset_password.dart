import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';

Future<void> resetPassword({
  required String email,
}) async {
  print('🐯 resetPassword Now !!!');
  await authRef.sendPasswordResetEmail(email: email);
}
