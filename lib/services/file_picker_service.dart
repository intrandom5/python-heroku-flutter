import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  Future files() async {
    FilePickerResult uploadedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['wav'],
    );

    // if (uploadedFile != null) {
    File file = File(uploadedFile.files.single.path);
    return file.readAsBytes();
    // } else {
    //   return null;
    // }
  }
}
