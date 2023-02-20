import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meal_state.dart';

final meals = {
  "meals": [
    {
      "idMeal": "52772",
      "strMeal": "Yemek 1",
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
      "strMeal": "Yemek 2",
      "strDrinkAlternate": "sa",
      "strCategory": "Chicken",
      "strArea": "Japanese",
      "strInstructions":
          "Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray....",
      "strMealThumb":
          "https://i0.wp.com/lezzetlifoto.com/wp-content/uploads/2019/10/adanadayim_03.jpg?ssl=1"
    },{
      "idMeal": "52772",
      "strMeal": "Yemek 3",
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
  saveData(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('meals', json.encode(value));
    print("saveData");
  }

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    getLocalData();
    saveData(meals);
  }

  Future<void> getLocalData() async {
    print("getLocalData start");
    

    try {state.isLoading = false;
    LocaleManager localeManager = LocaleManager.instance;
    String? jsonString = localeManager.getStringValue('meals');
print("${jsonString.length} getlocaldata length");
    ResFoodDetails dataRes =
        ResFoodDetails.fromJson(await jsonDecode(jsonString));
      if (dataRes.meals!.isNotEmpty) {
        emit(state.copyWith(foodDetails: dataRes));
      } else {
        print("boş");
      }
      state.isLoading = true;
    } catch (e) {
      print(e);
    }
  }

  deleteValue(index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? jsonString = preferences.getString('meals');
    Map<String, dynamic> map = await jsonDecode(jsonString!);
    List<Map<String, dynamic>> list = [];
    map.entries.map((e) => list.add({e.key:e.value})).toList();
     print(list.length);
    // list[0]['meals'].removeAt(0);
    print(list.length);
Map<String, dynamic> mealMap = { for (var meal in list[0]["meals"])toString() : meal };
preferences.reload();



    saveData(mealMap);
    


  
  print(list);



    
 


   
    print("value deleted!");
  }
}
