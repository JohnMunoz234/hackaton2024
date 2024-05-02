import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/params/folders_params.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/repository/folders_repository.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

class SendFolders {
  final FoldersRepository repository;

  const SendFolders({required this.repository});

  Future<Either<ApiError, FoldersResponse>> call({
    required FoldersParams params,
  }) =>
      repository.sendFolders(params: params);
}
