import 'dart:convert';

import 'package:mealdbapp/core/init/cache/locale_manager.dart';
import 'package:mealdbapp/view/home/model/random-food/meals.dart';

import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';

import '../../home/model/random-food/res_food_details.dart';

class FoodDetailsService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResFoodDetails>?> getResFoodDetailsWithId(int foodid) async {
    final response = await networkManager?.send<ResFoodDetails, ResFoodDetails>(
      EndPoints.getFoodDetailsWithId,
      parseModel: ResFoodDetails(),
      queryParameters: {"i": foodid},
      type: HttpTypes.GET,
    );
    return response;
  }
}

class FavSharedRepository {
  LocaleManager localeManager = LocaleManager.instance;

  List<Meals>? favouriteState() {
    List<Meals>? mealsListShared = List.empty(growable: true);
    if (
        localeManager.getStringValue('fav') != '' &&
        localeManager.getStringValue('fav') != null &&
        localeManager.getStringValue('fav') != 'null'
        ) {
      List<dynamic> res = jsonDecode(localeManager.getStringValue('fav'));
      mealsListShared = res.map((e) => Meals.fromJson(e)).toList();
      print(mealsListShared?.length.toString());
    }
    return mealsListShared;
  }
}
