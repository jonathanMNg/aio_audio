part of 'apb_player_bloc.dart';

@freezed
abstract class ApbPlayerEvent with _$ApbPlayerEvent {
  const factory ApbPlayerEvent.play() = _Play;
  const factory ApbPlayerEvent.playCollection(ApbPlayablePlaylist playlist, int index) = _PlayCollection;
  const factory ApbPlayerEvent.pause() = _Pause;
  const factory ApbPlayerEvent.resume() = _Resume;
  const factory ApbPlayerEvent.stop() = _Stop;
  const factory ApbPlayerEvent.next() = _Next;
  const factory ApbPlayerEvent.prev() = _Prev;
  const factory ApbPlayerEvent.replay() = _Replay;
  const factory ApbPlayerEvent.seek(Duration position) = _Seek;
  const factory ApbPlayerEvent.skip(Duration position, Duration duration, Duration skipDuration) = _Skip;
  const factory ApbPlayerEvent.toggleSpeed(double speed) = _ToggleSpeed;
  const factory ApbPlayerEvent.toggleLoop(LoopMode loopMode) = _ToggleLoop;
}
