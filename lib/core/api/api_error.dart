class ApiError {
  final String message;
  final int statusCode;

  const ApiError({
    required this.message,
    required this.statusCode,
  });

  factory ApiError.asDefault() =>
      const ApiError(message: "Ocurrio un problema", statusCode: 400);
}
