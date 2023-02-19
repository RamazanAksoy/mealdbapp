
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

import '../../../core/constants/enums/reques.dart';
import '../model/random-food/meals.dart';
import '../service/food_details_service.dart';


class FoodDetailsState {
  FoodDetailsState(
      {
    required this.id,
    required this.meals,
    required this.isFavorite,
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest foodDetailsStatus;
  final List<Meals> meals;
  int id;
  FavSharedRepository favSharedRepository = FavSharedRepository();
  bool isFavorite;
  //set isFavorite(bool isFavorite) {}

  FoodDetailsState copyWith({
    ResFoodDetails? foodDetails,
    ApiRequest? foodDetailsStatus,
  }) =>
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus, 
        meals: meals,
        id: 52772, 
        isFavorite: false,
        
      );
}

