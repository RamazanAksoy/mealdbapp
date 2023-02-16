import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums/reques.dart';
import '../service/categories_service.dart';
import 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesState());

  final CategoriesService api = CategoriesService();

  Future<void> loadcategories() async {
    try {
      emit(state.copyWith(
        categoriesStatus: ApiRequest.requestInProgress,
      ));

      final response = (await api.getCategories()).data;

      emit(state.copyWith(
        categoriesStatus: ApiRequest.requestSuccess,
        categories: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        categoriesStatus: ApiRequest.requestFailure,
      ));
    }
  }
}
