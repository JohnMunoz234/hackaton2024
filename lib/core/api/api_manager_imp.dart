import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/core/api/api_manager.dart';
import 'package:hackaton_2024_mv/core/utils/cast.dart';

class ApiManagerImp extends ApiManager {
  final Dio dio;

  ApiManagerImp({
    required this.dio,
  });

  @override
  Future<Either<ApiError, ApiResponseMap>> get({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await dio.get(
        url,
        queryParameters: params,
        options: Options(headers: headers),
      );
      return Right(tryCast<Map<String, dynamic>>(response.data) ?? {});
    } on DioException catch (e) {
      return Left(
        ApiError(
          message: e.message ?? "",
          statusCode: e.response?.statusCode ?? 400,
        ),
      );
    }
  }

  @override
  Future<Either<ApiError, ApiResponseMap>> post({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return Right(tryCast<Map<String, dynamic>>(response.data) ?? {});
    } on DioException catch (e) {
      return Left(
        ApiError(
          message: e.message ?? e.error?.toString() ?? "",
          statusCode: e.response?.statusCode ?? 400,
        ),
      );
    }
  }

  @override
  Future<Either<ApiError, ApiResponseMap>> put({
    required String url,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await dio.put(
        url,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return Right(tryCast<Map<String, dynamic>>(response.data) ?? {});
    } on DioException catch (e) {
      return Left(
        ApiError(
          message: e.message ?? "",
          statusCode: e.response?.statusCode ?? 400,
        ),
      );
    }
  }
}
