part of 'adm_download_list_bloc.dart';

sealed class AdmDownloadListEvent extends Equatable {
  const AdmDownloadListEvent();
}

class AdmLoadDownloadedList extends AdmDownloadListEvent {
  const AdmLoadDownloadedList();
  @override
  List<Object?> get props => [];
}

class AdmClearDownloadedList extends AdmDownloadListEvent {
  const AdmClearDownloadedList();
  @override
  List<Object?> get props => [];
}

class _AdmEnqueueItem extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmEnqueueItem(this.item);
  @override
  List<Object?> get props => [item];
}

// class AdmRemoveItem extends AdmDownloadListEvent {
//   final AdmDownloadModel item;
//   const AdmRemoveItem(this.item);
//   @override
//   List<Object?> get props => [item];
// }

// class AdmCancelItem extends AdmDownloadListEvent {
//   final AdmDownloadModel item;
//   const AdmCancelItem(this.item);
//   @override
//   List<Object?> get props => [item];
// }

class _AdmDownloadItem extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmDownloadItem(this.item);
  @override
  List<Object?> get props => [item];
}

class _AdmCompleteDownload extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmCompleteDownload(this.item);
  @override
  List<Object?> get props => [item];
}

class _AdmFailedDownload extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmFailedDownload(this.item);
  @override
  List<Object?> get props => [item];
}

class AdmAddItemToQueue extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const AdmAddItemToQueue(this.item);
  @override
  List<Object?> get props => [item];
}