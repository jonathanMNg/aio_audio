part of 'adm_download_item_bloc.dart';

final class AdmDownloadItemState extends Equatable {
  const AdmDownloadItemState({
    this.taskId,
    this.update,
  });

  final TaskProgressUpdate? update;
  final String? taskId;

  @override
  List<Object?> get props => [update, taskId];

  // AdmDownloadItemState copyWith({
  //   AdmDownloadItemStateStatus? status,
  //   TaskProgressUpdate? update,
  //   String? taskId,
  // }) {
  //   return AdmDownloadItemState(
  //     taskId: taskId ?? this.taskId,
  //     update: update ?? this.update,
  //   );
  // }
}

//
// final class AdmDownloadItemInitial extends AdmDownloadItemState {
//   @override
//   List<Object> get props => [];
// }
//
// final class AdmDownloadItemLoaded extends AdmDownloadItemState {
//   final TaskProgressUpdate update;
//   const AdmDownloadItemLoaded(this.update);
//   @override
//   List<Object> get props => [update];
// }
