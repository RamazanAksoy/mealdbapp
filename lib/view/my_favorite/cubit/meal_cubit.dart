import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meal_state.dart';

final meals = {
  "meals": [
    {
      "idMeal": "52772",
      "strMeal": "Teriyaki Chicken Casserole",
      "strDrinkAlternate": "sa",
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray....",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    },
    {
      "idMeal": "52772",
      "strMeal": "Teriyaki Chicken Casserole",
      "strDrinkAlternate": "sa",
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray....",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    },{
      "idMeal": "52772",
      "strMeal": "Teriyaki Chicken Casserole",
      "strDrinkAlternate": "sa",
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray....",
      "strMealThumb":
          "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    }
  ]
};
  saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('meals', json.encode(meals));
    print("saveData");
  }


class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    getLocalData();
    // saveData();
  }

  Future<void> getLocalData() async {
    state.isLoading = false;
    LocaleManager localeManager = LocaleManager.instance;
    String? jsonString = localeManager.getStringValue('meals');

    ResFoodDetails dataRes =
        ResFoodDetails.fromJson(await jsonDecode(jsonString));

    print(dataRes.meals);

    if (dataRes.meals!.isNotEmpty) {
      emit(state.copyWith(foodDetails: dataRes));
      print(state.isLoading);

      print(dataRes.meals!.length);
    } else {
      print("boş");
    }
    state.isLoading = true;
  }
}
