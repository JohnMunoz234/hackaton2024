// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseDto _$LoginResponseDtoFromJson(Map<String, dynamic> json) =>
    LoginResponseDto(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String?,
      statusDescription: json['statusDescription'] as String?,
      result: json['result'] == null
          ? null
          : ResultResponseDto.fromJson(json['result'] as Map<String, dynamic>),
    );
