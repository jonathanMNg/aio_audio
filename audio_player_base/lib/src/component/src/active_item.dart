import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';


class ApbActiveWidget extends StatelessWidget {
  const ApbActiveWidget({
    super.key,
    required this.activeWidget,
    required this.defaultWidget,
    required this.audio,
  });

  final ApbPlayableAudio audio;
  final Widget activeWidget;
  final Widget defaultWidget;

  @override
  Widget build(BuildContext context) {
    return ApbActiveStreamBuilder(
      loadingBuilder: (context, psStream, playlist, loadingAudio) {
        if(audio.id == loadingAudio.id) {
          return activeWidget;
        }
        else {
          return defaultWidget;
        }
      },
      defaultBuilder: (context) {
        return defaultWidget;
      },
      playingBuilder: (context, psStream, playlist, playingAudio) {
        if(audio.id == playingAudio.id) {
          return activeWidget;
        }
        else {
          return defaultWidget;
        }
      },
    );
  }
}
