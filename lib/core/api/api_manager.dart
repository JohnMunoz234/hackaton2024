import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';

typedef ApiResponseMap = Map<String, dynamic>;

abstract class ApiManager {
  const ApiManager();

  Future<Either<ApiError, ApiResponseMap>> get({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  });

  Future<Either<ApiError, ApiResponseMap>> post({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });

  Future<Either<ApiError, ApiResponseMap>> put({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  });
}
