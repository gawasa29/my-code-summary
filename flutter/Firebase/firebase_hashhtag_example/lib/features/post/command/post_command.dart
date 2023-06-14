import 'dart:async';

import 'package:firebase_hashhtag_example/common/create_name_option.dart';
import 'package:firebase_hashhtag_example/features/post/domain/hashtag_entity.dart';
import 'package:firebase_hashhtag_example/features/post/domain/post_entity.dart';
import 'package:firebase_hashhtag_example/features/post/repo/create_hashtag.dart';
import 'package:firebase_hashhtag_example/features/post/repo/create_post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postAsyncNotifierCommand = AsyncNotifierProvider<PostCommand, void>(() {
  return PostCommand();
});

class PostCommand extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // commandなので必ずvoid型でなければならない。
  }
  Future<void> createPostEvent({
    required String content,
    required String hashtag,
  }) async {
    final post = PostEntity(
      postId: '',
      content: content,
      postUserId: '',
      hashtag: hashtag,
    );
    if (hashtag != '') {
      final hashtagOption = await createNameOption(hashtag);
      final hashtagEntity = HashtagEntity(
        hashtagName: hashtag,
        hashtagOption: hashtagOption,
      );
      state = const AsyncLoading();

      state = await AsyncValue.guard(() async {
        return await createHashtag(hashtagEntity);
      });
    }
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return await createPost(post);
    });
    if (!state.isLoading && !state.hasError) {
      print('🐯 新しいポストを作成しました !!!');
    }
  }
}
