import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/repository/principal_repository.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';

class SendDocument {
  final PrincipalRepository repository;

  const SendDocument({
    required this.repository,
  });

  Future<Either<ApiError, PrincipalResponse>> call({
    required SendDocumentParams params,
  }) =>
      repository.sendDocument(params: params);
}
