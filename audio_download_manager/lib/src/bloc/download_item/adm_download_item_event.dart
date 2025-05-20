part of 'adm_download_item_bloc.dart';

sealed class AdmDownloadItemEvent extends Equatable {
  const AdmDownloadItemEvent();
}

class AdmAddItemToDownloading extends AdmDownloadItemEvent {
  const AdmAddItemToDownloading({required this.update, required this.taskId});
  final TaskProgressUpdate update;
  final String taskId;

  @override
  List<Object> get props => [];
}
