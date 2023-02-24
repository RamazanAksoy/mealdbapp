import '../../../core/constants/enums/reques.dart';
import '../../home/model/random-food/res_food_details.dart';

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
