
import 'package:audio_player_base/audio_player_base.dart';

abstract interface class ApbPlaylistProvider<T extends ApbPlayablePlaylist> {

  Future<List<T>> getAll() {
    throw UnimplementedError();
  }

  Future<void> create(ApbPlayablePlaylist playlist) {
    throw UnimplementedError();
  }

  Future<void> delete(ApbPlayablePlaylist deletePlaylist) {
    throw UnimplementedError();
  }

  Future<void> update(ApbPlayablePlaylist playlist) {
    throw UnimplementedError();
  }

  Future<T> get(String playlistId) {
    throw UnimplementedError();
  }

  Future<void> add(ApbPlayablePlaylist playlist,
      ApbPlayableAudio audio) {
    throw UnimplementedError();
  }
  Future<void> insert(int index, ApbPlayablePlaylist playlist,
      ApbPlayableAudio audio) {
    throw UnimplementedError();
  }

  Future<void> addToMultiple(List<String> playlistIds,
      ApbPlayableAudio audio) {
    throw UnimplementedError();
  }

  Future<void> remove(ApbPlayableAudio audio) {
    throw UnimplementedError();
  }
}