import 'package:mealdbapp/feature/pagination/model/res_user_data.dart';

import '../../../core/base/model/IResponseModel.dart';
import '../../../core/constants/endpoints/end_points.dart';
import '../../../core/constants/enums/http_request_enum.dart';
import '../../../core/init/network/ICoreDio.dart';
import '../../../core/init/network/network_manager.dart';

class PaginationService {
  ICoreDioNullSafety? networkManager = NetworkManager.instance!.coreDio;

  Future<IResponseModel<List<ResUserData>>?> getUserData(int page) async {
    final response = await networkManager?.send<List<ResUserData>, ResUserData>(
        EndPoints.getUserData,
        parseModel: ResUserData(),
        type: HttpTypes.GET,
        queryParameters: {"page": page, "limit": 10});
    return response;
  }
}
