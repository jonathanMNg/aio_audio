import 'package:background_downloader/background_downloader.dart';

class AdmDownloadService {
  AdmDownloadService._();

  static AdmDownloadService? _instance;
  FileDownloader? _downloader;

  static AdmDownloadService get instance {
    _instance ??= AdmDownloadService._();
    return _instance!;
  }

  void _ensureInitialized() {
    _downloader ??= FileDownloader();
  }

  Future<void> configure({
    dynamic globalConfig,
    dynamic androidConfig,
    dynamic iOSConfig,
    dynamic desktopConfig,
  }) async {
    _ensureInitialized();
    await _downloader!.configure(globalConfig: globalConfig);
  }

  Future<void> enqueue(DownloadTask task) async {
    _ensureInitialized();
    await _downloader!.enqueue(task);
  }

  Stream<TaskUpdate> get updates {
    _ensureInitialized();
    return _downloader!.updates;
  }

  Future<void> cancel(DownloadTask task) async {
    _ensureInitialized();
    await _downloader!.cancel(task);
  }

  Future<void> pause(DownloadTask task) async {
    _ensureInitialized();
    await _downloader!.pause(task);
  }

  Future<void> resume(DownloadTask task) async {
    _ensureInitialized();
    await _downloader!.resume(task);
  }

  void destroy() {
    _downloader = null;
  }
}
