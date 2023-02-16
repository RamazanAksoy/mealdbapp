import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';
import '../model/res_categories.dart';

class CategoriesService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<ResCategories>?> getCategories() async {
    final response = await networkManager?.send<ResCategories, ResCategories>(
      EndPoints.getCategories,
      parseModel: ResCategories(),
      type: HttpTypes.GET,
    );
    return response;
  }
}
