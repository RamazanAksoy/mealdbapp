import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    getLocalData();
  }

  Future<void> getLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('meals');
    print(jsonString);
    // Map<String, dynamic> veri = jsonDecode(jsonString!);
    emit(state.copyWith(foodDetails: jsonDecode(jsonString!)));
  }
}

// Future<Map<String, dynamic>> getLocalData() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? jsonString = prefs.getString('meals');
//   Map<String, dynamic> veri = jsonDecode(jsonString!);
//   print(veri);
//   return veri; 
//final strMeal = veri['meals'][0]['strMeal'];
    // final strMealThumb = veri['meals'][0]['strMealThumb'];
// }
