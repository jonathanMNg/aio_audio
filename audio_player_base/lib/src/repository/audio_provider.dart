import 'package:audio_player_base/audio_player_base.dart';


abstract interface class ApbAudioProvider<T extends ApbPlayableAudio> {

  Future<List<T>> getAll() {
    throw UnimplementedError();
  }

  Future<void> update(ApbPlayableAudio updatingTrack) {
    throw UnimplementedError();
  }

  Future<List<T>> searchAudios(String query) {
    throw UnimplementedError();
  }

  Future<void> delete(ApbPlayableAudio deletingAudio) {
    throw UnimplementedError();
  }

}