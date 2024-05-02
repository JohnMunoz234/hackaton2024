import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/repository/folders_repository.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

class GetFolders {
  final FoldersRepository repository;

  const GetFolders({required this.repository});

  Future<Either<ApiError, FoldersResponse>> call() => repository.getFolders();
}
