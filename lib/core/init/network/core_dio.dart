import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/IResponseModel.dart';
import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_request_enum.dart';
import '../../extension/network_exntension.dart';
import 'ICoreDio.dart';
import 'no_network.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDioNullSafety {
  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  final BaseOptions options;

  @override
  Future<IResponseModel<R>> send<R, T>(
    String path, {
    required HttpTypes type,
    required BaseModel<T> parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: type.rawValue,
        ),
      );
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
          final model = _responseParser<R, T>(parseModel, response.data);
          return ResponseModel<R>(data: model);
        default:
          return ResponseModel(error: BaseError(message: response.data['Message'].toString()));
      }
    } on DioError catch (e) {
      return handleNetworkError(path, parseModel: parseModel, type: type, e: e);
    }
  }
}
