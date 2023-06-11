import 'package:firebase_auth_example/features/auth/repo/refs/auth_refs.dart';

Future<void> deleteAuth() async {
  print('🐯 deleteAuth Now !!!');
  await authRef.currentUser!.delete();
  await authRef.signOut();
}
