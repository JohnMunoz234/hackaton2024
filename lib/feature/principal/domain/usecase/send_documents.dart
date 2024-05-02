import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_documents_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/repository/principal_repository.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/documents_response.dart';

class SendDocuments {
  final PrincipalRepository repository;

  const SendDocuments({required this.repository});

  Future<Either<ApiError, DocumentsResponse>> call({
    required SendDocumentsParams params,
  }) =>
      repository.sendDocuments(params: params);
}
