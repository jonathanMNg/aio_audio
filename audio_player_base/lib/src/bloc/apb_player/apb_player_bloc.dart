import 'dart:async';
import 'package:audio_player_base/src/model/audio_model.dart';
import 'package:audio_player_base/src/player/audio_player_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';

part 'apb_player_event.dart';
part 'apb_player_state.dart';
part 'apb_player_bloc.freezed.dart';


class ApbPlayerBloc extends Bloc<ApbPlayerEvent, ApbPlayerState> {
  final AudioPlayerHandler _audioPlayerService = GetIt.I<AudioPlayerHandler>();

  ApbPlayerBloc() : super(const ApbPlayerState.initial()) {
    on<ApbPlayerEvent>((event, emit) async {

      Future<void> play() async {
        // await _audioPlayerService.init();
        // add(PlayerEvent.playCollection(AppAudioCollection(audios: [audio]), 0));
      }

      Future<void> pause() async {
        await _audioPlayerService.audioPlayer!.pause();
      }

      Future<void> resume() async {
        await _audioPlayerService.audioPlayer!.play();
      }

      Future<void> stop() async {
        await _audioPlayerService.audioPlayer?.stop();
        await _audioPlayerService.dispose();
        emit(const ApbPlayerState.stopped());
      }

      Future<void> seek(Duration position) async {
        await _audioPlayerService.audioPlayer!.seek(position);
      }

      Future<void> skip(Duration position , Duration duration , Duration skipDuration) async {
        Duration audioDuration = duration;
        Duration skipPos = position + skipDuration;
        if (skipPos < audioDuration && skipPos > const Duration(seconds: 0)) {
          await _audioPlayerService.audioPlayer!.seek(skipPos);
        } else if (skipPos > audioDuration) {
          await _audioPlayerService.audioPlayer!.seek(audioDuration);
        }
        else {
          await _audioPlayerService.audioPlayer!.seek(const Duration(seconds: 0));
        }
      }

      Future<void> next() async {
        await _audioPlayerService.audioPlayer!.seekToNext();
      }

      Future<void> prev() async {
        await _audioPlayerService.audioPlayer!.seekToPrevious();
      }

      Future<void> toggleSpeed(double speed) async {
        await _audioPlayerService.audioPlayer!.setSpeed(speed);
      }

      Future<void> toggleLoop(LoopMode loop) async {
        await _audioPlayerService.audioPlayer!.setLoopMode(loop);
      }

      Future<void> replay() async {
        await _audioPlayerService.audioPlayer!.seek(const Duration(seconds: 0), index: 0);
      }

      await event.when(
          play: play,
          pause: pause,
          resume: resume,
          stop: stop,
          seek: seek,
          skip: skip,
          next: next,
          prev: prev,
          toggleSpeed: toggleSpeed,
          toggleLoop: toggleLoop,
          replay: replay,

      );
    });
  }
}
