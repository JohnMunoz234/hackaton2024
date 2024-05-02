import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class ApiResponse<T> {
  final int? statusCode;
  final String? statusMessage;
  final String? statusDescription;
  final T result;

  const ApiResponse({
    this.statusCode,
    this.statusDescription,
    this.statusMessage,
    required this.result,
  });

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) fromJsonT) =>
      _$ApiResponseFromJson<T>(json, fromJsonT);
}
