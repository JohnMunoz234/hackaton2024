class SendDocumentParams {
  final String fileName;
  final String base64Document;

  const SendDocumentParams({
    required this.fileName,
    required this.base64Document,
  });

  Map<String, dynamic> toMap() {
    return {
      "filename": fileName,
      "base64_content": base64Document,
    };
  }

  @override
  String toString() {
    return 'SendDocumentParams{fileName: $fileName, base64_content: $base64Document}';
  }
}
