import 'dart:convert';

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

  Future<Either<ApiError, FoldersResponseDto>> sendFolders(
      {required FoldersParams params}) async {
    final resultFolders = await apiManager.post(
      url: FoldersRemoteApiRoutes.sendFolders,
      body: params.toMap(),
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
