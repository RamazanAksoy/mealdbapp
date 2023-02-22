import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/themes/colors.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../home/model/random-food/res_food_details.dart';
import '../service/food_details_service.dart';

part 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(int id) : super(FoodDetailsInitial()) {
    loadFoodDetails(id);
    favoriCheck(id);
  }

  bool isLoading = true;
  bool isFavorite = true;
  ResFoodDetails? resFoodDetails;
  FoodDetailsService api = FoodDetailsService();
  LocaleManager localeManager = LocaleManager.instance;
  FavSharedRepository favSharedRepository = FavSharedRepository();

  void changeLoading() {
    isLoading = !isLoading;
    emit(FoodPostLoading());
  }

  Future<void> loadFoodDetails(int foodId) async {
    try {
      changeLoading();
      resFoodDetails = (await api.getResFoodDetailsWithId(foodId))?.data;
      emit(FoodPostSucces());
      changeLoading();
    } catch (e) {}
  }

  Future<void> urlLauncher(String? url) async {
    final Uri url2 = Uri.parse(url ?? "");
    try {
      await launchUrl(url2);
    } catch (e) {
      throw SizedBox(
        height: 100.h,
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.close,
              color: AppColors.red,
              size: 2.h,
            ),
            Text("There is no you")
          ],
        ),
      );
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
    isFavorite = favorite;
    emit(FoodPostFavori());
  }

  Future favoriButtonClick(int id, Meals? meals) async {
    List<Meals>? mealsListShared = favSharedRepository.favouriteState();
    if (mealsListShared != null) {
      for (var i = 0; i < mealsListShared!.length; i++) {
        if (int.parse(mealsListShared[i].idMeal ?? '0') == id) {
          isFavorite = true;
          break;
        } else {
          isFavorite = false;
        }
      }
    }

    if (isFavorite == true) {
      mealsListShared?.removeWhere((element) => int.parse(element.idMeal ?? '0') == id);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));

      isFavorite = false;
      emit(FoodPostFavori());
    } else {
      mealsListShared?.add(meals ?? Meals());
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      isFavorite = true;
      emit(FoodPostFavori());
    }
  }
}
