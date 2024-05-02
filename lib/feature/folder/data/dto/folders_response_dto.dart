import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackaton_2024_mv/feature/folder/data/dto/folders_result_response_dto.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

part 'folders_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class FoldersResponseDto {
  final int? statusCode;
  final String? statusMessage;
  final String? statusDescription;
  final FoldersResultResponseDto? result;

  const FoldersResponseDto({
    this.statusCode,
    this.statusMessage,
    this.statusDescription,
    this.result,
  });

  factory FoldersResponseDto.fromJson(Map<String, dynamic> json) =>
    _$FoldersResponseDtoFromJson(json);
}

extension FoldersResponseDtoX on FoldersResponseDto {
  FoldersResponse toModel() {
    return FoldersResponse(success: result!.success ?? false, code: result!.code ?? 0);
  }
}
