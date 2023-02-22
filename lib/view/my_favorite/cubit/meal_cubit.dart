import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';

import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealState()) {
    init();
  }

  Future getLocalData() async {
    try {
      emit(state.copyWith(isLoading: false));
      LocaleManager localeManager = LocaleManager.instance;
      String? jsonString = localeManager.getStringValue('meals');

      ResFoodDetails dataRes =
          ResFoodDetails.fromJson(await jsonDecode(jsonString));

      emit(state.copyWith(foodDetails: dataRes, isLoading: true));
    } catch (e) {
      print(e);
    }
  }

  init() async {
    await getLocalData();
  }

  deleteValue(index) async {
    try {
      LocaleManager localeManager = LocaleManager.instance;
      String? jsonString = localeManager.getStringValue('meals');

      Map<String, dynamic> map = await jsonDecode(jsonString);
      List list = [];
      map.entries.map((e) => list.add({e.key: e.value})).toList();
      list[0]['meals'].removeAt(index);
      localeManager.setStringValue('meals', jsonEncode(list[0]));
      getLocalData();
    } catch (e) {
      print(e);
    }
  }
}
