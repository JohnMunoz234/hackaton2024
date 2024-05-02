class FoldersResponse {
  final List<PrefixResponse>? folders;

  const FoldersResponse({required this.folders});
}

class PrefixResponse {
  final String? prefix;

  PrefixResponse({this.prefix});
}
