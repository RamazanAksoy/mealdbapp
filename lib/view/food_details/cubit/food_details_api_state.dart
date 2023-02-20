// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

class FoodDetailsState {
  FoodDetailsState({
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest? foodDetailsStatus;

  FoodDetailsState copyWith(
          {ResFoodDetails? foodDetails,
          ApiRequest? foodDetailsStatus,
          bool? isFavorite,
          List<Meals>? meals}) =>
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus,
      );
}
