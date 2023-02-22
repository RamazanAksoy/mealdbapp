import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test2_state.dart';

class Test2Cubit extends Cubit<Test2State> {
  Test2Cubit() : super(Test2Initial()) {
    loaded();
  }
  bool isLoading = false;
  int sayac = 0;

  Future<void> loaded() async {
    isLoading = false;
    emit(Test2Loading());
    await Future.delayed(Duration(seconds: 1));
    isLoading = true;
    emit(Test2Loading());
  }

  void sayacArttir() {
    sayac += 5;
    emit(Test2Count());
  }
}
