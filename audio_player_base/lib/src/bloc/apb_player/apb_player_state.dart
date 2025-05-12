part of 'apb_player_bloc.dart';

enum ApbPlayerStateStatus { startUp,  loading, playing, stopped, error, idle }

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
