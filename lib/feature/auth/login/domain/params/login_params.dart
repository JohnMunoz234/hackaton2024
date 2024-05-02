class LoginParams {
  final String email;
  final String username;
  final String password;
  final String guid;

  const LoginParams({
    required this.email,
    required this.username,
    required this.password,
    required this.guid,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "username": username,
      "password": password,
      "guid": guid,
    };
  }
}
