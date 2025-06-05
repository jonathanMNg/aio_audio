
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

  Future<void> addAudio(String playlistId,
      ApbPlayableAudio audio) {
    throw UnimplementedError();
  }
  Future<void> insertAudio(int index, ApbPlayablePlaylist playlist,
      ApbPlayableAudio audio) {
    throw UnimplementedError();
  }

  Future<void> removeAudio(ApbPlayableAudio audio) {
    throw UnimplementedError();
  }
}