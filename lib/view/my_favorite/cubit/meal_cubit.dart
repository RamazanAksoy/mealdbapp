import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';

import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';

import '../../food_details/service/food_details_service.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    init();
  }
  FavSharedRepository favSharedRepository = FavSharedRepository();
  LocaleManager localeManager = LocaleManager.instance;

  Future getLocalData() async {
    try {
      emit(state.copyWith(isLoading: false));
      List<Meals>? mealsListShared = favSharedRepository.favouriteState();

      emit(state.copyWith(foodDetails: mealsListShared, isLoading: true));
    } catch (e) {
      print(e);
    }
  }

  init() async {
    await getLocalData();
  }

  deleteValue(int index) async {
    try {
      List<Meals>? mealsListShared = favSharedRepository.favouriteState();

      mealsListShared?.removeWhere((element) => int.parse(element.idMeal ?? '0') == index);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));

      getLocalData();
    } catch (e) {
      print(e);
    }
  }
}
