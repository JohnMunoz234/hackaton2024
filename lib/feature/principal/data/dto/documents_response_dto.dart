import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/documents_response.dart';
import 'package:hackaton_2024_mv/feature/principal/domain/response/principal_response.dart';

part 'documents_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class DocumentsResponseDto {
  final List<String>? result;

  const DocumentsResponseDto({
    this.result,
  });


  @override
  String toString() {
    return 'PrincipalResponseDto{result: $result}';
  }

  factory DocumentsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentsResponseDtoFromJson(json);


}

extension DocumentsResponseDtoX on DocumentsResponseDto {
  DocumentsResponse toModel() {
    return DocumentsResponse(classes: result ?? []);
  }
}