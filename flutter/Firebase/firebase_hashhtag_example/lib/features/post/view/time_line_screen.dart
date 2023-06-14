import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detectable_text_field/detectable_text_field.dart';
import 'package:detectable_text_field/detector/sample_regular_expressions.dart';
import 'package:firebase_hashhtag_example/features/post/domain/post_entity.dart';
import 'package:firebase_hashhtag_example/features/post/repo/refs/post_refs.dart';
import 'package:firebase_hashhtag_example/features/post/view/add_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

class TimeLineScreen extends StatelessWidget {
  const TimeLineScreen({super.key});
  static const routeName = 'TimeLine';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FirestoreListView(
        query: postsRef.orderBy('createdAt', descending: true),
        errorBuilder: (context, error, stackTrace) =>
            Center(child: Text(error.toString())),
        loadingBuilder: (context) =>
            const Center(child: CircularProgressIndicator()),
        itemBuilder:
            (BuildContext context, QueryDocumentSnapshot<PostEntity> doc) {
          final post = doc.data();
          return DetectableText(
            trimLines: 1,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'more',
            trimExpandedText: '...less',
            text: post.content,
            detectionRegExp: RegExp(
              '(?!\\n)(?:^|\\s)([#@]([$detectionContentLetters]+))|$urlRegexContent',
              multiLine: true,
            ),
            callback: (bool readMore) {
              print('Read more >>>>>>> $readMore');
            },
            onTap: (tappedText) async {
              print(tappedText);
              if (tappedText.startsWith('#')) {
                print('DetectableText >>>>>>> # $tappedText');
              } else if (tappedText.startsWith('@')) {
                print('DetectableText >>>>>>> @');
              } else if (tappedText.startsWith('http')) {
                print('DetectableText >>>>>>> http');
              }
            },
            basicStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            detectedStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
              color: Colors.blueAccent,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.edit,
        ),
        onPressed: () {
          context.goNamed(AddPostScreen.routeName);
        },
      ),
    );
  }
}
