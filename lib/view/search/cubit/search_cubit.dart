import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/reques.dart';
import '../service/search_service.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  final SearchService api = SearchService();

  Future<void> loadsearch(String foodName) async {
    try {
      emit(state.copyWith(
        searchStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getResCategoryDetails(foodName))?.data;

      emit(state.copyWith(
        searchStatus: ApiRequest.requestSuccess,
        search: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        searchStatus: ApiRequest.requestFailure,
      ));
    }
  }
}
