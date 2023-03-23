import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sample_state.dart';

class SampleCubit extends Cubit<SampleState> {
  //super(SampleInitial())これがstateに入っている。初期値をSampleInitialに設定
  SampleCubit() : super(SampleInitial());

  Future<void> sampleInitial() async {
    print('🐯sampleInitial Now !!');
    //emitでstateを更新
    emit(SampleInitial());
    print(state);
  }

  Future<void> sampleLoading() async {
    print('🐯sampleLoading Now !!');
    emit(SampleLoading());
    print(state);
  }

  Future<void> gawasa() async {
    print('🐯gawasa Now !!');
    emit(Gawasa());
    print(state);
  }
}
