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

class _AdmMoveItemToEnqueue extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmMoveItemToEnqueue(this.item);
  @override
  List<Object?> get props => [item];
}

class AdmDeleteItem extends AdmDownloadListEvent {
  final String id;
  const AdmDeleteItem(this.id);
  @override
  List<Object?> get props => [id];
}

// class AdmCancelItem extends AdmDownloadListEvent {
//   final AdmDownloadModel item;
//   const AdmCancelItem(this.item);
//   @override
//   List<Object?> get props => [item];
// }

class _AdmMoveItemToDownloading extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmMoveItemToDownloading(this.item);
  @override
  List<Object?> get props => [item];
}

class _AdmMoveItemToComplete extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmMoveItemToComplete(this.item);
  @override
  List<Object?> get props => [item];
}

class _AdmMoveItemToFailed extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const _AdmMoveItemToFailed(this.item);
  @override
  List<Object?> get props => [item];
}

class AdmEnqueueItem extends AdmDownloadListEvent {
  final AdmDownloadModel item;
  const AdmEnqueueItem(this.item);
  @override
  List<Object?> get props => [item];
}