
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

import '../../../core/constants/enums/reques.dart';


class FoodDetailsState {
  FoodDetailsState({
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest foodDetailsStatus;

  set isFavorite(bool isFavorite) {}

  FoodDetailsState copyWith({
    ResFoodDetails? foodDetails,
    ApiRequest? foodDetailsStatus,
  }) =>
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus,
      );
}
