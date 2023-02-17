

import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import 'package:mealdbapp/view/home/model/random-food/res_food_details.dart';

class FoodDetailsService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResFoodDetails>?> getResFoodDetailsWithId(int foodid) async {
    final response = await networkManager?.send<ResFoodDetails, ResFoodDetails>(
      EndPoints.getFoodDetailsWithId,
      parseModel: ResFoodDetails(),
      queryParameters: {"i": foodid},
      type: HttpTypes.GET,
    );
    print(response?.data?.meals.toString());
    return response;
  }
}
