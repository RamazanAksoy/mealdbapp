part of 'food_details_cubit.dart';

@immutable
abstract class FoodDetailsState {}

class FoodDetailsInitial extends FoodDetailsState {}

class FoodPostLoading extends FoodDetailsState {}

class FoodPostSucces extends FoodDetailsState {}

class FoodPostFavori extends FoodDetailsState {}
