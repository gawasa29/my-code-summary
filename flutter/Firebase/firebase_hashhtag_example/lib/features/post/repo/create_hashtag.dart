import 'package:firebase_hashhtag_example/features/post/domain/hashtag_entity.dart';
import 'package:firebase_hashhtag_example/features/post/repo/refs/post_refs.dart';

Future<void> createHashtag(HashtagEntity hashtag) async {
  print('🐯 createHashtag Now !!!');

  await hashtagDocRef().set(hashtag);
}
