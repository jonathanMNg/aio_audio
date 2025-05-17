import 'package:audio_download_manager/src/bloc/bloc.dart';
import 'package:background_downloader/background_downloader.dart';
import 'package:get_it/get_it.dart';

export 'src/bloc/bloc.dart';
export 'src/builder/builder.dart';
export 'src/model/model.dart';
export 'src/service/service.dart';
export 'src/repository/repository.dart';

class AudioDownloadManager {
  AudioDownloadManager._();
  
  static AudioDownloadManager? _instance;

  static AudioDownloadManager get instance {
    _instance ??= AudioDownloadManager._();
    return _instance!;
  }

  static Future<void> init() async {
    FileDownloader().
    configure(globalConfig:
    [(Config.holdingQueue, (1, 1, 1)), (Config.requestTimeout, const Duration(seconds: 3))]);
    GetIt.I.registerLazySingleton<AdmDownloadItemBloc>(() => AdmDownloadItemBloc());

  }

}
