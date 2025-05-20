import 'package:audio_download_manager/audio_download_manager.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'adm_download_list_event.dart';

part 'adm_download_list_state.dart';

class AdmDownloadListBloc
    extends Bloc<AdmDownloadListEvent, AdmDownloadListState> {
  final AdmDownloadListProvider downloadListProvider;
  AdmDownloadListBloc({required this.downloadListProvider})
    : super(
        AdmDownloadListState(
          downloadingList: [],
          downloadedList: [],
          enqueuedList: [],
          status: AdmDownloadListStatus.loading,
        ),
      ) {
    on<AdmLoadDownloadedList>(_onLoadDownloadedList);
    on<AdmClearDownloadedList>(_onClearDownloadedList);
    on<_AdmEnqueueItem>(_onEnqueueItem);
    on<_AdmDownloadItem>(_onDownloadItem);
    on<_AdmCompleteDownload>(_onCompleteDownload);
    on<AdmAddItemToQueue> (_onAddItemToQueue);

    add(AdmLoadDownloadedList());
    FileDownloader().updates.listen(
            (update) {
          switch (update) {
            case TaskStatusUpdate():
              switch (update.status) {
                case TaskStatus.complete:
                  final completeItem = AdmDownloadModel.fromDownloadTask(update.task);
                  add(_AdmCompleteDownload(completeItem));
                  break;
                case TaskStatus.enqueued:
                  final enqueuedItem = AdmDownloadModel.fromDownloadTask(update.task);
                  add(_AdmEnqueueItem(enqueuedItem));
                  break;
                case TaskStatus.running:
                  final downloadingItem = AdmDownloadModel.fromDownloadTask(update.task);
                  add(_AdmDownloadItem(downloadingItem));
                  break;
                case TaskStatus.canceled:
                case TaskStatus.paused:
                case TaskStatus.failed:
                default:
              }
            case TaskProgressUpdate():
              GetIt.I<AdmDownloadItemBloc>().add(AdmAddItemToDownloading(update: update, taskId: update.task.taskId));
          }
        });
  }


  void _onAddItemToQueue(AdmAddItemToQueue event, Emitter<AdmDownloadListState> emit) async {
    final download = event.item;
    String url = download.url!;
    final task = DownloadTask(
        url: url,
        updates: Updates.statusAndProgress,
        taskId: download.id!,
        filename: download.fileName!,
        retries: 3);
    await FileDownloader().enqueue(task);
  }

  void _onDownloadItem(_AdmDownloadItem event, Emitter<AdmDownloadListState> emit) async {

    if(!state.downloadingList.map((e) => e.id).contains(event.item.id)) {
      final downloadingList = List<AdmDownloadModel>.from(state.downloadingList + [event.item]);
      final enqueuedList = List<AdmDownloadModel>.from(state.enqueuedList.where((e) => e.id != event.item.id).toList());
      emit(state.copyWith(downloadingList: downloadingList, enqueuedList: enqueuedList));
    }


  }
  void _onEnqueueItem(_AdmEnqueueItem event, Emitter<AdmDownloadListState> emit) async {
    if(!state.enqueuedList.map((e) => e.id).contains(event.item.id)
        && !state.downloadingList.map((e) => e.id).contains(event.item.id)) {
      final enqueuedList = List<AdmDownloadModel>.from(state.enqueuedList + [event.item]);
      emit(state.copyWith(enqueuedList: enqueuedList));
    }
    
  }

  void _onCompleteDownload(_AdmCompleteDownload event, Emitter<AdmDownloadListState> emit) async {
    final downloadingList = state.downloadingList.where((e) => e.id != event.item.id).toList();
    final downloadedList = List<AdmDownloadModel>.from(state.downloadedList + [event.item]);
    emit(state.copyWith(downloadedList: downloadedList, downloadingList: downloadingList));
  }


  void _onLoadDownloadedList(
    AdmLoadDownloadedList event,
    Emitter<AdmDownloadListState> emit,
  ) async {
    emit(state.copyWith(status: AdmDownloadListStatus.loading));
    final downloadedList = await downloadListProvider.getDownloads();
    emit(state.copyWith(downloadedList: downloadedList, status: AdmDownloadListStatus.loaded));
  }

  void _onClearDownloadedList(
    AdmClearDownloadedList event,
    Emitter<AdmDownloadListState> emit,
  ) async {
    emit(state.copyWith(status: AdmDownloadListStatus.loading));
    await downloadListProvider.clearDownloads();
    emit(state.copyWith(downloadedList: [], status: AdmDownloadListStatus.loaded));
  }

  // Future<void> _init() async {
  //
  // }
}
