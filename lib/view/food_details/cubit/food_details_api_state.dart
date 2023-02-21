import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

class FoodDetailsState {
  FoodDetailsState({
    this.foodDetails,
    this.foodDetailsStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest? foodDetailsStatus;
  //final Uri url = Uri.parse('${FoodDetailsState().foodDetails?.meals?[0].strYoutube}');

  FoodDetailsState copyWith({
    ResFoodDetails? foodDetails,
    ApiRequest? foodDetailsStatus,
    //Uri? url,
  }) =>
      FoodDetailsState(
        foodDetails: foodDetails ?? this.foodDetails,
        foodDetailsStatus: foodDetailsStatus ?? this.foodDetailsStatus,
      );
}
