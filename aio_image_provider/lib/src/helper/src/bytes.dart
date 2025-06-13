import 'dart:io';
import 'package:flutter/foundation.dart';

Future<File> saveUint8ListToImage(Uint8List imageData, String path) async {
  try {
    File file = await File(path).create();
    return await file.writeAsBytes(imageData);
  }
  catch(e) {
    throw Exception('Cannot save image!. Error: $e');
  }
}

String? getUint8ListImageExtension(Uint8List bytes) {
  if (bytes.length >= 8) {
    // PNG
    if (bytes[0] == 0x89 &&
        bytes[1] == 0x50 &&
        bytes[2] == 0x4E &&
        bytes[3] == 0x47) {
      return 'png';
    }
    // JPEG
    if (bytes[0] == 0xFF &&
        bytes[1] == 0xD8 &&
        bytes[2] == 0xFF) {
      return 'jpg';
    }
    // GIF
    if (bytes[0] == 0x47 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46) {
      return 'gif';
    }
    // WEBP
    if (bytes[0] == 0x52 &&
        bytes[1] == 0x49 &&
        bytes[2] == 0x46 &&
        bytes[3] == 0x46 &&
        bytes[8] == 0x57 &&
        bytes[9] == 0x45 &&
        bytes[10] == 0x42 &&
        bytes[11] == 0x50) {
      return 'webp';
    }
  }
  return null; // Unknown format
}