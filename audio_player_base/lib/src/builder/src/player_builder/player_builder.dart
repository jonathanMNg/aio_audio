import 'dart:ui';

import 'package:audio_player_base/audio_player_base.dart';
import 'package:audio_player_base/src/builder/src/stream_builder.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../component/src/image.dart';

part 'player_mini.dart';

part 'player_full.dart';

const double playerMinHeight = 70;
// const double miniPlayerPercentageDeclaration = 0.001;
// const double playerMaxHeightRatioToScreen = 1;
//
// final ValueNotifier<double> playerExpandProgress = ValueNotifier(
//   playerMinHeight,
// );
double getMaxImgSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.5;
}

class ApbPlayerWidget extends StatelessWidget {
  const ApbPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApbPlayerWidgetBuilder(
      startUpBuilder: (context, audio) {
        return ApbMiniPlayer(audio: audio);
      },
      loadingBuilder: (context, audio) {
        return ApbMiniPlayer(audio: audio);
      },
      playingBuilder: (context, audio) {
        return ApbFullPlayer(audio: audio);
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
  final Widget Function(BuildContext context, ApbPlayableAudio audio)
  playingBuilder;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
      loadingBuilder:
          (
            BuildContext context,
            ApbPlayerStateStream psStream,
            ApbPlayableAudio loadingAudio,
          ) {
            return loadingBuilder(context, loadingAudio);
          },
      defaultBuilder: (BuildContext context, ApbPlayableAudio? audio) {
        return SizedBox.shrink();
      },
      playingBuilder:
          (
            BuildContext context,
            ApbPlayerStateStream psStream,
            ApbPlayableAudio playingAudio,
          ) {
            return playingBuilder(context, playingAudio);
          },
      errorBuilder: (context) => SizedBox.shrink(),
      stoppedBuilder: (context) => SizedBox.shrink(),
    );
  }
}

//
// class DetailedPlayer extends StatefulWidget {
//   const DetailedPlayer({super.key, this.isAttachedToHomeScreen = false});
//
//   final bool isAttachedToHomeScreen;
//
//   @override
//   State<DetailedPlayer> createState() => _DetailedPlayerState();
// }
//
// class _DetailedPlayerState extends State<DetailedPlayer> {
//   late DraggableScrollableController controller;
//   late DraggableScrollableController _loadingController;
//   final double imagePadding = 30;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = DraggableScrollableController();
//     _loadingController = DraggableScrollableController();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     _loadingController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         BlocBuilder<ApbPlayerBloc, ApbPlayerState>(
//           builder: (context, state) {
//             return Container();
//           },
//         ),
//       ],
//     );
//   }
// }
