part of 'apb_player_bloc.dart';
class ApbPlayerStateStream {
  final AudioPlayer audioPlayer;
  const ApbPlayerStateStream(this.audioPlayer);

  Stream<PlayerState> get playerStateStream => audioPlayer.playerStateStream;
  Stream<PlaybackEvent> get playbackEventStream => audioPlayer.playbackEventStream;
  Stream<Duration?> get durationStream => audioPlayer.durationStream;
  Stream<LoopMode> get loopModeStream => audioPlayer.loopModeStream;
  Stream<Duration> get positionStream => audioPlayer.positionStream;
  Stream<double> get speedStream => audioPlayer.speedStream;
  Stream<int?> get currentIndexStream => audioPlayer.currentIndexStream;
}

@freezed
class ApbPlayerState with _$ApbPlayerState {
  const factory ApbPlayerState.initial() = _Initial;
  const factory ApbPlayerState.startup(ApbPlayableAudio audio) = _Startup;
  const factory ApbPlayerState.loading(ApbPlayableAudio audio, {required ApbPlayerStateStream playerStream}) = _Loading;
  const factory ApbPlayerState.playing(ApbPlayableAudio audio, {required ApbPlayerStateStream playerStream}) = _Playing;
  const factory ApbPlayerState.stopped() = _Stopped;
  const factory ApbPlayerState.error() = _Error;
}
