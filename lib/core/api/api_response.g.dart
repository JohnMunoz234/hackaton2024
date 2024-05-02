// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusDescription: json['statusDescription'] as String?,
      statusMessage: json['statusMessage'] as String?,
      result: fromJsonT(json['result']),
    );
