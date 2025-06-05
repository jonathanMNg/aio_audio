part of 'apb_player_bloc.dart';

abstract class ApbPlayerEvent extends Equatable {
  const ApbPlayerEvent();

  @override
  List<Object?> get props => [];
}

class ApbPlayPlaylistEvent extends ApbPlayerEvent {
  final ApbPlayablePlaylist playlist;
  const ApbPlayPlaylistEvent(this.playlist);
}
class ApbPlayAudioEvent extends ApbPlayerEvent {
  final ApbPlayableAudio audio;
  const ApbPlayAudioEvent(this.audio);
}

class ApbPlayCustomSourceEvent extends ApbPlayerEvent {
  final ApbPlayableAudio audio;
  final ApbPlayablePlaylist playlist;

  const ApbPlayCustomSourceEvent({required this.audio, required this.playlist});
}

class ApbPauseEvent extends ApbPlayerEvent {
  const ApbPauseEvent();
}

class ApbResumeEvent extends ApbPlayerEvent {
  const ApbResumeEvent();
}

class ApbStopPlayerEvent extends ApbPlayerEvent {
  const ApbStopPlayerEvent();
}

class ApbNextEvent extends ApbPlayerEvent {
  const ApbNextEvent();
}

class ApbPrevEvent extends ApbPlayerEvent {
  const ApbPrevEvent();
}

class ApbReplayEvent extends ApbPlayerEvent {
  const ApbReplayEvent();
}

class ApbSeekEvent extends ApbPlayerEvent {
  final Duration position;
  const ApbSeekEvent(this.position);
}

class ApbSkipEvent extends ApbPlayerEvent {
  final Duration position;
  final Duration duration;
  final Duration skipDuration;

  const ApbSkipEvent(this.position, this.duration, this.skipDuration);

  @override
  List<Object?> get props => [position, duration, skipDuration];
}

class ApbToggleSpeedEvent extends ApbPlayerEvent {
  final double speed;

  const ApbToggleSpeedEvent(this.speed);

  @override
  List<Object?> get props => [speed];
}

class ApbToggleLoopEvent extends ApbPlayerEvent {
  final LoopMode loopMode;

  const ApbToggleLoopEvent(this.loopMode);

  @override
  List<Object?> get props => [loopMode];
}

class ApbToggleShuffleEvent extends ApbPlayerEvent {
  const ApbToggleShuffleEvent();
}

class ApbInitStartUpEvent extends ApbPlayerEvent {
  const ApbInitStartUpEvent();
}

class ApbAddAudioEvent extends ApbPlayerEvent {
  final ApbPlayableAudio audio;
  final int? index;

  const ApbAddAudioEvent(this.audio, {this.index});

  @override
  List<Object?> get props => [audio, index];
}