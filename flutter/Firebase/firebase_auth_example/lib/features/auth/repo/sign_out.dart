import 'refs/auth_refs.dart';

Future<void> signOut() async {
  print('🐯 signOut Now !!!');
  await authRef.signOut();
}
