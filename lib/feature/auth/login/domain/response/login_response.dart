class LoginResponse {
  final bool success;
  final String token;

  const LoginResponse({
    required this.success,
    required this.token,
  });
}
