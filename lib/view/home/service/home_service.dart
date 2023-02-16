import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/categories/res_categories.dart';
import '../model/populer-items/res_populer_items.dart';
import '../model/random-food/res_food_details.dart';

class HomeService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResFoodDetails>> getRandomFood() async {
    final response = await networkManager!.send<ResFoodDetails, ResFoodDetails>(
      EndPoints.getRandom,
      parseModel: ResFoodDetails(),
      type: HttpTypes.GET,
    );
    return response;
  }

  Future<IResponseModel<ResPopulerItems>> getPopulerItems() async {
    final response = await networkManager!.send<ResPopulerItems, ResPopulerItems>(
      EndPoints.getPopulerItems,
      parseModel: ResPopulerItems(),
      type: HttpTypes.GET,
    );
    return response;
  }

  Future<IResponseModel<ResCategories>> getCategories() async {
    final response = await networkManager!.send<ResCategories, ResCategories>(
      EndPoints.getCategories,
      parseModel: ResCategories(),
      type: HttpTypes.GET,
    );
    return response;
  }
}
