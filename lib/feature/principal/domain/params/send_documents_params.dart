class SendDocumentsParams {
  final String typeDocument;
  final List<String> base64Document;

  const SendDocumentsParams({
    required this.typeDocument,
    required this.base64Document,
  });

  Map<String, dynamic> toMap() {
    return {
      "typeDocument": typeDocument,
      "base64Document": base64Document,
    };
  }
}
