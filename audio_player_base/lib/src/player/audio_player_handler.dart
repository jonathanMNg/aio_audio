import 'package:audio_player_base/audio_player_base.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler {
  static final AudioPlayerHandler _instance = AudioPlayerHandler._internal();

  AudioPlayer? _audioPlayer;
  final List<ApbPlayableAudio> _playlist = [];

  AudioPlayerHandler._internal();

  factory AudioPlayerHandler() {
    return _instance;
  }

  AudioPlayer? get audioPlayer => _audioPlayer;
  List<ApbPlayableAudio> get playlist => _playlist;
  List<AudioSource> get audioSources => _playlist.map((e) => e.audioSource).toList();

  Future<void> init() async {
    await _audioPlayer?.stop();
    _playlist.clear();
    _audioPlayer ??= AudioPlayer(useProxyForRequestHeaders: false);
  }

  Future<void> removeAudio(ApbPlayableAudio deleteAudio, {int? index}) async {
    if(index != null && index < _playlist.length) {
      _playlist.removeAt(index);
      _audioPlayer?.removeAudioSourceAt(index);
    }
    else {
      final removeIndex = _playlist.indexWhere((audio) => audio.id == deleteAudio.id);
      _audioPlayer?.removeAudioSourceAt(removeIndex);
      _playlist.removeAt(removeIndex);
    }

    // for (int i = 0; i < _playlist.length; i++) {
    //   final auSource = _playlist[i];
    //   final tag = auSource.sequence.single.tag!;
    //   if (tag.id == trackId) {
    //     _playlist.removeAt(i);
    //     break;
    //   }
    // }
  }

  Future<void> insertAudio(ApbPlayableAudio audio, {int? index}) async {
    if(index != null && index < _playlist.length) {
      _playlist.insert(index, audio);
      _audioPlayer?.insertAudioSource(index, audio.audioSource);
    }
    else {
      _playlist.add(audio);
      _audioPlayer?.addAudioSource(audio.audioSource);
    }


    // for (final track in tracks) {
    //   if (track.filePath != null) {
    //     _playlist.add(track);
    //   }
    // }
  }

  Future<void> dispose() async {
    await _audioPlayer?.stop();
    await _audioPlayer?.dispose();
    _audioPlayer = null;
    _playlist.clear();
  }

  Future<void> processAudioTrack({required List<ApbPlayableAudio> tracks}) async {
    _playlist.clear();
    for (final track in tracks) {
      _playlist.add(track);
    }
  }
}