import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../builder/src/stream_builder.dart';

class ApbProgressWidget extends StatelessWidget {
  const ApbProgressWidget(
      {super.key, required this.playingBuilder, required this.defaultBuilder, this.audio});

  final Widget Function(BuildContext context, double? progress, Duration? duration, Duration? position) playingBuilder;
  final Widget Function(BuildContext context, double? progress, Duration? duration, Duration? position) defaultBuilder;
  final ApbPlayableAudio? audio;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
        loadingBuilder: (context, psStream, loadingAudio) {
          if(audio != null) {
            if(audio?.id == loadingAudio.id) {
              return defaultBuilder(context, loadingAudio.progress, loadingAudio.duration, loadingAudio.position);
            }
          }
          return defaultBuilder(context, loadingAudio.progress, loadingAudio.duration, loadingAudio.position);
        },
        defaultBuilder: (context, audio) {
          return defaultBuilder(context, audio?.progress ?? 0, audio?.duration, audio?.position);
        },
        playingBuilder: (context, psStream, playingAudio) {
          final child = ApbCustomStreamBuilder<(Duration?, Duration?)>(
              defaultBuilder: (context) {
                return defaultBuilder(context, audio?.progress, audio?.duration, audio?.position);
              },
              stream: Rx.combineLatest2(psStream.positionStream, psStream.durationStream, (position, duration) => (position , duration)),
              itemBuilder: (context, data) {
                final (position, duration) = data;
                double? progress;
                if(duration == null || position == null) {
                  progress = null;
                }
                else {
                  progress = position.inMilliseconds / duration.inMilliseconds;
                }
                return playingBuilder(context, progress, duration, position);

              });
          if(audio != null) {
            if(audio?.id == playingAudio.id) {
              return child;
            }
            else {
              return defaultBuilder(context, audio?.progress ?? 0, audio?.duration, audio?.position);
            }
          }
          else {
            return child;
          }
          // return playingBuilder(context, playingAudio.progress);
        });

  }
}
