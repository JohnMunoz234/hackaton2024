import 'package:file_picker/file_picker.dart';

enum CustomFileType {
  GENERAL_DOCUMENT,
  PDF,
}

class FileUtil {
   static List<String> fileTypeDocumentsExtensions = ['doc', 'docx', 'pdf'];

  static Future<PlatformFile?> pickFile(CustomFileType fileType) async {
    FileType fileTypeToPick;
    List<String>? allowedExtensions;


    switch (fileType) {
      case CustomFileType.GENERAL_DOCUMENT:
        fileTypeToPick = FileType.custom;
        allowedExtensions = fileTypeDocumentsExtensions;
        break;
      case CustomFileType.PDF:
        fileTypeToPick = FileType.custom;
        allowedExtensions = ['pdf'];
        break;
    }

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: fileTypeToPick,
      allowedExtensions: allowedExtensions,
    );

    if (result != null) {
      return result.files.first;
    } else {
      return null;
    }
  }
}

