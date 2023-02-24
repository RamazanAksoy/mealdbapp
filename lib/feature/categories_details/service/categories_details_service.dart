

import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/res_category_details.dart';

class CategoriesDetailsService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResCategoryDetails>?> getResCategoryDetails(String categoryName) async {
    final response = await networkManager?.send<ResCategoryDetails, ResCategoryDetails>(
      EndPoints.getCategoriesDetails,
      parseModel: ResCategoryDetails(),
      queryParameters: {"c": categoryName},
      type: HttpTypes.GET,
    );
    return response;
  }
}
