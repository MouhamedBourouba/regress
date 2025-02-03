import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

bool isNumeric(String value) {
  final start = "0".runes.first;
  final end = "9".runes.first;

  return !value.runes.any((char) => char < start || char > end);
}

Future<File> saveImage(Uint8List imageData, String fileName) async {
  Directory directory = await getApplicationDocumentsDirectory();
  final filePath = "${directory.path}/$fileName";
  final file = File(filePath);
  await file.writeAsBytes(imageData);
  return file;
}
