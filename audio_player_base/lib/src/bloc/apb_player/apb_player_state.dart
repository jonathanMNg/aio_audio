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
  Stream<bool> get hasNextStream => audioPlayer.hasNextStream;
  Stream<bool> get hasPreviousStream => audioPlayer.hasPreviousStream;
  Stream<bool> get shuffleModeEnabledStream => audioPlayer.shuffleModeEnabledStream;
  Stream<List<int>> get shuffleIndicesStream => audioPlayer.shuffleIndicesStream;
}

abstract class ApbPlayerState extends Equatable {
  const ApbPlayerState();

  @override
  List<Object?> get props => [];
}

class ApbInitialState extends ApbPlayerState {
  const ApbInitialState();
}

class ApbStartupState extends ApbPlayerState {
  final ApbPlayableAudio audio;

  const ApbStartupState(this.audio);

  @override
  List<Object?> get props => [audio];
}

class ApbLoadingState extends ApbPlayerState {
  final ApbPlayableAudio audio;
  final ApbPlayerStateStream playerStream;

  const ApbLoadingState({required this.audio, required this.playerStream});

  @override
  List<Object?> get props => [audio, playerStream];
}

class ApbPlayingState extends ApbPlayerState {
  final ApbPlayableAudio audio;
  final ApbPlayerStateStream playerStream;
  const ApbPlayingState({required this.audio, required this.playerStream});

  @override
  List<Object?> get props => [audio, playerStream];
}

class ApbStoppedState extends ApbPlayerState {
  const ApbStoppedState();
}

class ApbErrorState extends ApbPlayerState {
  const ApbErrorState();
}
