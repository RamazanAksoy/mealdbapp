part of 'meal_cubit.dart';

class MealState {
  MealState({this.foodDetails, this.isLoading = false});
  final List<Meals>? foodDetails;

  bool? isLoading;

  MealState copyWith({List<Meals>? foodDetails, isLoading}) {
    return MealState(
        foodDetails: foodDetails ?? this.foodDetails, isLoading: isLoading ?? this.isLoading);
  }
}
