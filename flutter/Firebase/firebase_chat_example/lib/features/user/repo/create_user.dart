import '../domain/user_entity.dart';
import 'refs/user_refs.dart';

Future<void> createUser(UserEntity user) async {
  print('🐯 createUser Now !!!');
  await userDocRef(userId: user.userId).set(user);
}
