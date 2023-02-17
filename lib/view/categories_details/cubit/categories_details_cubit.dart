import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/reques.dart';
import '../service/categories_details_service.dart';
import 'categories_details_state.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategoriesDetailsCubit() : super(CategoriesDetailsState()) {
    loadcategoryDetails("Beef");
  }

  final CategoriesDetailsService api = CategoriesDetailsService();

  Future<void> loadcategoryDetails(String categoryName) async {
    try {
      emit(state.copyWith(
        categoryDetailsStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getResCategoryDetails(categoryName))?.data;

      emit(state.copyWith(
        categoryDetailsStatus: ApiRequest.requestSuccess,
        categoryDetails: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        categoryDetailsStatus: ApiRequest.requestFailure,
      ));
    }
  }
}
