import 'refs/auth_refs.dart';

Future<void> signInEmail({
  required String email,
  required String password,
}) async {
  print('🐯 signInEmail Now !!!');
  await authRef.signInWithEmailAndPassword(email: email, password: password);
}
