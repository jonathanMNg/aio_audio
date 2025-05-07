import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class YtExplodeService {
  YoutubeExplode? _ytExplode;
  static final YtExplodeService _instance = YtExplodeService._internal();
  factory YtExplodeService() {
    return _instance;
  }

  YtExplodeService._internal() {
    _ytExplode = YoutubeExplode();
  }

  YoutubeExplode get ytExplode {
    return _ytExplode ??= YoutubeExplode();
  }

  void dispose() {
    _ytExplode?.close();
    _ytExplode = null;
  }
}