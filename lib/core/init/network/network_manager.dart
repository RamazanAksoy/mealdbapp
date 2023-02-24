import 'package:dio/dio.dart';
import '../../constants/endpoints/end_points.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDioNullSafety? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      headers: {},
      baseUrl: EndPoints.baseUrl,
    );

    coreDio = CoreDio(baseOptions);
  }
}
