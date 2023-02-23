// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../core/constants/enums/reques.dart';
import '../model/res_categories.dart';

class CategoriesState {
  CategoriesState({
    this.categories,
    this.categoriesStatus = ApiRequest.unknown,
  });

  final ResCategories? categories;
  final ApiRequest categoriesStatus;

  CategoriesState copyWith({
    ResCategories? categories,
    ApiRequest? categoriesStatus,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
    );
  }
}
