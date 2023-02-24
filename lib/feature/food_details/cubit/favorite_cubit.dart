import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/init/cache/locale_manager.dart';
import '../../home/model/random-food/meals.dart';
import '../service/food_details_service.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(int id) : super(FavoriteState()) {
    favoriCheck(id);
  }

  LocaleManager localeManager = LocaleManager.instance;
  FavSharedRepository favSharedRepository = FavSharedRepository();

  favoriCheck(int id) {
    bool favorite = false;
    List<Meals>? mealsListShared = favSharedRepository.favouriteState();
    if (mealsListShared != null) {
      for (var i = 0; i < mealsListShared.length; i++) {
        if (int.parse(mealsListShared[i].idMeal ?? '0') == id) {
          favorite = true;
          break;
        } else {
          favorite = false;
        }
      }
    }
    emit(state.copyWith(isFavorite: favorite));
  }

  Future favoriButtonClick(int id, Meals? meals) async {
    List<Meals>? mealsListShared = favSharedRepository.favouriteState();
    if (mealsListShared != null) {
      for (var i = 0; i < mealsListShared.length; i++) {
        if (int.parse(mealsListShared[i].idMeal ?? '0') == id) {
          state.copyWith(isFavorite: true);
          break;
        } else {
          state.copyWith(isFavorite: false);
        }
      }
    }

    if (state.isFavorite == true) {
      mealsListShared?.removeWhere((element) => int.parse(element.idMeal ?? '0') == id);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(state.copyWith(meals: mealsListShared, isFavorite: false));
    } else {
      mealsListShared?.add(meals ?? Meals());
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(state.copyWith(meals: mealsListShared, isFavorite: true));
    }
  }
}
