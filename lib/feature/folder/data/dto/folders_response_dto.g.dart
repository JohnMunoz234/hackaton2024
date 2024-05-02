// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoldersResponseDto _$FoldersResponseDtoFromJson(Map<String, dynamic> json) =>
    FoldersResponseDto(
      statusCode: (json['statusCode'] as num?)?.toInt(),
      statusMessage: json['statusMessage'] as String?,
      statusDescription: json['statusDescription'] as String?,
      result: json['result'] == null
          ? null
          : FoldersResultResponseDto.fromJson(
              json['result'] as Map<String, dynamic>),
    );
