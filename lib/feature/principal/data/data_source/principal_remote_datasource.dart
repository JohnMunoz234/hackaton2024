import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/core/api/api_manager.dart';
import 'package:hackaton_2024_mv/core/api/api_response.dart';
import 'package:hackaton_2024_mv/core/utils/cast.dart';
import 'package:hackaton_2024_mv/feature/principal/data/data_source/principal_remote_api_routes.dart';
import 'package:hackaton_2024_mv/feature/principal/data/dto/documents_response_dto.dart';
import 'package:hackaton_2024_mv/feature/principal/data/dto/principal_response_dto.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_document_params.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/params/send_documents_params.dart';

class PrincipalRemoteDatasource {
  final ApiManager apiManager;

  const PrincipalRemoteDatasource({
    required this.apiManager,
  });

  // Envio de un documento
  Future<Either<ApiError, PrincipalResponseDto>> sendDocument(
      {required SendDocumentParams params}) async {
    final headers = {'Content-Type': 'application/json',
    'api-key':'xCLHuwo2GxZdHwSaC1DN5OcULRLRZVxPxx4m'};

    final Either<ApiError, ApiResponseMap> resultPrincipal = await apiManager.post(
      url: PrincipalRemoteApiRoutes.sendDocument,
      body: params.toMap(),
      headers: headers,
    );
    print("resultPrincipal: $resultPrincipal");
    final Either<ApiError, PrincipalResponseDto> resultPrincipalMap = resultPrincipal.map(
      (ApiResponseMap success) {
        return ApiResponse.fromJson(
        success,
        (json) {
          return PrincipalResponseDto.fromJson( {
            'result': json
          },
        );
        },
      ).result;
      },
    );
    return resultPrincipalMap;
  }

  // Envio de varios documentos
  Future<Either<ApiError, DocumentsResponseDto>> sendDocuments(
      {required SendDocumentsParams params}) async {
    final headers = {'Content-Type': 'application/json',
      'api-key':'xCLHuwo2GxZdHwSaC1DN5OcULRLRZVxPxx4m'};

    final resultPrincipal = await apiManager.postObjetBody(
      url: PrincipalRemoteApiRoutes.sendDocuments,
      body: params.toMap(),
      headers: headers,
    );

   final resultPrincipalMap = resultPrincipal.map(
      (success) => ApiResponse.fromJson(
        success,
        (json) => DocumentsResponseDto.fromJson(
          tryCast<Map<String, DocumentsResponseDto>>(json) ?? {},
        ),
      ).result,
    );
    return resultPrincipalMap;
  }
}
