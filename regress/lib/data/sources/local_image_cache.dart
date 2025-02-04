import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Base64LocalImageCache {
  final SharedPreferences _sp;

  Base64LocalImageCache(this._sp);

  String _generateFileName(String key, {String ext = ".jpg"}) {
    final bytes = utf8.encode(key);
    final digest = md5.convert(bytes);
    return "${digest.toString()}$ext";
  }

  Future<File> _saveImageLocally(Uint8List imageData, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final localFilePath = "${directory.path}/$fileName";
    final file = File(localFilePath);
    await file.writeAsBytes(imageData);
    return file;
  }

  ResultDart<File, Unit> loadCachedImage(String cacheKey) {
    if (_sp.containsKey(cacheKey)) {
      final file = File(_sp.getString(cacheKey)!);
      if (file.existsSync()) {
        return file.toSuccess();
      }
    }
    return unit.toFailure();
  }

  Future<File> cacheImage(
    String imageBase64,
    String cacheKey,
  ) async {
    final imageData = base64Decode(imageBase64);
    final file = await _saveImageLocally(imageData, _generateFileName(cacheKey));
    _sp.setString(cacheKey, file.path);
    return file;
  }
}
