part of 'sample_cubit.dart';

@immutable
//ここはcubitの状態を定義する
//ステートの状態によって処理を切り分けたりする
abstract class SampleState {}

class SampleInitial extends SampleState {}

class SampleLoading extends SampleState {}

//これみたいに名前はなんでもいい
class Gawasa extends SampleState {}
