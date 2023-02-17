import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

import '../../../core/constants/enums/reques.dart';

class SearchState {
  SearchState({
    this.search,
    this.searchStatus = ApiRequest.unknown,
  });

  final ResFoodDetails? search;
  final ApiRequest searchStatus;

  SearchState copyWith({
    ResFoodDetails? search,
    ApiRequest? searchStatus,
  }) =>
      SearchState(
        search: search ?? this.search,
        searchStatus: searchStatus ?? this.searchStatus,
      );
}
