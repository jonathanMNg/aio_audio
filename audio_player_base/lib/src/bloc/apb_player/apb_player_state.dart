part of 'apb_player_bloc.dart';
class ApbPlayerStateStream {
  static ApbPlayerStateStream? _instance;
  final AudioPlayer audioPlayer;

  ApbPlayerStateStream._(this.audioPlayer);

  static ApbPlayerStateStream getInstance(AudioPlayer player) {
    _instance ??= ApbPlayerStateStream._(player);
    return _instance!;
  }

  static void dispose() {
    _instance = null;
  }

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

enum ApbPlayerStateStatus { startUp, stopped, playing, paused, loading, error, idle }

class ApbPlayerState extends Equatable {
  final ApbPlayerStateStatus? status;
  final ApbPlayableAudio? initialAudio;
  final ApbPlayablePlaylist? playlist;
  final ApbPlayerStateStream? playerStream;
  final LoopMode loopMode;
  final bool shuffleModeEnabled ;
  final double speed;
  const ApbPlayerState({this.status, this.initialAudio, this.playlist, this.playerStream, this.loopMode = LoopMode.off, this.shuffleModeEnabled = false, this.speed = 1.0, });

  @override
  List<Object?> get props => [status, initialAudio, playerStream, playlist, loopMode, shuffleModeEnabled, speed];

  ApbPlayerState copyWith({
    ApbPlayerStateStatus? status,
    ApbPlayablePlaylist? playlist,
    ApbPlayableAudio? initialAudio,
    ApbPlayerStateStream? playerStream,
    LoopMode? loopMode,
    bool? shuffleModeEnabled,
    double? speed
  }) {
    return ApbPlayerState(
      status: status ?? this.status,
      initialAudio: initialAudio ?? this.initialAudio,
      playlist: playlist ?? this.playlist,
      playerStream: playerStream ?? this.playerStream,
      loopMode: loopMode ?? this.loopMode,
      shuffleModeEnabled: shuffleModeEnabled ?? this.shuffleModeEnabled,
      speed: speed ?? this.speed
    );
  }
}

//
// abstract class ApbPlayerState extends Equatable {
//   const ApbPlayerState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class ApbInitialState extends ApbPlayerState {
//   const ApbInitialState();
// }
//
// class ApbStartupState extends ApbPlayerState {
//   final ApbPlayableAudio audio;
//
//   const ApbStartupState(this.audio);
//
//   @override
//   List<Object?> get props => [audio];
// }
//
// class ApbLoadingState extends ApbPlayerState {
//   final ApbPlayableAudio audio;
//   final ApbPlayerStateStream playerStream;
//
//   const ApbLoadingState({required this.audio, required this.playerStream});
//
//   @override
//   List<Object?> get props => [audio, playerStream];
// }
//
// class ApbPlayingState extends ApbPlayerState {
//   final ApbPlayableAudio audio;
//   final ApbPlayerStateStream playerStream;
//   const ApbPlayingState({required this.audio, required this.playerStream});
//
//   @override
//   List<Object?> get props => [audio, playerStream];
// }
//
// class ApbStoppedState extends ApbPlayerState {
//   const ApbStoppedState();
// }
//
// class ApbErrorState extends ApbPlayerState {
//   const ApbErrorState();
// }
