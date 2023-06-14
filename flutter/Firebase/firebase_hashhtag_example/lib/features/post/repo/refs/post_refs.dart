import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_hashhtag_example/features/post/domain/hashtag_entity.dart';
import 'package:firebase_hashhtag_example/features/post/domain/post_entity.dart';

final CollectionReference<PostEntity> postsRef =
    FirebaseFirestore.instance.collection('posts').withConverter(
          fromFirestore: (snapshot, _) => PostEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// Post ドキュメントの参照。
DocumentReference<PostEntity> postDocRef() => postsRef.doc();

final CollectionReference<HashtagEntity> hashtagsRef =
    FirebaseFirestore.instance.collection('hashtag').withConverter(
          fromFirestore: (snapshot, _) =>
              HashtagEntity.fromJson(snapshot.data()!),
          toFirestore: (data, _) => data.toJson(),
        );

/// Post ドキュメントの参照。
DocumentReference<HashtagEntity> hashtagDocRef() => hashtagsRef.doc();
