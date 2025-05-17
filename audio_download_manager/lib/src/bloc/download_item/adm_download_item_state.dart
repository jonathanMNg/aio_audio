part of 'adm_download_item_bloc.dart';

sealed class AdmDownloadItemState extends Equatable {
  const AdmDownloadItemState();
}

final class AdmDownloadItemInitial extends AdmDownloadItemState {
  @override
  List<Object> get props => [];
}

final class AdmDownloadItemLoaded extends AdmDownloadItemState {
  final TaskProgressUpdate update;
  const AdmDownloadItemLoaded(this.update);
  @override
  List<Object> get props => [update];
}