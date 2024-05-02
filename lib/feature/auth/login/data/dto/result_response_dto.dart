import 'package:json_annotation/json_annotation.dart';

part 'result_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class ResultResponseDto {
  final bool? success;
  final String? message;
  final int? codeValidate;
  final String? internalCode;
  final String? token;

  const ResultResponseDto({
    this.success,
    this.message,
    this.codeValidate,
    this.internalCode,
    this.token,
  });

  factory ResultResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseDtoFromJson(json);
}
