import 'package:background_downloader/background_downloader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'adm_download_item_event.dart';
part 'adm_download_item_state.dart';

class AdmDownloadItemBloc extends Bloc<AdmDownloadItemEvent, AdmDownloadItemState> {
  AdmDownloadItemBloc() : super(AdmDownloadItemInitial()) {
    on<AdmAddItemToDownloading>(_onAddItemToDownloading);
  }

  void _onAddItemToDownloading(AdmAddItemToDownloading event, Emitter<AdmDownloadItemState> emit) {
    emit(AdmDownloadItemLoaded(event.update));
  }
}
