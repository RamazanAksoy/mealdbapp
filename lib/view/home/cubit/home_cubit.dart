import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/reques.dart';
import '../service/home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadfoodDetails();
  }

  final HomeService apiHome = HomeService();

  Future<void> loadfoodDetails() async {
    try {
      emit(state.copyWith(
        homeStatus: ApiRequest.requestInProgress,
      ));

      final responseRandomFood = (await apiHome.getRandomFood())?.data;
      final responsePopulerItems = (await apiHome.getPopulerItems())?.data;
      final responseCategories = (await apiHome.getCategories())?.data;

      emit(state.copyWith(
        homeStatus: ApiRequest.requestSuccess,
        foodDetails: responseRandomFood,
        populerItems: responsePopulerItems,
        categories: responseCategories,
      ));
    } catch (e) {
      emit(state.copyWith(
        homeStatus: ApiRequest.requestFailure,
      ));
    }
  }
}
