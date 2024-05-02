import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackaton_2024_mv/core/di/core_module.dart';
import 'package:hackaton_2024_mv/feature/principal/data/data_source/principal_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/principal/data/repository/principal_repository_impl.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_document.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/usecase/send_documents.dart';

final _principalRemoteDatasourceProvider = Provider(
  (ref) => PrincipalRemoteDatasource(
    apiManager: ref.read(apiProvider),
  ),
);

final _principalRepositoryProvider = Provider(
  (ref) => PrincipalRepositoryImpl(
    remoteDatasource: ref.read(_principalRemoteDatasourceProvider),
  ),
);

final sendDocumentUseCaseProvider = Provider(
  (ref) => SendDocument(
    repository: ref.read(_principalRepositoryProvider),
  ),
);

final sendDocumentsUseCaseProvider = Provider(
      (ref) => SendDocuments(
    repository: ref.read(_principalRepositoryProvider),
  ),
);