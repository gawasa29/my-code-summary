import 'package:firebase_hashhtag_example/features/post/domain/post_entity.dart';
import 'package:firebase_hashhtag_example/features/post/repo/refs/post_refs.dart';

Future<void> createPost(PostEntity post) async {
  print('🐯 createPost Now !!!');

  await postDocRef().set(post);
}
