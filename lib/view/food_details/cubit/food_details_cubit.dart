import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:url_launcher/url_launcher.dart';

import '../service/food_details_service.dart';
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(int id) : super(FoodDetailsState(meals: List.empty(),
   isFavorite: false
   )
      )
    {
    loadFoodDetails(id);
    favoriCheck(id);
  }

  FoodDetailsService api = FoodDetailsService();
  LocaleManager localeManager = LocaleManager.instance;
  FavSharedRepository favSharedRepository = FavSharedRepository();

  Future<void> loadFoodDetails(int foodId) async {
    try {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getResFoodDetailsWithId(foodId))?.data;
      if (response?.meals != null) {
        emit(state.copyWith(
          foodDetailsStatus: ApiRequest.requestSuccess,
          foodDetails: response,
        ));
      } else {
        emit(state.copyWith(
          foodDetailsStatus: ApiRequest.requestFailure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestFailure,
      ));
    }
  }

  Future<void> urlLauncher(Uri url) async {
    final Uri url = Uri.parse('${state.foodDetails?.meals?[0].strYoutube}');
    if (await launchUrl(url)) {
      throw 'Could not launch video';
    }
  }

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

  Future favoriButtonClick(int id) async {
    loadFoodDetails(id);
    List<Meals>? mealsListShared = favSharedRepository.favouriteState();
    if (mealsListShared != null) {
      for (var i = 0; i < mealsListShared!.length; i++) {
        if (int.parse(mealsListShared[i].idMeal ?? '0') == id) {
          state.copyWith(
            isFavorite: true
            );
          break;
        } else {
          state.copyWith(
            isFavorite: false
            );
        }
      }
    }

    if (state.isFavorite == true
    ) {
      mealsListShared?.removeLast();
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(state.copyWith(meals: mealsListShared, 
      isFavorite: false
      ));
    } else {
      mealsListShared?.add(state.foodDetails!.meals![0]);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(state.copyWith(meals: mealsListShared, 
      isFavorite: true
      ));
    }
  }
}
