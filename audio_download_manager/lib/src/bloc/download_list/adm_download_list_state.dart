part of 'adm_download_list_bloc.dart';

enum AdmDownloadListStatus { loading, loaded, error }

class AdmDownloadListState extends Equatable {
  const AdmDownloadListState({
    required this.enqueuedList,
    required this.downloadingList,
    required this.downloadedList,
    required this.status,
  });

  final List<AdmDownloadModel> enqueuedList;
  final List<AdmDownloadModel> downloadingList;
  final List<AdmDownloadModel> downloadedList;
  final AdmDownloadListStatus status;

  @override
  List<Object> get props => [enqueuedList, downloadingList, downloadedList, status];

  AdmDownloadListState copyWith({
    List<AdmDownloadModel>? enqueuedList,
    List<AdmDownloadModel>? downloadingList,
    List<AdmDownloadModel>? downloadedList,
    AdmDownloadListStatus? status,
  }) {
    return AdmDownloadListState(
      enqueuedList: enqueuedList ?? this.enqueuedList,
      downloadingList: downloadingList ?? this.downloadingList,
      downloadedList: downloadedList ?? this.downloadedList,
      status: status ?? this.status,
    );
  }
}
