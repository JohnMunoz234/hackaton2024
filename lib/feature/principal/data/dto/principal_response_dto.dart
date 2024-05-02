import 'package:hackaton_2024_mv/feature/principal/data/dto/principal_response_result_dto.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'principal_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class PrincipalResponseDto {
  final String? result;

  const PrincipalResponseDto({

    this.result,
  });


  @override
  String toString() {
    return 'PrincipalResponseDto{result: $result}';
  }

  factory PrincipalResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PrincipalResponseDtoFromJson(json);


}

extension PrincipalResponseDtoX on PrincipalResponseDto {
  PrincipalResponse toModel() {
    return PrincipalResponse(
      classPrincipal: result ?? '',
    );
  }
}
