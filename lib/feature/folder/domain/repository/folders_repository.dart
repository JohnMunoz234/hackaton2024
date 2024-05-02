import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/params/folders_params.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

abstract class FoldersRepository {
  const FoldersRepository();

  Future<Either<ApiError, FoldersResponse>> getFolders();

  Future<Either<ApiError, FoldersResponse>> sendFolders(
      {required FoldersParams params});
}
