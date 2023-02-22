import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealdbapp/core/constants/themes/colors.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/food_details/service/food_details_service.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';
import 'package:meta/meta.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

part 'meal_fav_ex_state.dart';

class MealFavExCubit extends Cubit<MealFavExState> {
  MealFavExCubit(int id) : super(MealFavExInitial()) {
    favoriCheck(id);
    loadFoodDetails(id);
  }

  LocaleManager localeManager = LocaleManager.instance;
  FavSharedRepository favSharedRepository = FavSharedRepository();
  ResFoodDetails? resFoodDetails;
  FoodDetailsService api = FoodDetailsService();
  bool isLoaded = true;
  bool isFavButton = true;

  void errorCheck() {
    isLoaded = !isLoaded;
    emit(MealFavExErrorWidgetState());
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
            Text("There is no tutorial video")
          ],
        ),
      );
    }
  }

  //Yemek id'sinin api'dan doğru gelip gelmediğini kontrol eder.
  Future<void> loadFoodDetails(int foodId) async {
    try {
      resFoodDetails = (await api.getResFoodDetailsWithId(foodId))!.data;
      emit(MealFavExService());
      errorCheck();
    } catch (e) {
      print("Loading Error");
    }
  }

  //favori tuşunun shared da verisinin bulunup bulunmadığını kontrol edden fonk.
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
    isFavButton = favorite;
    emit(MealFavExButtonControlState());
  }

  //favori tuşunun shareddan kontrol edip yoksa liste içine ekler. Varsa içinden silen fonk
  Future favoriButtonClick(int id, Meals? meals) async {
    List<Meals>? mealsListShared = favSharedRepository.favouriteState();
    if (mealsListShared != null) {
      for (var i = 0; i < mealsListShared!.length; i++) {
        if (int.parse(mealsListShared[i].idMeal ?? '0') == id) {
          isFavButton = true;
          break;
        } else {
          isFavButton = false;
        }
      }
    }
    if (isFavButton == true) {
      mealsListShared
          ?.removeWhere((element) => int.parse(element.idMeal ?? '0') == id);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      isFavButton = false;
      emit(MealFavExButtonControlState());
    } else {
      mealsListShared?.add(meals ?? Meals());
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      isFavButton = true;
      emit(MealFavExButtonControlState());
    }
  }
}
