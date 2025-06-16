import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../builder/src/stream_builder.dart';

class ApbPlayPauseWidget extends StatelessWidget {
  const ApbPlayPauseWidget({
    super.key,
    required this.playWidget,
    required this.pauseWidget,
    required this.loadingWidget,
    required this.replayWidget,
    required this.resumeWidget,
    this.audio,
    this.playlist
  });

  final ApbPlayableAudio? audio;
  final ApbPlayablePlaylist? playlist;
  final Widget playWidget;
  final Widget resumeWidget;
  final Widget pauseWidget;
  final Widget loadingWidget;
  final Widget replayWidget;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
      loadingBuilder: (context, psStream, loadingPlaylist, loadingAudio) {
        if(audio != null || playlist != null) {
          if(audio?.id == loadingAudio.id || playlist?.id == loadingPlaylist.id) {
            return loadingWidget;
          }
          else {
            return playWidget;
          }
        }
        else {
          return loadingWidget;
        }
      },
      defaultBuilder: (context) {
        return playWidget;
      },
      playingBuilder: (context, psStream, playingPlaylist, playingAudio) {
        final child = ApbCustomStreamBuilder<PlayerState>(
          defaultBuilder: (context) => loadingWidget,
          stream: psStream.playerStateStream,
          itemBuilder: (context, playerState) {
            if (playerState.processingState == ProcessingState.completed) {
              return replayWidget;
            } else if (playerState.processingState ==
                ProcessingState.buffering ||
                playerState.processingState == ProcessingState.loading) {
              return loadingWidget;
            } else if (playerState.processingState ==
                ProcessingState.ready) {
              if(playerState.playing) {
                return pauseWidget;
              }
              else {
                return resumeWidget;
              }
            }
            else if(playerState.processingState == ProcessingState.idle) {
              return playWidget;
            }
            return playWidget;
          },
        );
        if(audio != null || playlist != null) {
          if(audio?.id == playingAudio.id || playlist?.id == playingPlaylist.id) {
            return child;
          }
          else {
            return playWidget;
          }
        }
        else {
          return child;
        }
      },
    );
  }
}
