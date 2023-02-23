import 'package:mealdbapp/core/constants/enums/reques.dart';

import '../../home/model/random-food/res_food_details.dart';

class FoodDetailsState {
  FoodDetailsState({
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest? foodDetailsStatus;

  FoodDetailsState copyWith({
    ResFoodDetails? foodDetails,
    ApiRequest? foodDetailsStatus,
  }) =>
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus,
      );
}
