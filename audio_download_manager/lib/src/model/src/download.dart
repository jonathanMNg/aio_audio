import 'package:background_downloader/background_downloader.dart';

enum AdmDownloadTaskStatus {
  undefined,
  enqueued,
  running,
  complete,
  failed,
  canceled,
  paused,
}

class AdmDownloadModel {
  String? id;
  String? url;
  double? progress;
  AdmDownloadTaskStatus? status;
  String? fileName;
  String? directory;

  AdmDownloadModel({
    this.id,
    this.url,
    this.progress,
    this.status,
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
    double? progress,
    AdmDownloadTaskStatus? status,
    String? fileName,
    String? directory,
  }) {
    return AdmDownloadModel(
      id: id ?? this.id,
      url: url ?? this.url,
      progress: progress ?? this.progress,
      status: status ?? this.status,
      fileName: fileName ?? this.fileName,
      directory: directory ?? this.directory,
    );
  }
}