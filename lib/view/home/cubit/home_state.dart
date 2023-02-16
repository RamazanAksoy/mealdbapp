// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../core/constants/enums/reques.dart';
import '../model/categories/res_categories.dart';
import '../model/populer-items/res_populer_items.dart';
import '../model/random-food/res_food_details.dart';

class HomeState {
  const HomeState({
    this.categories,
    this.populerItems,
    this.foodDetails,
    this.homeStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? foodDetails;
  final ApiRequest homeStatus;
  final ResPopulerItems? populerItems;
  final ResCategories? categories;

  HomeState copyWith({
    ResFoodDetails? foodDetails,
    ApiRequest? homeStatus,
    Set<int>? cartIds,
    ResPopulerItems? populerItems,
    ResCategories? categories,
  }) {
    return HomeState(
      foodDetails: foodDetails ?? this.foodDetails,
      homeStatus: homeStatus ?? this.homeStatus,
      populerItems: populerItems ?? this.populerItems,
      categories: categories ?? this.categories,
    );
  }
}
