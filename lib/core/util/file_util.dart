import 'package:file_picker/file_picker.dart';
import 'package:hackaton_2024_mv/feature/principal/presentation/notifier/principal_provider.dart';

class FileUtil {
   static List<String> fileTypeDocumentsExtensions = ['png','jpg','jpeg'];

  static Future<String?> pickFile() async {
    FileType fileTypeToPick = FileType.custom;
    List<String>? allowedExtensions  = fileTypeDocumentsExtensions;

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileTypeToPick,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      return result.files.first.path;
    } else {
      return null;
    }
  }
}

