import 'package:audio_player_base/audio_player_base.dart';
import 'mock_audio_db.dart';

class ExampleAudioProvider implements ApbAudioProvider<ApbPlayableAudio> {
  final List<ApbUrlPlayableAudio> _mockAudioList = audioList;

  @override
  Future<List<ApbPlayableAudio>> getAll() async {
    return _mockAudioList;
  }

  @override
  Future<void> update(ApbPlayableAudio updatingTrack) async {}

  @override
  Future<List<ApbPlayableAudio>> searchAudios(String query) async {
    return _mockAudioList.where((audio) =>
    (audio.name?.toLowerCase().contains(query.toLowerCase()) ?? false)
    ).toList();
  }

  @override
  Future<void> delete(ApbPlayableAudio deletingAudio) async {}

  @override
  Future<ApbPlayableAudio> get(String audioId) async {
    return _mockAudioList[0];
  }

  @override
  Future<ApbPlayableAudio?> getLastPlayed() async {
    return _mockAudioList[0];
  }
}