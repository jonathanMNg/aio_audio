import 'package:background_downloader/background_downloader.dart';

class AdmDownloadService {
  AdmDownloadService._();

  static AdmDownloadService? _instance;
  final FileDownloader _downloader = FileDownloader();

  static AdmDownloadService get instance {
    _instance ??= AdmDownloadService._();
    return _instance!;
  }

  Future<void> configure({dynamic globalConfig, dynamic androidConfig, dynamic iOSConfig, dynamic desktopConfig}) async {
    await _downloader.configure(globalConfig: globalConfig);
  }

  Future<void> enqueue(DownloadTask task) async {
    await _downloader.enqueue(task);
  }

  Stream<TaskUpdate> get updates => _downloader.updates;

  Future<void> cancel(DownloadTask task) async {
    await _downloader.cancel(task);
  }

  Future<void> pause(DownloadTask task) async {
    await _downloader.pause(task);
  }

  Future<void> resume(DownloadTask task) async {
    await _downloader.resume(task);
  }
}
