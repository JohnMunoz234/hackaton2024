import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/core/api/api_manager.dart';
import 'package:hackaton_2024_mv/core/api/api_response.dart';
import 'package:hackaton_2024_mv/core/utils/cast.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/data_source/login_remote_api_routes.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/dto/login_response_dto.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/params/login_params.dart';

class LoginRemoteDatasource {
  final ApiManager apiManager;

  const LoginRemoteDatasource({
    required this.apiManager,
  });

  Future<Either<ApiError, LoginResponseDto>> login({
    required LoginParams params,
  }) async {
    final resultLogin = await apiManager.post(
      url: LoginRemoteApiRoutes.login,
      body: params.toMap(),
    );
    final resultLoginMap = resultLogin.map(
      (success) => ApiResponse.fromJson(
        success,
        (json) => LoginResponseDto.fromJson(
          tryCast<Map<String, dynamic>>(json) ?? {},
        ),
      ).result,
    );
    return resultLoginMap;
  }
}
