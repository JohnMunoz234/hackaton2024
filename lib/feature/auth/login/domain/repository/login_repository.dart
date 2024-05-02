import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/params/login_params.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/response/login_response.dart';

abstract class LoginRepository {
  const LoginRepository();

  Future<Either<ApiError, LoginResponse>> login({required LoginParams params});
}
