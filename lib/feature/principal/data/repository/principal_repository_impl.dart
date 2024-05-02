import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/feature/principal/data/data_source/principal_remote_datasource.dart';
import 'package:hackaton_2024_mv/feature/principal/data/dto/documents_response_dto.dart';
import 'package:hackaton_2024_mv/feature/principal/data/dto/principal_response_dto.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_documents_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/repository/principal_repository.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/documents_response.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';

class PrincipalRepositoryImpl extends PrincipalRepository {
  final PrincipalRemoteDatasource remoteDatasource;

  const PrincipalRepositoryImpl({
    required this.remoteDatasource,
  });

  @override
  Future<Either<ApiError, PrincipalResponse>> sendDocument(
      {required SendDocumentParams params})  async {
    print("request: $params");
    final result = await remoteDatasource.sendDocument(params: params);
    print("result: $result");
    return result.map((success) => success.toModel());
  }

  @override
  Future<Either<ApiError, DocumentsResponse>> sendDocuments({required SendDocumentsParams params}) async {
    print("request: $params");
     final result = await remoteDatasource.sendDocuments(params: params);
    print("resuelt: $result");
    return result.map((success) => success.toModel());

  }


}
