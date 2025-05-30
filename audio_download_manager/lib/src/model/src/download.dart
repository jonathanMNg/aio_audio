import 'package:background_downloader/background_downloader.dart';

class AdmDownloadModel {
  String? id;
  String? url;
  String? fileName;
  String? directory;

  AdmDownloadModel({
    this.id,
    this.url,
    this.fileName,
    this.directory,
  });

  factory AdmDownloadModel.fromDownloadTask(Task task) {
    return AdmDownloadModel(
      id: task.taskId,
      url: task.url,
      fileName: task.filename,
      directory: task.directory,
    );
  }

  AdmDownloadModel copyWith({
    String? id,
    String? url,
    String? fileName,
    String? directory,
  }) {
    return AdmDownloadModel(
      id: id ?? this.id,
      url: url ?? this.url,
      fileName: fileName ?? this.fileName,
      directory: directory ?? this.directory,
    );
  }
}