part of 'meal_cubit.dart';

class MealState {
  MealState({this.foodDetails,this.isLoading=false});
  final ResFoodDetails? foodDetails;
  
   bool? isLoading ;


  MealState copyWith({ResFoodDetails? foodDetails,isLoading}) {
    return MealState(
      foodDetails: foodDetails ?? this.foodDetails,
      isLoading: isLoading??this.isLoading
      
      
      
    );
  }

  

  
}


