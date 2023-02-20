import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meal_state.dart';


class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    getLocalData();
  }

  Future<void> getLocalData() async {
    state.isLoading = false;
    LocaleManager localeManager = LocaleManager.instance;
    String? jsonString = localeManager.getStringValue('meals');

    Map<String, dynamic> data = await jsonDecode(jsonString);
    print(data);
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
