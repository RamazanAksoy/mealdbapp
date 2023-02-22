import 'package:mealdbapp/view/home_example/model/categories/res_categories.dart';

import '../../../../core/base/model/IResponseModel.dart';
import '../../../../core/constants/endpoints/end_points.dart';
import '../../../../core/constants/enums/http_request_enum.dart';
import '../../../../core/init/network/ICoreDio.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../categories/model/res_categories.dart';

import '../../../home/model/populer-items/res_populer_items.dart';
import '../../../home/model/random-food/res_food_details.dart';

class ExHomeService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResFoodDetails>?> getRandomFood() async {
    final response = await networkManager?.send<ResFoodDetails, ResFoodDetails>(
      EndPoints.getRandom,
      parseModel: ResFoodDetails(),
      type: HttpTypes.GET,
    );
    return response;
  }

  Future<IResponseModel<ResPopulerItems>?> getPopulerItems() async {
    final response =
        await networkManager?.send<ResPopulerItems, ResPopulerItems>(
      EndPoints.getPopulerItems,
      parseModel: ResPopulerItems(),
      type: HttpTypes.GET,
    );
    return response;
  }

  Future<IResponseModel<ExResCategories>?> getCategories() async {
    final response = await networkManager?.send<ExResCategories, ExResCategories>(
      EndPoints.getCategories,
      parseModel: ExResCategories(),
      type: HttpTypes.GET,
    );
    return response;
  }
}
