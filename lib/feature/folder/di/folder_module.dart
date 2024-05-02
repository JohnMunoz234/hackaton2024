import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/di/core_module.dart';
import 'package:hackaton_2024_mv/feature/folder/data/datasource/folders_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/folder/data/repository/folders_respository_impl.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/usecase/get_folders.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/usecase/send_folders.dart';

final _folderRemoteDatasourceProvider = Provider(
  (ref) => FoldersRemoteDatasource(
    apiManager: ref.read(apiProvider),
  ),
);

final _folderRepositoryProvider = Provider(
  (ref) => FoldersRepositoryImpl(
    remoteDatasource: ref.read(_folderRemoteDatasourceProvider),
  ),
);

final sendFoldersUseCaseProvider = Provider(
  (ref) => SendFolders(
    repository: ref.read(_folderRepositoryProvider),
  ),
);

final getFoldersUseCaseProvider = Provider<GetFolders>((ref) {
  return GetFolders(repository: ref.read(_folderRepositoryProvider));
});
