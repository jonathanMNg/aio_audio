import 'package:audio_player_base/audio_player_base.dart';
import 'mock_audio_db.dart';

class ExamplePlaylistProvider implements ApbPlaylistProvider<ApbPlayablePlaylist> {
  final List<ApbUrlPlayableAudio> _mockAudioList = audioList;
  final ApbPlayablePlaylist _mockPlaylist = mockPlaylist;

  @override
  Future<List<ApbPlayablePlaylist>> getAll() async {
    return [_mockPlaylist];
  }

  @override
  Future<ApbPlayablePlaylist> get(String playlistId) async {
    return _mockPlaylist;
  }

  @override
  Future<void> create(ApbPlayablePlaylist playlist) async {}

  @override
  Future<void> delete(ApbPlayablePlaylist deletePlaylist) async {}

  @override
  Future<void> update(ApbPlayablePlaylist playlist) async {}

  @override
  Future<void> add(ApbPlayablePlaylist playlist, List<ApbPlayableAudio> tracks) async {}

  @override
  Future<void> addToMultiple(List<ApbPlayablePlaylist> playlistsList, ApbPlayableAudio audio) async {}

  @override
  Future<void> remove(ApbPlayableAudio audio) async {}
} 