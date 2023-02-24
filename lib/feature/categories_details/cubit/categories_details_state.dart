

import '../../../core/constants/enums/reques.dart';
import '../model/res_category_details.dart';

class CategoriesDetailsState {
  CategoriesDetailsState({
    this.categoryDetails,
    this.categoryDetailsStatus = ApiRequest.unknown,
  });

  final ResCategoryDetails? categoryDetails;
  final ApiRequest categoryDetailsStatus;

  CategoriesDetailsState copyWith({
    ResCategoryDetails? categoryDetails,
    ApiRequest? categoryDetailsStatus,
  }) =>
      CategoriesDetailsState(
        categoryDetails: categoryDetails ?? this.categoryDetails,
        categoryDetailsStatus: categoryDetailsStatus ?? this.categoryDetailsStatus,
      );
}
