import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/folder/data/datasource/folders_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/folder/data/dto/folders_response_dto.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/params/folders_params.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/repository/folders_repository.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

class FoldersRepositoryImpl extends FoldersRepository {
  final FoldersRemoteDatasource remoteDatasource;

  const FoldersRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<ApiError, FoldersResponse>> sendFolders({
    required FoldersParams params,
  }) async {
    final result = await remoteDatasource.sendFolders(params: params);
    return result.map((success) => success.toModel());
  }

  @override
  Future<Either<ApiError, FoldersResponse>> getFolders() async {
    final result = await remoteDatasource.getFolders();
    return result.map((success) => success.toModel());
  }
}
