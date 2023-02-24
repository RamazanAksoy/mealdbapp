import 'package:mealdbapp/core/base/model/IResponseModel.dart';
import 'package:mealdbapp/core/constants/endpoints/end_points.dart';
import 'package:mealdbapp/core/constants/enums/http_request_enum.dart';
import 'package:mealdbapp/view/pagination/model/data_model.dart';

import '../../../../core/init/network/ICoreDio.dart';
import '../../../../core/init/network/network_manager.dart';

class PaginationService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance?.coreDio;

  Future<IResponseModel<List<UserData>>?> getUserDataService(int page) async {
    final response = await networkManager?.send<List<UserData>, UserData>(
        EndPoints.getUserData,
        parseModel: UserData(),
        type: HttpTypes.GET,
        queryParameters: {"page": page, "limit": 10});
    return response;
  }
}
