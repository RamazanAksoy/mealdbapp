import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

import '../../../core/constants/enums/reques.dart';

class FoodDetailsState {
  FoodDetailsState({
    required this.meals,
    this.isFavorite = false,
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest? foodDetailsStatus;
  final List<Meals>? meals;
  final bool? isFavorite;

  FoodDetailsState copyWith(
          {ResFoodDetails? foodDetails,
          ApiRequest? foodDetailsStatus,
          bool? isFavorite,
          List<Meals>? meals}) =>
          
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus,
        meals: meals ?? this.meals,
        isFavorite: isFavorite ?? this.isFavorite,
      );
}
