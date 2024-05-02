import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/di/core_module.dart';
import 'package:hackaton_2024_mv/feature/folder/data/datasource/folders_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/folder/data/repository/folders_respository_impl.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/usecase/send_folders.dart';
import 'package:hackaton_2024_mv/feature/principal/data/data_source/principal_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/principal/data/repository/principal_repository_impl.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_document.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_documents.dart';

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
