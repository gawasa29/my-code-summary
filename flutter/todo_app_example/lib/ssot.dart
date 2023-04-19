import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_example/todo.dart';

//これがSSOT、すべてこのProviderを参照しているからSSOT原則にしたがっている。
//（Firestoreの場合は、FirebaseFirestore.instance自体が SSOT とみなせるので、このように必ずしも同じProvider参照せずともいいです。）
final todoRefProvider = Provider<CollectionReference<Todo>>(
  //withConverterはエンコード/デコード時に型を明示して
  //コレクションやドキュメントをtype-safe((データ型の食い違いによって起こるエラーを防ぐ仕組み）)
  //に扱えるようにするメソッドです。
  //簡単にいうと出てくる型と出力する型を決めておける。
  (ref) => FirebaseFirestore.instance.collection('Todos').withConverter(
        fromFirestore: (snapshot, options) => Todo.fromJson(snapshot.data()!),
        toFirestore: (todo, options) => todo.toJson(),
      ),
);
