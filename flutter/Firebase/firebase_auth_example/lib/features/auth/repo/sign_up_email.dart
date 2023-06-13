import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';

Future<void> signUpEmail({
  required String email,
  required String password,
}) async {
  print('🐯 signUpEmail Now !!!!!');
  await authRef.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}
