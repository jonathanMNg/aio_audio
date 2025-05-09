import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

enum ApbPlayableFileType { file, url, yt, asset }

abstract class ApbPlayableAudio {
  final String? id;
  final String? sourceId;
  final String? playlistId;
  final String? name;
  final String? imageUrl;
  final String? fileUrl;
  final String? filePath;
  final Duration? position;
  final Duration? duration;
  final DateTime? createdAt;
  final ApbPlayableFileType? fileType;
  final List<String>? contributors;

  ApbPlayableAudio({
    this.id,
    this.name,
    this.contributors,
    this.imageUrl,
    this.fileUrl,
    this.filePath,
    this.position,
    this.duration,
    this.fileType,
    this.playlistId,
    this.sourceId,
    this.createdAt,
  });

  AudioSource get audioSource;
  MediaItem get tag => MediaItem(id: sourceId ?? id!, title: name!, artist: contributorsToString, artUri: imageUrl != null ? Uri.parse(imageUrl!) : null);
  String? get contributorsToString => contributors?.join(', ');
  double? get progress {
    if (duration == null) return null;
    return position != null ? position!.inSeconds / duration!.inSeconds : 0;
  }
}

class ApbPlayablePlaylist {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? desc;
  final List<String>? contributors;
  final bool? shouldHide;
  final List<ApbPlayableAudio>? audios;
  final DateTime? lastUpdated;
  final DateTime? lastPlayed;

  ApbPlayablePlaylist({this.shouldHide, this.audios, this.lastUpdated, this.lastPlayed, this.id, this.name, this.imageUrl, this.desc, this.contributors});

  int get count => audios?.length ?? 0;
  DateTime get lastActive => (lastPlayed ?? DateTime(2000)).millisecondsSinceEpoch < _lastUpdated.millisecondsSinceEpoch ? _lastUpdated : lastPlayed!;

  DateTime get _lastUpdated => lastUpdated!;
  String? get contributorsToString => contributors?.join(', ');
}

class ApbUrlPlayableAudio extends ApbPlayableAudio {
  ApbUrlPlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required super.fileUrl,
    super.imageUrl,
    super.position,
    super.duration,
    super.contributors,
    super.playlistId,
    super.createdAt
}): super(filePath: null, fileType: ApbPlayableFileType.url);

  @override
  AudioSource get audioSource {
    return ProgressiveAudioSource(Uri.parse(fileUrl!), tag: tag);
  }
}

class ApbFilePlayableAudio extends ApbPlayableAudio {
  ApbFilePlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required this.savedDir,
    required super.filePath,
    super.imageUrl,
    super.position,
    super.duration,
    super.contributors,
    super.playlistId,
    super.createdAt
  }): super(fileUrl: null, fileType: ApbPlayableFileType.file);
  @override
  AudioSource get audioSource {
    return ProgressiveAudioSource(Uri.parse('$savedDir/${filePath!}'), tag: tag);
  }
  final String savedDir;
}
class ApbAssetPlayableAudio extends ApbPlayableAudio {
  ApbAssetPlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required this.assetStr,
    super.imageUrl,
    super.duration,
    super.position,
    super.contributors,
    super.playlistId,
    super.createdAt
  }): super(fileUrl: null, filePath: null, fileType: ApbPlayableFileType.asset);
  @override
  AudioSource get audioSource {
    return AudioSource.asset(assetStr, tag: tag);
  }
  final String assetStr;
}

// class ApbYtPlayableAudio extends ApbPlayableAudio {
//   ApbYtPlayableAudio({
//     required super.id,
//     super.sourceId,
//     required super.name,
//     required this.ytId,
//     super.imageUrl,
//     super.lastPosInSec,
//     super.durationInSec,
//     super.contributors,
//     super.playlistId
//   }): super(fileUrl: null, filePath: null, fileType: ApbPlayableFileType.asset);
//   @override
//   AudioSource get audioSource {
//     return ResolvingYtAudioSource(uniqueId: ytId, resolveSoundUrl: (ytId) async {
//       Uri? audioUri;
//       final yt = YtExplodeService().ytExplode;
//       if (Platform.isIOS) {
//         final manifest = await yt.videos.streamsClient.getManifest(ytId, ytClients: [YoutubeApiClient.ios]);
//         final audioManifest = manifest.audio.withHighestBitrate();
//         final container = audioManifest.container;
//         if(container.toString() == 'webm') {
//           audioUri = manifest.muxed.withHighestBitrate().url;
//         }
//         else {
//           audioUri = audioManifest.url;
//         }
//       } else {
//         final manifest = await yt.videos.streamsClient.getManifest(ytId);
//         final audioManifest = manifest.audioOnly.withHighestBitrate();
//         audioUri = audioManifest.url;
//       }
//
//       return audioUri;
//     }, tag: tag);
//   }
//   final String ytId;
//
// }