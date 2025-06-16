export 'src/builder/builder.dart';
export 'src/model/model.dart';

import 'package:aio_image_provider/src/helper/src/bytes.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:io';
import 'package:aio_image_provider/src/helper/helper.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'aio_image_provider.dart';
export 'src/provider/provider.dart';

class AioImageProvider {
  String? _saveDirectory;

  // Private named constructor
  AioImageProvider._internal();

  // The singleton instance
  static final AioImageProvider _instance = AioImageProvider._internal();

  // Factory constructor returns the same instance
  factory AioImageProvider() => _instance;

  // Static method to initialize the class
  static Future<void> init({
    String? directoryPath,
    required ImageSearchProvider imageSearchProvider,
  }) async {
    GetIt.I.registerLazySingleton<ImageSearchProvider>(
      () => imageSearchProvider,
    );
    if (directoryPath != null) {
      final directoryFullPath =
          '${await _instance._directoryPath}/$directoryPath';
      try {
        await Directory(directoryFullPath).create(recursive: true);
        _instance._saveDirectory = directoryFullPath;
      } catch (e) {
        throw Exception(
          'Failed to create directory: $e. Make sure the directory path is valid and not exist.',
        );
      }
    } else {
      _instance._saveDirectory = await _instance._directoryPath;
    }
  }

  String get saveDirectory {
    _ensureInitialized();
    return _saveDirectory!;
  }

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<void> saveUrlImage(
    AipUrlImage image, {
    Function(String filePath)? onSuccess,
    Function(Object error)? onError,
  }) async {
    _ensureInitialized();
    final extension = await getImageFileExtension(image.url!);
    if (extension == null) {
      onError?.call(Exception('Extension not found for ${image.url}'));
    } else {

      try {
        final response = await http.get(Uri.parse(image.url!));
        if (response.statusCode == 200) {
          final newFileName = "${getUuidFromString(image.url!)}.$extension";
          final file = File("$saveDirectory/$newFileName");
          if (await file.exists()) {
            onSuccess?.call(newFileName);
          } else {
            await file.writeAsBytes(response.bodyBytes);
            onSuccess?.call(newFileName);
          }
        } else {
          onError?.call(Exception('Failed to download image'));
        }
      } catch (e) {
        onError?.call(e);
      }
    }
  }

  Future<void> saveFileImage(
    AipFileImage tempImage, {
    Function(String filePath)? onSuccess,
    Function(Object error)? onError,
  }) async {
    _ensureInitialized();
    final extension = await getImageFileExtension(tempImage.path!);
    if (extension == null) {
      onError?.call(Exception('Extension not found'));
    } else {
      final tempFile = File(tempImage.path!);
      final newFileName = "${getUuidFromString(tempImage.path!)}.$extension";
      final newFile = File("$saveDirectory/$newFileName");
      if (await tempFile.exists()) {
        try {
          if(await newFile.exists()) {
            onSuccess?.call(newFileName);
          }
          else {
            await tempFile.copy(newFile.path);
            onSuccess?.call(newFileName);
          }
        }
        catch (e) {
          onError?.call(e);
        }
      }
      else {
        // check if tempImage.path is actually a saved image
        if(await File("$saveDirectory/${tempImage.path!}").exists()) {
          onSuccess?.call(tempImage.path!);
        }
        else {
          onError?.call(Exception('Temp image not found ${tempImage.path}'));
        }
      }
    }
  }

  Future<void> saveUint8ListImage(
        Uint8List imageData, {
        Function(String filePath)? onSuccess,
        Function(Object error)? onError,
      }) async {
    _ensureInitialized();
    final extension = getUint8ListImageExtension(imageData);
    if (extension == null) {
      onError?.call(Exception('Extension not found'));
    } else {
      final newFileName = '${Uuid().v4()}.$extension';
      try {
        final newFile = await saveUint8ListToImage(imageData, "$saveDirectory/$newFileName");
        onSuccess?.call(newFileName);
      }
      catch (e) {
        onError?.call(Exception('Temp image not found $saveDirectory/$newFileName'));
      }
    }
  }

  void _ensureInitialized() {
    if (_instance._saveDirectory == null) {
      throw Exception(
        'AioImageProvider is not initialized. Call AioImageProvider.init() first.',
      );
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
      if (response.statusCode == 200 &&
          response.headers.containsKey('content-type')) {
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
