import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/di/core_module.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/data_source/login_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/auth/login/data/repository/login_repository_imp.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/use_case/login.dart';

final _loginRemoteDatasourceProvider = Provider(
  (ref) => LoginRemoteDatasource(
    apiManager: ref.read(apiProvider),
  ),
);

final _loginRepositoryProvider = Provider(
  (ref) => LoginRepositoryImp(
    remoteDatasource: ref.read(_loginRemoteDatasourceProvider),
  ),
);

final loginUseCaseProvider = Provider(
  (ref) => Login(
    repository: ref.read(_loginRepositoryProvider),
  ),
);
