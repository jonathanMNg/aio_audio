import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

import '../service/yt_service.dart';

enum ApbPlayableFileType { file, url, yt, asset }

abstract class ApbPlayableAudio {
  final String? id;
  final String? sourceId;
  final String? playlistId;
  final String? name;
  final String? imageUrl;
  final String? fileUrl;
  final String? filePath;
  final int? lastPosInSec;
  final int? durationInSec;
  final ApbPlayableFileType? fileType;
  final List<String>? contributors;

  ApbPlayableAudio({
    this.id,
    this.name,
    this.contributors,
    this.imageUrl,
    this.fileUrl,
    this.filePath,
    this.lastPosInSec,
    this.durationInSec,
    this.fileType,
    this.playlistId,
    this.sourceId
  });

  AudioSource get audioSource;
  MediaItem get tag => MediaItem(id: sourceId ?? id!, title: name!, artist: contributorsToString, artUri: imageUrl != null ? Uri.parse(imageUrl!) : null);
  String? get contributorsToString => contributors?.join(', ');
}

abstract class ApbPlayablePlaylist {
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

  int get count;
  Duration get duration => Duration(seconds: audios?.fold(0,(prev, e) => (prev ?? 0) + (e.durationInSec ?? 0)) ?? 0);
  DateTime get lastActive => (lastPlayed ?? DateTime(2000)).millisecondsSinceEpoch < _lastUpdated.millisecondsSinceEpoch ? _lastUpdated : lastPlayed!;

  DateTime get _lastUpdated => lastUpdated!;
  String? get contributorsToString => contributors?.join(', ');
}

class ApbUrlPlayableAudio extends ApbPlayableAudio {
  ApbUrlPlayableAudio({
    required super.id,
    required super.name,
    required super.fileUrl,
    super.imageUrl,
    super.sourceId,
    super.lastPosInSec,
    super.durationInSec,
    super.contributors,
    super.playlistId
}): super(filePath: null, fileType: ApbPlayableFileType.url);

  @override
  AudioSource get audioSource {
    return ProgressiveAudioSource(Uri.parse(fileUrl!), tag: tag);
  }
}
class ApbFilePlayableAudio extends ApbPlayableAudio {
  ApbFilePlayableAudio({
    required super.id,
    required super.name,
    required this.savedDir,
    required super.filePath,
    super.imageUrl,
    super.sourceId,
    super.lastPosInSec,
    super.durationInSec,
    super.contributors,
    super.playlistId
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
    required super.name,
    required this.assetStr,
    super.imageUrl,
    super.sourceId,
    super.lastPosInSec,
    super.durationInSec,
    super.contributors,
    super.playlistId
  }): super(fileUrl: null, filePath: null, fileType: ApbPlayableFileType.asset);
  @override
  AudioSource get audioSource {
    return AudioSource.asset(assetStr, tag: tag);
  }
  final String assetStr;
}

class ApbYtPlayableAudio extends ApbPlayableAudio {
  ApbYtPlayableAudio({
    required super.id,
    required super.name,
    required this.ytId,
    super.imageUrl,
    super.sourceId,
    super.lastPosInSec,
    super.durationInSec,
    super.contributors,
    super.playlistId
  }): super(fileUrl: null, filePath: null, fileType: ApbPlayableFileType.asset);
  @override
  AudioSource get audioSource {
    return ResolvingYtAudioSource(uniqueId: ytId, resolveSoundUrl: (ytId) async {
      Uri? audioUri;
      final yt = YtExplodeService().ytExplode;
      if (Platform.isIOS) {
        final manifest = await yt.videos.streamsClient.getManifest(ytId, ytClients: [YoutubeApiClient.ios]);
        final audioManifest = manifest.audio.withHighestBitrate();
        final container = audioManifest.container;
        if(container.toString() == 'webm') {
          audioUri = manifest.muxed.withHighestBitrate().url;
        }
        else {
          audioUri = audioManifest.url;
        }
      } else {
        final manifest = await yt.videos.streamsClient.getManifest(ytId);
        final audioManifest = manifest.audioOnly.withHighestBitrate();
        audioUri = audioManifest.url;
      }

      return audioUri;
    }, tag: tag);
  }
  final String ytId;

}

//