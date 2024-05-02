import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackaton_2024_mv/feature/folder/domain/response/folders_response.dart';

part 'folders_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class FoldersResponseDto {
  final List<PrefixDto>? folders;

  const FoldersResponseDto({
    this.folders,
  });

  factory FoldersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FoldersResponseDtoFromJson(json);
}

extension FoldersResponseDtoX on FoldersResponseDto {
  FoldersResponse toModel() {
    return FoldersResponse(folders: folders?.map((e) => e.toModel()).toList());
  }
}

@JsonSerializable(createToJson: false)
class PrefixDto {
  @JsonKey(name: 'Prefix')
  final String? prefix;

  PrefixDto({this.prefix});

  factory PrefixDto.fromJson(Map<String, dynamic> json) =>
      _$PrefixDtoFromJson(json);
}

extension PrefixResponseDtoX on PrefixDto {
  PrefixResponse toModel() {
    return PrefixResponse(prefix: prefix);
  }
}
