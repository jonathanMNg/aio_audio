import 'package:audio_player_base/audio_player_base.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../bloc/apb_player/apb_player_bloc.dart';

class ApbProgressWidget extends StatelessWidget {
  const ApbProgressWidget({
    super.key,
    required this.playingBuilder,
    required this.defaultBuilder,
    this.audio,
    required this.loadingBuilder,
  });

  final Widget Function(
    BuildContext context,
    double progress,
    Duration? duration,
    Duration? position,
  )
  playingBuilder;
  final Widget Function(BuildContext context) loadingBuilder;
  final Widget Function(BuildContext context, double progress) defaultBuilder;
  final ApbPlayableAudio? audio;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
      loadingBuilder: (context, psStream, playlist, loadingAudio) {
        if (audio != null) {
          if (audio?.id == loadingAudio.id) {
            return loadingBuilder(context);
          } else {
            return defaultBuilder(context, audio?.progress ?? 0);
          }
        }
        return loadingBuilder(context);
      },
      startUpBuilder: (context, startUpAudio) {
        return defaultBuilder(context, startUpAudio.progress ?? 0);
      },
      defaultBuilder: (context) {
        return defaultBuilder(context, audio?.progress ?? 0);
      },
      playingBuilder: (context, psStream, playlist, playingAudio) {
        final child = ApbCustomStreamBuilder<(Duration?, Duration?)>(
          defaultBuilder: (context) {
            return defaultBuilder(context, audio?.progress ?? 0);
          },
          stream: Rx.combineLatest2(
            psStream.positionStream,
            psStream.durationStream,
            (position, duration) => (position, duration),
          ),
          itemBuilder: (context, data) {
            final (position, duration) = data;
            double? progress;
            if (duration == null || position == null) {
              progress = null;
            } else {
              progress = position.inMilliseconds / duration.inMilliseconds;
            }
            return playingBuilder(context, progress ?? 0, duration, position);
          },
        );
        if (audio != null) {
          if (audio?.id == playingAudio.id) {
            return child;
          } else {
            return defaultBuilder(context, audio?.progress ?? 0);
          }
        } else {
          return child;
        }
      },
    );
  }
}

class ApbReactiveProgressWidget extends StatefulWidget {
  const ApbReactiveProgressWidget({super.key});

  @override
  State<ApbReactiveProgressWidget> createState() =>
      _ApbReactiveProgressWidgetState();
}

class _ApbReactiveProgressWidgetState extends State<ApbReactiveProgressWidget> {
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return ApbProgressWidget(
      playingBuilder: (context, progress, duration, position) {
        return ProgressBar(
          progress: position ?? Duration.zero,
          total: duration ?? Duration.zero,
          onSeek: (value) {
            context.read<ApbPlayerBloc>().add(ApbSeekEvent(value));
          },
          thumbRadius: isDragging ? 8 : 5,
          barHeight: isDragging ? 5 : 3,
          onDragStart: (details) {
            setState(() {
              isDragging = true;
            });
          },
          onDragEnd: () {
            setState(() {
              isDragging = false;
            });
          },
          timeLabelLocation: TimeLabelLocation.sides,
          timeLabelType: TimeLabelType.remainingTime,
        );
      },
      loadingBuilder: (context) {
        return LinearProgressIndicator();
      },
      defaultBuilder: (context, progress) {
        return LinearProgressIndicator(value: progress);
      },
    );
  }
}
