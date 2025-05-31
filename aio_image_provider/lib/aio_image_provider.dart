export 'src/builder/builder.dart';
export 'src/model/model.dart';

import 'dart:async';
import 'dart:io';
import 'package:aio_image_provider/src/helper/helper.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'aio_image_provider.dart';

class AioImageProvider {
  String? saveDirectory;

  // Private named constructor
  AioImageProvider._internal();

  // The singleton instance
  static final AioImageProvider _instance = AioImageProvider._internal();

  // Factory constructor returns the same instance
  factory AioImageProvider() => _instance;

  // Static method to initialize the class
  static Future<void> init({String? directoryPath}) async {
    if(directoryPath != null) {
      final directoryFullPath = '${await _instance._directoryPath}/$directoryPath';
      try {
        await Directory(directoryFullPath).create(recursive: true);
        _instance.saveDirectory = directoryFullPath;
      }
      catch (e) {
        throw Exception('Failed to create directory: $e. Make sure the directory path is valid and not exist.');
      }
    }
    else {
      _instance.saveDirectory = await _instance._directoryPath;
    }
  }


  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> saveImage(AipUrlImage image, {Function(String filePath)? onSuccess, Function(Object error)? onError}) async {
    _ensureInitialized();
    final extension = await getImageFileExtension(image.url!);
    if(extension == null) {
      onError?.call( Exception('Extension not found'));
    }
    else {
      if( await image.isValidImage) {
        try {
          final response = await http.get(Uri.parse(image.url!));
          if (response.statusCode == 200) {
            final filePath = "${getUuidFromString(image.url!)}.$extension";
            final file = File("${saveDirectory!}/$filePath");
            if(await file.exists()) {
              onError?.call( Exception('File already exists'));
            }
            else {
              await file.writeAsBytes(response.bodyBytes);
              onSuccess?.call(filePath);
            }
          } else {
            onError?.call( Exception('Failed to download image'));
          }
        } catch (e) {
          onError?.call( e);
        }
      }
      else {
        onError?.call( Exception('Invalid image'));
      }
    }

  }

  void _ensureInitialized() {
    if(_instance.saveDirectory == null) {
      throw Exception('AioImageProvider is not initialized. Call AioImageProvider.init() first.');
    }
  }
  Future<String?> getImageFileExtension(String url) async {
    // Try to extract extension from URL path
    final uri = Uri.parse(url);
    final path = uri.path;
    final match = RegExp(r'\.([a-zA-Z0-9]+)$').firstMatch(path);
    if (match != null) {
      return match.group(1)?.toLowerCase();
    }

    // If no extension, try to get it from Content-Type header
    try {
      final response = await http.head(uri);
      if (response.statusCode == 200 && response.headers.containsKey('content-type')) {
        final contentType = response.headers['content-type']!;
        // Map common content types to extensions
        if (contentType.contains('image/jpeg')) return 'jpg';
        if (contentType.contains('image/png')) return 'png';
        if (contentType.contains('image/gif')) return 'gif';
        if (contentType.contains('image/webp')) return 'webp';
        if (contentType.contains('image/bmp')) return 'bmp';
        if (contentType.contains('image/svg+xml')) return 'svg';
        // Add more mappings as needed
      }
    } catch (_) {
      // Ignore network errors and return null
    }

    return null; // Could not determine extension
  }
}