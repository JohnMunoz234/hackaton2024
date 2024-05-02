class FoldersParams {
  final String folderName;

  const FoldersParams({
    required this.folderName,
  });

  Map<String, dynamic> toMap() {
    return {
      "folderName": folderName,
    };
  }
}
