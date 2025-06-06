import 'package:audio_player_base/audio_player_base.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'audio_model.g.dart';

enum ApbPlayableFileType {
  @JsonValue('file')
  file,
  @JsonValue('url')
  url,
  @JsonValue('yt')
  yt,
  @JsonValue('unknown')
  unknown,
  @JsonValue('asset')
  asset,
}

abstract class ApbPlayableAudio {
  final String? id;
  final String? sourceId;
  final String? playlistId;
  final String? name;
  final String? imageUrl;
  final String? imagePath;
  final String? fileUrl;
  final String? filePath;
  final Duration? position;
  final Duration? duration;
  final DateTime? createdAt;
  final ApbPlayableFileType? fileType;
  final List<String>? contributors;

  ApbPlayableAudio({
    this.id,
    this.sourceId,
    this.name,
    this.contributors,
    this.imageUrl,
    this.imagePath,
    this.fileUrl,
    this.filePath,
    this.position,
    this.duration,
    this.fileType,
    this.playlistId,
    this.createdAt,
  });

  AudioSource get audioSource;

  MediaItem get tag => MediaItem(
    id: sourceId ?? id!,
    title: name!,
    artist: contributorsToString,
    artUri: imageUrl != null ? Uri.parse(imageUrl!) : null,
  );

  String? get contributorsToString => contributors?.join(', ');

  double? get progress {
    if (duration == null) return null;
    return position != null ? position!.inSeconds / duration!.inSeconds : 0;
  }

  factory ApbPlayableAudio.fromJson(Map<String, dynamic> json) {
    switch (json['fileType']) {
      case 'url':
        return ApbUrlPlayableAudio.fromJson(json);
      case 'asset':
        return ApbAssetPlayableAudio.fromJson(json);
      case 'file':
        return ApbFilePlayableAudio.fromJson(json);
      default:
        throw UnimplementedError();
    }
  }

  Map<String, dynamic> toJson();

  ApbPlayableAudio copyWith({
    String? id,
    String? sourceId,
    String? playlistId,
    String? name,
    String? imageUrl,
    String? imagePath,
    String? fileUrl,
    String? filePath,
    Duration? position,
    Duration? duration,
    DateTime? createdAt,
    List<String>? contributors,
  });
}

@JsonSerializable(includeIfNull: true)
class ApbUrlPlayableAudio extends ApbPlayableAudio {
  ApbUrlPlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required super.fileUrl,
    super.imageUrl,
    super.imagePath,
    super.position,
    super.duration,
    super.contributors,
    super.playlistId,
    super.createdAt,
  }) : super(filePath: null, fileType: ApbPlayableFileType.url);

  @override
  AudioSource get audioSource {
    return ProgressiveAudioSource(Uri.parse(fileUrl!), tag: tag);
  }

  @override
  factory ApbUrlPlayableAudio.fromJson(Map<String, dynamic> json) =>
      _$ApbUrlPlayableAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApbUrlPlayableAudioToJson(this);

  @override
  ApbPlayableAudio copyWith({
    String? id,
    String? sourceId,
    String? playlistId,
    String? name,
    String? imageUrl,
    String? imagePath,
    String? fileUrl,
    String? filePath,
    Duration? position,
    Duration? duration,
    DateTime? createdAt,
    List<String>? contributors,
  }) {
    return ApbUrlPlayableAudio(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      fileUrl: fileUrl ?? this.fileUrl,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      contributors: contributors ?? this.contributors,
    );
  }
}

@JsonSerializable(includeIfNull: true)
class ApbFilePlayableAudio extends ApbPlayableAudio {
  ApbFilePlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required super.filePath,
    super.imageUrl,
    super.imagePath,
    super.position,
    super.duration,
    super.contributors,
    super.playlistId,
    super.createdAt,
  }) : super(fileUrl: null, fileType: ApbPlayableFileType.file);

  @override
  AudioSource get audioSource {
    return AudioSource.file('${AudioPlayerBase().saveDirectory}/${filePath!}', tag: tag);
  }

  @override
  factory ApbFilePlayableAudio.fromJson(Map<String, dynamic> json) =>
      _$ApbFilePlayableAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApbFilePlayableAudioToJson(this);

  @override
  ApbPlayableAudio copyWith({
    String? id,
    String? sourceId,
    String? playlistId,
    String? name,
    String? imageUrl,
    String? imagePath,
    String? fileUrl,
    String? filePath,
    Duration? position,
    Duration? duration,
    DateTime? createdAt,
    List<String>? contributors,
  }) {
    return ApbFilePlayableAudio(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      filePath: filePath ?? this.filePath,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      contributors: contributors ?? this.contributors,
    );
  }
}

@JsonSerializable(includeIfNull: true)
class ApbAssetPlayableAudio extends ApbPlayableAudio {
  ApbAssetPlayableAudio({
    required super.id,
    super.sourceId,
    required super.name,
    required this.assetStr,
    super.imageUrl,
    super.imagePath,
    super.duration,
    super.position,
    super.contributors,
    super.playlistId,
    super.createdAt,
  }) : super(
         fileUrl: null,
         filePath: null,
         fileType: ApbPlayableFileType.asset,
       );

  @override
  AudioSource get audioSource {
    return AudioSource.asset(assetStr, tag: tag);
  }

  final String assetStr;

  @override
  factory ApbAssetPlayableAudio.fromJson(Map<String, dynamic> json) =>
      _$ApbAssetPlayableAudioFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApbAssetPlayableAudioToJson(this);

  @override
  ApbPlayableAudio copyWith({
    String? id,
    String? sourceId,
    String? playlistId,
    String? name,
    String? imageUrl,
    String? imagePath,
    String? fileUrl,
    String? filePath,
    Duration? position,
    Duration? duration,
    DateTime? createdAt,
    List<String>? contributors,
  }) {
    return ApbAssetPlayableAudio(
      id: id ?? this.id,
      sourceId: sourceId ?? this.sourceId,
      playlistId: playlistId ?? this.playlistId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      createdAt: createdAt ?? this.createdAt,
      contributors: contributors ?? this.contributors,
      assetStr: '',
    );
  }
}

class ApbPlayablePlaylist {
  final String? id;
  final String? name;
  final String? imageUrl;
  final String? imagePath;
  final String? desc;
  final List<String>? contributors;
  final bool? shouldHide;
  final List<ApbPlayableAudio>? audios;
  final DateTime? lastUpdated;
  final DateTime? lastPlayed;

  ApbPlayablePlaylist({
    this.shouldHide,
    this.audios,
    this.lastUpdated,
    this.lastPlayed,
    this.id,
    this.name,
    this.imageUrl,
    this.imagePath,
    this.desc,
    this.contributors,
  });

  int get count => audios?.length ?? 0;

  Duration get duration => audios?.fold(Duration.zero, (previousValue, element)
  => Duration(seconds: (previousValue?.inSeconds??0) + (element.duration?.inSeconds ?? 0))) ?? Duration.zero;

  DateTime get lastActive =>
      (lastPlayed ?? DateTime(2000)).millisecondsSinceEpoch <
              _lastUpdated.millisecondsSinceEpoch
          ? _lastUpdated
          : lastPlayed!;

  DateTime get _lastUpdated => lastUpdated!;

  String? get contributorsToString => contributors?.join(', ');
  ApbPlayablePlaylist copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? imagePath,
    String? desc,
    List<String>? contributors,
    bool? shouldHide,
    List<ApbPlayableAudio>? audios,
    DateTime? lastUpdated,
    DateTime? lastPlayed,
  }) {
    return ApbPlayablePlaylist(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      imagePath: imagePath ?? this.imagePath,
      desc: desc ?? this.desc,
      contributors: contributors ?? this.contributors,
      shouldHide: shouldHide ?? this.shouldHide,
      audios: audios ?? this.audios,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      lastPlayed: lastPlayed ?? this.lastPlayed,
    );
  }
}
