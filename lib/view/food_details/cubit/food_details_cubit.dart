import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/food_details_service.dart';
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit() : super(FoodDetailsState()) {
    loadFoodDetails(52772);
   
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
      } else {
        emit(state.copyWith(
          foodDetailsStatus: ApiRequest.requestFailure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestFailure,
      ));
    }
  }

  Future<void> urlLauncher(Uri url) async{
    final Uri url = Uri.parse('${state.foodDetails?.meals?[0].strYoutube}');
    final Uri url2 =
      Uri.parse("https://www.youtube.com/watch?v=4aZr5hZXP_s");
    if (await launchUrl(url)) {
      throw 'Could not launch video';
      
    }
  }
  
}
