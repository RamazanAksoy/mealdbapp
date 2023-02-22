import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mealdbapp/core/constants/themes/colors.dart';
import 'package:mealdbapp/utils/text_styles.dart';
import 'package:mealdbapp/view/food_details/cubit/food_details_api_state.dart';
import 'package:mealdbapp/view/my_favorite/model/res_food_details.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/enums/reques.dart';

import '../service/food_details_service.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(int id) : super(FoodDetailsState()) {
    loadFoodDetails(id);
  }

  FoodDetailsService api = FoodDetailsService();

  Future<void> loadFoodDetails(int foodId) async {
    try {
      emit(FoodDetailsState(foodDetailsStatus: ApiRequest.requestInProgress));
      final response = (await api.getResFoodDetailsWithId(foodId))?.data;
      if (response?.meals != null) {
        emit(FoodDetailsState().copyWith(
            foodDetails: response,
            foodDetailsStatus: ApiRequest.requestSuccess));
      } else {
        emit(FoodDetailsState()
            .copyWith(foodDetailsStatus: ApiRequest.requestFailure));
      }
    } catch (e) {
      emit(FoodDetailsState()
          .copyWith(foodDetailsStatus: ApiRequest.requestFailure));
    }
  }
  /* Future<void> urlLauncher(Uri url) async {
    final Uri url = Uri.parse('${FoodDetailsState().foodDetails?.meals?[0].strYoutube}');
    if (await launchUrl(url)) {
      emit(FoodDetailsState());
      
    }else{
      return print("Error");
    }
  } */

/*   Future<void> urlLauncher() async {
    //final Uri url = Uri.parse('${FoodDetailsState().foodDetails?.meals?[0].strYoutube}'); çalışmayan nul değer alan
    final Uri url = Uri.parse('${state.foodDetails?.meals?[0].strYoutube}');
    print(url);
    try {
      await launchUrl(url);
    } catch (e) {
      SizedBox(
        height: 100.h,
        width: 100.w,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.close,
                color: AppColors.red,
                size: 2.h,
              ),
              Text(
                "This meal doesnt have a tutorial video",
                style: Styles.normalBoldFontStyle(),
              )
            ],
          ),
        ),
      );
    }
  } */

  Future<void> urlLauncher(String? url) async {
    //final Uri url2 = Uri.parse('${FoodDetailsState().foodDetails?.meals?[0].strYoutube}');
    final Uri url2 = Uri.parse(url ?? "");
    print(url);
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
      //throw 'Could not launch video';
    }
    /* if (await launchUrl(url)) {
      throw 'Could not launch video';
    } */
  }
}
