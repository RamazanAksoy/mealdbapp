import 'package:bloc/bloc.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_api_state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/enums/reques.dart';

import '../service/food_details_service.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(int id) : super(FoodDetailsState()) {
    loadFoodDetails(id);
  }

  FoodDetailsService api = FoodDetailsService();

  Future<void> loadFoodDetails(int foodId) async {
    try {
      emit(FoodDetailsState(foodDetailsStatus: ApiRequest.requestInProgress));
      final response = (await api.getResFoodDetailsWithId(foodId))?.data;
      if (response?.meals != null) {
        emit(FoodDetailsState()
            .copyWith(foodDetails: response, foodDetailsStatus: ApiRequest.requestSuccess));
      } else {
        emit(FoodDetailsState().copyWith(foodDetailsStatus: ApiRequest.requestFailure));
      }
    } catch (e) {
      emit(FoodDetailsState().copyWith(foodDetailsStatus: ApiRequest.requestFailure));
    }
  }

  Future<void> urlLauncher(Uri url) async {
    final Uri url = Uri.parse('${FoodDetailsState().foodDetails?.meals?[0].strYoutube}');
    if (await launchUrl(url)) {
      throw 'Could not launch video';
    }
  }
}
