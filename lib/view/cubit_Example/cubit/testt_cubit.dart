import 'package:bloc/bloc.dart';
import 'package:mealdbapp/view/cubit_Example/cubit/testt_state.dart';
import 'package:meta/meta.dart';

class TesttCubit extends Cubit<TestState> {
  TesttCubit() : super(TestState()) {
    loaded();
  }

  Future<void> loaded() async {
    emit(state.copyWith(isLoading: false));
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(isLoading: true));
  }

  void sayacArttir() {
    emit(state.copyWith(sayac: state.sayac! + 5));
  }
}
