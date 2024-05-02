import 'package:dartz/dartz.dart';
import 'package:hackaton_2024_mv/core/api/api_error.dart';
import 'package:hackaton_2024_mv/core/api/api_manager.dart';
import 'package:hackaton_2024_mv/core/api/api_response.dart';
import 'package:hackaton_2024_mv/core/utils/cast.dart';
import 'package:hackaton_2024_mv/feature/folder/data/datasource/folders_remote_api_routes.dart';
import 'package:hackaton_2024_mv/feature/folder/data/dto/folders_response_dto.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/params/folders_params.dart';

class FoldersRemoteDatasource {
  final ApiManager apiManager;

  const FoldersRemoteDatasource({
    required this.apiManager,
  });

  Future<Either<ApiError, FoldersResponseDto>> getFolders() async {
    final headers = {
      'Content-Type': 'application/json',
      'api-key': 'xCLHuwo2GxZdHwSaC1DN5OcULRLRZVxPxx4m'
    };

    final resultFolders = await apiManager.get(
      url: FoldersRemoteApiRoutes.getFolders,
      headers: headers,
    );

    final Either<ApiError, FoldersResponseDto> resultsSendFoldersMap =
        resultFolders.map(
      (ApiResponseMap success) {
        return FoldersResponseDto.fromJson(
          success,
        );
      },
    );
    return resultsSendFoldersMap;
  }

  Future<Either<ApiError, FoldersResponseDto>> sendFolders({
    required FoldersParams params,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
      'api-key': 'xCLHuwo2GxZdHwSaC1DN5OcULRLRZVxPxx4m'
    };

    final resultFolders = await apiManager.post(
      url: FoldersRemoteApiRoutes.sendFolders,
      headers: headers,
    );

    final resultsSendFoldersMap = resultFolders.map(
      (success) => ApiResponse.fromJson(
        success,
        (json) => FoldersResponseDto.fromJson(
          tryCast<Map<String, FoldersResponseDto>>(json) ?? {},
        ),
      ).result,
    );
    return resultsSendFoldersMap;
  }
}
