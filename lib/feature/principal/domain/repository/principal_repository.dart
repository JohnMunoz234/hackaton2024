
import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_documents_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';

abstract class PrincipalRepository {
  const PrincipalRepository();

  Future<Either<ApiError, PrincipalResponse>> sendDocument({required SendDocumentParams params});

  Future<Either<ApiError, PrincipalResponse>> sendDocuments({required SendDocumentsParams params});
}