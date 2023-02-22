import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../categories/model/res_categories.dart';
import '../../categories/service/categories_service.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial()) {
    loadcategories();
  }

  bool isLoading = true;
  ResCategories? resCategories;

  void changeLoading() {
    isLoading = !isLoading;
    emit(CategoryLoading());
  }

  final CategoriesService api = CategoriesService();

  Future<void> loadcategories() async {
    changeLoading();
    resCategories = (await api.getCategories())?.data;
    changeLoading();
    emit(Categoryervice());
  }
}
