import 'dart:ui';

import 'package:audio_player_base/audio_player_base.dart';
import 'package:audio_player_base/src/builder/src/player_builder/draggable_scrollable_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'player_mini.dart';
part 'player_full.dart';
part 'player_scrollable.dart';

const double playerMinHeightPercentage = 0.08;
const double maxHeight = 1.0;

final ValueNotifier<double> playerExpandProgress = ValueNotifier(
  playerMinHeightPercentage,
);

double getMaxImgSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.5;
}

double percentageFromValueInRange({required final double min, max, value}) {
  return (value - min) / (max - min);
}

double getPixelFromPercentage(BuildContext context, double percent) {
  return MediaQuery.sizeOf(context).height * percent;
}

class ApbPlayerConfig {
  const ApbPlayerConfig({
    this.enableShuffleButton = true,
    this.enableTimerButton = true,
    this.enableLoopButton = true,
    this.enableSpeedButton = true,
    this.enableSkipForwardBackwardButton = true,
    this.timerConfig = const ApbTimerConfig(),
  });

  final bool enableShuffleButton;
  final bool enableTimerButton;
  final bool enableLoopButton;
  final bool enableSpeedButton;
  final bool enableSkipForwardBackwardButton;
  final ApbTimerConfig timerConfig;
}

class ApbPlayerWidget extends StatelessWidget {
  const ApbPlayerWidget({
    super.key,
    required this.config,
  });

  final ApbPlayerConfig config;

  @override
  Widget build(BuildContext context) {
    return ApbPlayerWidgetBuilder(
      startUpBuilder: (context, audio) {
        return ApbMiniPlayer(audio: audio);
      },
      loadingBuilder: (context, audio) {
        return ApbMiniPlayer(audio: audio);
      },
      playingBuilder: (context, playlist, audio) {
        return ApbScrollablePlayer(
          playlist: playlist,
          audio: audio,
          config: config,
        );
      },
    );
  }
}

class ApbPlayerWidgetBuilder extends StatelessWidget {
  const ApbPlayerWidgetBuilder({
    super.key,
    required this.startUpBuilder,
    required this.loadingBuilder,
    required this.playingBuilder,
  });

  final Widget Function(BuildContext context, ApbPlayableAudio audio)
  startUpBuilder;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)
  loadingBuilder;
  final Widget Function(
    BuildContext context,
    ApbPlayablePlaylist playlist,
    ApbPlayableAudio audio,
  )
  playingBuilder;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
      loadingBuilder: (context, psStream, playlist, loadingAudio) {
        return loadingBuilder(context, loadingAudio);
      },
      defaultBuilder: (BuildContext context) {
        return SizedBox.shrink();
      },
      startUpBuilder: (context, audio) => startUpBuilder(context, audio),
      playingBuilder: (context, psStream, playlist, playingAudio) {
        return playingBuilder(context, playlist, playingAudio);
      },
      errorBuilder: (context) => SizedBox.shrink(),
      stoppedBuilder: (context) => SizedBox.shrink(),
    );
  }
}