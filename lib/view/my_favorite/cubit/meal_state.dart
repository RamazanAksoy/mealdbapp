part of 'meal_cubit.dart';

class MealState {
  MealState({this.foodDetails});
  final ResFoodDetails? foodDetails;

  MealState copyWith({ResFoodDetails? foodDetails}) {
    return MealState(
      foodDetails: foodDetails ?? this.foodDetails,
    );
  }
}
