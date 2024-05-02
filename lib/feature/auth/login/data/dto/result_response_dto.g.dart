// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultResponseDto _$ResultResponseDtoFromJson(Map<String, dynamic> json) =>
    ResultResponseDto(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      codeValidate: (json['codeValidate'] as num?)?.toInt(),
      internalCode: json['internalCode'] as String?,
      token: json['token'] as String?,
    );
