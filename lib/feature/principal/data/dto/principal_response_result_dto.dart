import 'package:hackaton_2024_mv/feature/principal/data/dto/principal_response_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'principal_response_result_dto.g.dart';

@JsonSerializable(createToJson: false)
class PrincipalResultResponseDto {
  final String? classResult;


  const PrincipalResultResponseDto({
    this.classResult,
  });

  factory PrincipalResultResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PrincipalResultResponseDtoFromJson(json);

  @override
  String toString() {
    return 'PrincipalResultResponseDto{classResult: $classResult}';
  }
}

