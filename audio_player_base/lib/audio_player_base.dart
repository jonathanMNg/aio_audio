import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

export 'src/bloc/apb_player/apb_player_bloc.dart';
export 'src/builder/stream_builder.dart';
export 'src/model/audio_model.dart';
export 'src/player/audio_player_handler.dart';
export 'src/service/yt_service.dart';
export 'src/component/component.dart';
export 'src/repository/repository.dart';

class AudioPlayerBase {
  AudioPlayerBase._();

  static final instance = AudioPlayerBase._();

  Future<void> init() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getApplicationDocumentsDirectory()).path),
    );
  }


}
