
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/repository/folders_repository.dart';

part 'folders_result_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class FoldersResultResponseDto {
  final bool? success;
  final int? code;

  FoldersResultResponseDto({
    this.code,
    this.success,
  });

 factory FoldersResultResponseDto.fromJson(Map<String, dynamic> json) =>
    _$FoldersResultResponseDtoFromJson(json);



}


