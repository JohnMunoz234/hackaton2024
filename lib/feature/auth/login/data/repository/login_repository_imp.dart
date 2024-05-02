import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/data_source/login_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/dto/login_response_dto.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/params/login_params.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/repository/login_repository.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/response/login_response.dart';

class LoginRepositoryImp extends LoginRepository {
  final LoginRemoteDatasource remoteDatasource;

  const LoginRepositoryImp({
    required this.remoteDatasource,
  });

  @override
  Future<Either<ApiError, LoginResponse>> login({
    required LoginParams params,
  }) async {
    final resultLogin = await remoteDatasource.login(params: params);
    return resultLogin.map((success) => success.toModel());
  }
}
