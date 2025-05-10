import 'dart:async';
import 'package:audio_player_base/src/model/audio_model.dart';
import 'package:audio_player_base/src/player/audio_player_handler.dart';
import 'package:audio_player_base/src/repository/src/audio_provider.dart';
import 'package:audio_player_base/src/repository/src/playlist_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:just_audio/just_audio.dart';
export 'package:just_audio/just_audio.dart' show LoopMode;
part 'apb_player_event.dart';
part 'apb_player_state.dart';

class ApbPlayerBloc extends HydratedBloc<ApbPlayerEvent, ApbPlayerState> {
  final ApbPlaylistProvider playlistProvider;
  final ApbAudioProvider audioProvider;
  final AudioPlayerHandler _audioPlayerService = AudioPlayerHandler();

  ApbPlayerBloc({required this.playlistProvider, required this.audioProvider}) : super(const ApbInitialState()) {
    on<ApbPlayPlaylistEvent>(_onPlayPlaylist);
    on<ApbPlayAudioEvent>(_onPlayAudio);
    on<ApbPauseEvent>(_onPause);
    on<ApbResumeEvent>(_onResume);
    on<ApbStopEvent>(_onStop);
    on<ApbSeekEvent>(_onSeek);
    on<ApbSkipEvent>(_onSkip);
    on<ApbNextEvent>(_onNext);
    on<ApbPrevEvent>(_onPrev);
    on<ApbToggleSpeedEvent>(_onToggleSpeed);
    on<ApbToggleLoopEvent>(_onToggleLoop);
    on<ApbReplayEvent>(_onReplay);
    on<ApbToggleShuffleEvent>(_onToggleShuffle);
    on<ApbInitStartUpEvent>(_onInitStartUp);
  }

  Future<void> _onInitStartUp(ApbInitStartUpEvent event, Emitter<ApbPlayerState> emit) async {
    emit(const ApbStoppedState());
  }
  Future<void> _onToggleShuffle(ApbToggleShuffleEvent event, Emitter<ApbPlayerState> emit) async {
    final currentShuffleMode = _audioPlayerService.audioPlayer!.shuffleModeEnabled;
    await _audioPlayerService.audioPlayer!.setShuffleModeEnabled(!currentShuffleMode);
  }
  Future<void> _onPlayPlaylist(ApbPlayPlaylistEvent event, Emitter<ApbPlayerState> emit) async {
    await _handlePlay(emit, playlist: event.playlist);
  }

  Future<void> _onPlayAudio(ApbPlayAudioEvent event, Emitter<ApbPlayerState> emit) async {
    await _handlePlay(emit, audio: event.audio);
  }

  Future<void> _handlePlay( Emitter<ApbPlayerState> emit, {ApbPlayableAudio? audio, ApbPlayablePlaylist? playlist}) async {

    try {
      await _audioPlayerService.init();
      final playerStream = ApbPlayerStateStream(_audioPlayerService.audioPlayer!);
      ApbPlayableAudio? selectedAudio;
      ApbPlayablePlaylist? selectedPlaylist;
      List<ApbPlayableAudio> tracks = [];
      int? trackIndex;
      if(audio != null) {
        selectedAudio = audio;
        emit(ApbLoadingState(playerStream: playerStream, audio: selectedAudio ));
        selectedPlaylist = await playlistProvider.get(selectedAudio.playlistId!);
        tracks = selectedPlaylist.audios ?? [];
        }
      else if(playlist != null) {
        selectedAudio = playlist.audios![0];
        emit(ApbLoadingState(playerStream: playerStream, audio: selectedAudio ));
        selectedPlaylist = playlist;
        tracks = selectedPlaylist.audios ?? [];
      }
      trackIndex = tracks.indexWhere((element) => element.id == selectedAudio!.id);
      await _audioPlayerService.processAudioTrack(tracks: tracks);
      Duration initialPos = selectedAudio!.position ?? Duration.zero;
      if(initialPos.inSeconds + 10 >= (selectedAudio.duration?.inSeconds ?? 0)) {
        initialPos = Duration.zero;
      }
      await _audioPlayerService.audioPlayer!.setAudioSources(_audioPlayerService.audioSources, initialIndex: trackIndex, initialPosition: initialPos);

      _audioPlayerService.audioPlayer!.play();
      emit(ApbPlayingState(audio: selectedAudio, playerStream: playerStream));
    }
    catch (e) {
      if(kDebugMode) {
        rethrow;
      }
      else {
        add(ApbStopEvent());
      }
    }
  }

  Future<void> _onPause(ApbPauseEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.pause();
  }

  Future<void> _onResume(ApbResumeEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.play();
  }

  Future<void> _onStop(ApbStopEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer?.stop();
    await _audioPlayerService.dispose();
    emit(const ApbStoppedState());
  }

  Future<void> _onSeek(ApbSeekEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.seek(event.position);
  }

  Future<void> _onSkip(ApbSkipEvent event, Emitter<ApbPlayerState> emit) async {
    Duration audioDuration = event.duration;
    Duration skipPos = event.position + event.skipDuration;
    if (skipPos < audioDuration && skipPos > const Duration(seconds: 0)) {
      await _audioPlayerService.audioPlayer!.seek(skipPos);
    } else if (skipPos > audioDuration) {
      await _audioPlayerService.audioPlayer!.seek(audioDuration);
    } else {
      await _audioPlayerService.audioPlayer!.seek(const Duration(seconds: 0));
    }
  }

  Future<void> _onNext(ApbNextEvent event, Emitter<ApbPlayerState> emit) async {
    if(_audioPlayerService.audioPlayer!.hasNext) {
      final playerStream = ApbPlayerStateStream(_audioPlayerService.audioPlayer!);
      final futureIndex = _audioPlayerService.audioPlayer!.nextIndex;
      final selectedAudio = _audioPlayerService.playlist[futureIndex!];

      emit(ApbLoadingState(audio: selectedAudio, playerStream: playerStream));
      await _audioPlayerService.audioPlayer!.seekToNext();
      emit(ApbPlayingState(audio: selectedAudio, playerStream: playerStream));
    }

  }

  Future<void> _onPrev(ApbPrevEvent event, Emitter<ApbPlayerState> emit) async {

    if(_audioPlayerService.audioPlayer!.hasPrevious) {
      final playerStream = ApbPlayerStateStream(_audioPlayerService.audioPlayer!);
      final futureIndex = _audioPlayerService.audioPlayer!.previousIndex;
      final selectedAudio = _audioPlayerService.playlist[futureIndex!];
      emit(ApbLoadingState(audio: selectedAudio, playerStream: playerStream));
      await _audioPlayerService.audioPlayer!.seekToPrevious();
      emit(ApbPlayingState(audio: selectedAudio, playerStream: playerStream));
    }
  }

  Future<void> _onToggleSpeed(ApbToggleSpeedEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.setSpeed(event.speed);
  }

  Future<void> _onToggleLoop(ApbToggleLoopEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.setLoopMode(event.loopMode);
  }

  Future<void> _onReplay(ApbReplayEvent event, Emitter<ApbPlayerState> emit) async {
    await _audioPlayerService.audioPlayer!.seek(const Duration(seconds: 0), index: 0);
  }

  @override
  ApbPlayerState fromJson(Map<String, dynamic> json) {
    try {
      final String stateType = json['type'] as String;
      final Map<String, dynamic> audioJson = json['audio'] as Map<String, dynamic>;
      ApbPlayableAudio audio = ApbPlayableAudio.fromJson(audioJson);

      switch (stateType) {
        case 'startup':
          return ApbStartupState(audio) as ApbPlayerState;

        case 'loading':
          return ApbLoadingState(
            audio: audio,
            playerStream: ApbPlayerStateStream(_audioPlayerService.audioPlayer!),
          );

        case 'playing':
          return ApbPlayingState(
            audio: audio,
            playerStream: ApbPlayerStateStream(_audioPlayerService.audioPlayer!),
          );

        case 'stopped':
          print('stopped');
          return const ApbStoppedState() as ApbPlayerState;

        case 'error':
          return const ApbErrorState();

        default:
          return const ApbErrorState();
      }
    } catch (e) {
      if(kDebugMode) {
        rethrow;
      }
      else {
        return const ApbErrorState();
      }
    }
  }

  @override
  Map<String, dynamic>? toJson(ApbPlayerState state) {
    try {

      if (state is ApbStartupState) {
        return {
          'type': 'startup',
          'audio': state.audio.toJson(),
        };
      }

      if (state is ApbLoadingState) {
        return {
          'type': 'loading',
          'audio': state.audio.toJson(),
          // Note: playerStream is not serialized as it contains non-serializable AudioPlayer
        };
      }

      if (state is ApbPlayingState) {
        return {
          'type': 'playing',
          'audio': state.audio.toJson(),
          // Note: playerStream is not serialized as it contains non-serializable AudioPlayer
        };
      }

      if (state is ApbStoppedState) {
        return {'type': 'stopped'};
      }

      if (state is ApbErrorState) {
        return {'type': 'error'};
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
