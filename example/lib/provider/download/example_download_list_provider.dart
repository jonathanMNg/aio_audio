import 'package:audio_download_manager/audio_download_manager.dart';

class ExampleDownloadListProvider implements AdmDownloadListProvider {
  @override
  Future<void> clearDownloads() {
    throw UnimplementedError();
  }

  @override
  Future<List<AdmDownloadModel>> getDownloads() async {
    return [];
  }

  @override
  Future<void> delete(String id) async {
    // TODO: implement delete
    // throw UnimplementedError();
  }

  @override
  Future<void> insert(AdmDownloadModel model) async {
    // TODO: implement insert
    // throw UnimplementedError();
  }
}