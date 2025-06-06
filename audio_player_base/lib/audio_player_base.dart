import 'dart:io';

import 'package:audio_player_base/src/bloc/apb_player/apb_player_bloc.dart';
import 'package:audio_player_base/src/bloc/apb_timer/apb_timer_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

import 'audio_player_base.dart';

// export 'src/bloc/bloc.dart';
export 'src/builder/builder.dart';
export 'src/model/audio_model.dart';
export 'src/player/audio_player_handler.dart';
export 'src/service/yt_service.dart';
export 'src/component/component.dart';
export 'src/repository/repository.dart';
export 'src/wrapper/wrapper.dart';
export 'src/bloc_provider/bloc_provider.dart';

typedef ApbAudioPositionTrackerCallback =
    void Function(String audioId, Duration position, Duration duration);

class AudioPlayerBase {
  String? _saveDirectory;
  AudioPlayerBase._internal();

  static final AudioPlayerBase _instance = AudioPlayerBase._internal();

  factory AudioPlayerBase() => _instance;

  static Future<void> init({
    String? saveDirectory,
    required String androidNotificationChannelId,
    ApbAudioPositionTrackerCallback? apbAudioPositionTrackerCallback,
    required ApbPlaylistProvider playlistProvider,
    required ApbAudioProvider audioProvider,
  }) async {

    if (saveDirectory != null) {
      final directoryFullPath =
          '${await _instance._directoryPath}/$saveDirectory';
      try {
        await Directory(directoryFullPath).create(recursive: true);
        _instance._saveDirectory = directoryFullPath;
      } catch (e) {
        throw Exception(
          'Failed to create directory: $e. Make sure the directory path is valid and not exist.',
        );
      }
    } else {
      _instance._saveDirectory = await _instance._directoryPath;
    }
    GetIt.I.registerLazySingleton<ApbAudioPlayerHandler>(
      () => ApbAudioPlayerHandler(),
    );
    GetIt.I.registerLazySingleton<ApbTimerCubit>(() => ApbTimerCubit());
    GetIt.I.registerLazySingleton<ApbPlayerBloc>(() => ApbPlayerBloc(playlistProvider: playlistProvider, audioProvider: audioProvider));
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory:
          kIsWeb
              ? HydratedStorageDirectory.web
              : HydratedStorageDirectory(
                (await getApplicationDocumentsDirectory()).path,
              ),
    );
    JustAudioBackground.init(
      androidNotificationChannelId: androidNotificationChannelId,
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
      handlePlayerChanged: (mediaItemStream, positionStream) {
        final Stream<Duration?>? throttledPositionStream = positionStream
            ?.throttleTime(Duration(seconds: 2));
        if (mediaItemStream != null && throttledPositionStream != null) {
          final audioTrackerStream = Rx.combineLatest2(
            mediaItemStream,
            throttledPositionStream,
            (mediaItem, position) => (mediaItem, position),
          );

          audioTrackerStream.listen((event) async {
            final (mediaItem, position) = event;
            if (mediaItem != null &&
                position != null &&
                mediaItem.duration != null &&
                position.compareTo(Duration.zero) > 0 &&
                mediaItem.duration!.compareTo(Duration.zero) > 0) {
              apbAudioPositionTrackerCallback?.call(
                mediaItem.id,
                position,
                mediaItem.duration!,
              );
            }
          });
        }

        throttledPositionStream?.listen((position) async {
          if (sleepTimer != null && sleepTimer!.value != null) {
            if ((sleepTimer?.value ?? DateTime.now()).compareTo(
                  DateTime.now(),
                ) <=
                0) {
              GetIt.I<ApbTimerCubit>().stopTimer();
              GetIt.I<ApbAudioPlayerHandler>().audioPlayer?.pause();
            }
          }
        });
        // playerPositionMediaItemCallback?.call(mediaItemStream, throttledPositionStream);
      },
    );
  }

  static void playAudio(ApbPlayableAudio audio) {
    GetIt.I<ApbPlayerBloc>().add(ApbPlayAudioEvent(audio));
  }

  static void playCustomSource(ApbPlayableAudio audio, ApbPlayablePlaylist playlist) {
    GetIt.I<ApbPlayerBloc>().add(ApbPlayCustomSourceEvent(audio: audio, playlist: playlist));
  }

  static void playPlaylist(ApbPlayablePlaylist playlist) {
    GetIt.I<ApbPlayerBloc>().add(ApbPlayPlaylistEvent(playlist));
  }

  static void pause() {
    GetIt.I<ApbPlayerBloc>().add(ApbPauseEvent());
  }

  static void stop() {
    GetIt.I<ApbPlayerBloc>().add(ApbStopPlayerEvent());
  }

  static void replay() {
    GetIt.I<ApbPlayerBloc>().add(ApbReplayEvent());
  }

  static void resume() {
    GetIt.I<ApbPlayerBloc>().add(ApbResumeEvent());
  }

  String get saveDirectory {
    _ensureInitialized();
    return _saveDirectory!;
  }

  void _ensureInitialized() {
    if (_instance._saveDirectory == null) {
      throw Exception(
        'AioImageProvider is not initialized. Call AioImageProvider.init() first.',
      );
    }
  }

  Future<String> get _directoryPath async {
    Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
