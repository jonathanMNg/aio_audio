part of 'adm_download_item_bloc.dart';

sealed class AdmDownloadItemEvent extends Equatable {
  const AdmDownloadItemEvent();
}

class AdmAddItemToDownloading extends AdmDownloadItemEvent {
  const AdmAddItemToDownloading(this.update);
  final TaskProgressUpdate update;

  @override
  List<Object> get props => [];
}