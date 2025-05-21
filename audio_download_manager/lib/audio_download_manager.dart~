import 'package:audio_download_manager/src/bloc/download_item/adm_download_item_bloc.dart';
import 'package:audio_download_manager/src/service/src/download_service.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:get_it/get_it.dart';

export 'src/bloc/bloc.dart';
export 'src/builder/builder.dart';
export 'src/model/model.dart';
export 'src/service/service.dart';
export 'src/repository/repository.dart';
export 'src/adm_bloc_provider.dart';

class AudioDownloadManager {
  AudioDownloadManager._();
  static AudioDownloadManager? _instance;

  static AudioDownloadManager get instance {
    _instance ??= AudioDownloadManager._();
    return _instance!;
  }

  static Future<void> init() async {
    await AdmDownloadService.instance.configure(
      globalConfig: [
        (Config.holdingQueue, (1, 1, 1)),
        (Config.requestTimeout, const Duration(seconds: 3)),
      ],
    );
    GetIt.I.registerLazySingleton<AdmDownloadItemBloc>(
      () => AdmDownloadItemBloc(),
    );
  }
}
