import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/params/login_params.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/repository/login_repository.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/response/login_response.dart';

class Login {
  final LoginRepository repository;

  const Login({
    required this.repository,
  });

  Future<Either<ApiError, LoginResponse>> call({required LoginParams params}) =>
      repository.login(params: params);
}
