
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';

import '../service/food_details_service.dart';
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit() : super(FoodDetailsState()){
    loadFoodDetails(999999999);
  }

  final FoodDetailsService api = FoodDetailsService();

  Future<void> loadFoodDetails(int foodId) async {
    try {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getResFoodDetailsWithId(foodId))?.data;
      print(response);
      if (response?.meals != null) {
        emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestSuccess,
        foodDetails: response,
      ));
      }
      else{emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestFailure,
      ));}
      
      
    } catch (e) {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestFailure,
      ));
    }
  }
}
