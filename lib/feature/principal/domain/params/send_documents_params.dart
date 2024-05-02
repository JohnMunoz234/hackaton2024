class SendDocumentsParams {
  final List<RealRequest> base64Document;

  const SendDocumentsParams({
    required this.base64Document,
  });

  List<Map<String, dynamic>> toMap() {
    return base64Document
        .map((e) =>
            {'filename': e.fileName, 'base64-content': e.base64Documents})
        .toList();
  }
}

class RealRequest {
  final String fileName;
  final String base64Documents;

  RealRequest({required this.fileName, required this.base64Documents});
}
