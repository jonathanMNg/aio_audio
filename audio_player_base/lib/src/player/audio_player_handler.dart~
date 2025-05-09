import 'package:audio_player_base/audio_player_base.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler {
  static final AudioPlayerHandler _instance = AudioPlayerHandler._internal();

  AudioPlayer? _audioPlayer;
  final List<AudioSource> _audioSources = [];

  AudioPlayerHandler._internal();

  factory AudioPlayerHandler() {
    return _instance;
  }

  AudioPlayer? get audioPlayer => _audioPlayer;
  List<AudioSource> get audioSources => _audioSources;

  Future<void> init() async {
    await _audioPlayer?.stop();
    _audioSources.clear();
    _audioPlayer ??= AudioPlayer(useProxyForRequestHeaders: false);
  }

  void deleteTrackFromQueue(String trackId) {
    for (int i = 0; i < _audioSources.length; i++) {
      final auSource = _audioSources[i];
      final tag = auSource.sequence.single.tag!;
      if (tag.id == trackId) {
        _audioSources.removeAt(i);
        break;
      }
    }
  }

  void addTracksToQueue(List<ApbPlayableAudio> tracks) {
    for (final track in tracks) {
      if (track.filePath != null) {
        _audioSources.add(track.audioSource);
      }
    }
  }

  Future<void> dispose() async {
    await _audioPlayer?.stop();
    await _audioPlayer?.dispose();
    _audioPlayer = null;
    _audioSources.clear();
  }

  Future<void> processAudioTrack({required List<ApbPlayableAudio> tracks}) async {
    _audioSources.clear();
    for (final track in tracks) {
      _audioSources.add(track.audioSource);
    }
  }
}