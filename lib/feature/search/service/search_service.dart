import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../../home/model/random-food/res_food_details.dart';

class SearchService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResFoodDetails>?> getResCategoryDetails(String foodName) async {
    final response = await networkManager?.send<ResFoodDetails, ResFoodDetails>(
      EndPoints.getSearchFood,
      parseModel: ResFoodDetails(),
      queryParameters: {"s": foodName},
      type: HttpTypes.GET,
    );
    return response;
  }
}
