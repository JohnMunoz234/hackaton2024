// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folders_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoldersResponseDto _$FoldersResponseDtoFromJson(Map<String, dynamic> json) =>
    FoldersResponseDto(
      folders: (json['folders'] as List<dynamic>?)
          ?.map((e) => PrefixDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PrefixDto _$PrefixDtoFromJson(Map<String, dynamic> json) => PrefixDto(
      prefix: json['Prefix'] as String?,
    );
