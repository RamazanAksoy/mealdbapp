import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealdbapp/core/constants/enums/reques.dart';
import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/model/random-food/meals.dart';
import '../service/food_details_service.dart';
import 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit(this.mealsListShared,this.localeManager, this.favSharedRepository) : super(FoodDetailsState(meals: List.empty(),id: 0,isFavorite: false)) {
    loadFoodDetails(52772);
}

  List<Meals>? mealsListShared = [Meals()];
  final FoodDetailsService api = FoodDetailsService();
  LocaleManager localeManager = LocaleManager.instance;
  final FavSharedRepository favSharedRepository;
  
  Future<void> loadFoodDetails(int foodId) async {
    try {
      emit(state.copyWith(
        foodDetailsStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getResFoodDetailsWithId(foodId))?.data;
      print(response);
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

  Future<void> urlLauncher(Uri url) async{
    final Uri url = Uri.parse('${state.foodDetails?.meals?[0].strYoutube}');
    if (await launchUrl(url)) {
      throw 'Could not launch video';
      
    }
  }

  Future fav() async{
    final response = await favSharedRepository.favouriteState();
    emit(FoodDetailsState(meals: response,id: 57772,isFavorite: false));
    
  }
  Future fav2(bool isFavorite,int id) async{
        final response = await favSharedRepository.favouriteState();

    for (var i = 0; i < mealsListShared!.length; i++) {
      if (int.parse(mealsListShared?[i].idMeal ?? '0') == id) {
      emit(FoodDetailsState(meals: response,id: 57772,isFavorite: true));
        break;
      } else {
      emit(FoodDetailsState(meals: response,id: 57772,isFavorite: false));
      }
    }

    if (isFavorite = true) {
      mealsListShared?.removeLast();
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(FoodDetailsState(meals: response,id: 57772,isFavorite: false));
    }else {
      mealsListShared?.add(state.foodDetails!.meals![0]);
      localeManager.setStringValue('fav', jsonEncode(mealsListShared));
      emit(FoodDetailsState(meals: response,id: 57772,isFavorite: true));
    }
        

  }
  
    }
