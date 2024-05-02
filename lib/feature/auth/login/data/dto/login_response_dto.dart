import 'package:hackaton_2024_mv/feature/auth/login/data/dto/result_response_dto.dart';
import 'package:hackaton_2024_mv/feature/auth/login/domain/response/login_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class LoginResponseDto {
  final int? statusCode;
  final String? statusMessage;
  final String? statusDescription;
  final ResultResponseDto? result;

  const LoginResponseDto({
    this.statusCode,
    this.statusMessage,
    this.statusDescription,
    this.result,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}

extension LoginResponseDtoX on LoginResponseDto {
  LoginResponse toModel() {
    return LoginResponse(
        success: result?.success ?? false, token: result?.token ?? '');
  }
}
