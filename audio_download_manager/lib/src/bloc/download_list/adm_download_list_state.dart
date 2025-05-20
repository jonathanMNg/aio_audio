part of 'adm_download_list_bloc.dart';

enum AdmDownloadListStatus { loading, loaded, error }

class AdmDownloadListState extends Equatable {
  const AdmDownloadListState({
    required this.enqueuedList,
    required this.downloadingList,
    required this.downloadedList,
    required this.failedList,
    required this.status,
  });

  final List<AdmDownloadModel> enqueuedList;
  final List<AdmDownloadModel> downloadingList;
  final List<AdmDownloadModel> downloadedList;
  final List<AdmDownloadModel> failedList;
  final AdmDownloadListStatus status;

  @override
  List<Object> get props => [enqueuedList, downloadingList, downloadedList, failedList, status];

  AdmDownloadListState copyWith({
    List<AdmDownloadModel>? enqueuedList,
    List<AdmDownloadModel>? downloadingList,
    List<AdmDownloadModel>? downloadedList,
    List<AdmDownloadModel>? failedList,
    AdmDownloadListStatus? status,
  }) {
    return AdmDownloadListState(
      enqueuedList: enqueuedList ?? this.enqueuedList,
      downloadingList: downloadingList ?? this.downloadingList,
      downloadedList: downloadedList ?? this.downloadedList,
      failedList: failedList ?? this.failedList,
      status: status ?? this.status,
    );
  }
}
