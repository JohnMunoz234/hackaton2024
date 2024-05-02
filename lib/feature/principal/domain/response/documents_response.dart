class DocumentsResponse {
  final List<String> classes;

  const DocumentsResponse({
    required this.classes,
  });

  @override
  String toString() {
    return 'PrincipalResponse{class: $classes}';
  }
}
