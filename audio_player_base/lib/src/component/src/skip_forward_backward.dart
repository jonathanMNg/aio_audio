import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ApbSkipWidget extends StatelessWidget {
  final Icon icon;
  final Duration skipDuration;

  const ApbSkipWidget(
      {super.key, required this.icon, required this.skipDuration});

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: icon,
    );
    return ApbPlayingOrNotStreamBuilder(
        defaultBuilder: (context) => disabledButton,
        playingBuilder: (context, psStream) {
          return ApbCustomStreamBuilder<(Duration?, Duration?)>(
              defaultBuilder: (context) => disabledButton,
              stream: Rx.combineLatest2(psStream.positionStream, psStream.durationStream, (position, duration) => (position, duration)),
              itemBuilder: (context, data) {
                final (position, duration) = data;
                return IconButton(onPressed: (){
                  context.read<ApbPlayerBloc>().add(ApbSkipEvent(position!, duration!, skipDuration));
                }, icon: icon);
              }
          );
        }
    );
  }
}

class ApbSkipForwardWidget extends ApbSkipWidget {
  const ApbSkipForwardWidget({super.key}) : super(icon: const Icon(Icons.forward_10), skipDuration: const Duration(seconds: 10));
}

class ApbSkipBackwardWidget extends ApbSkipWidget {
  const ApbSkipBackwardWidget({super.key}) : super(icon: const Icon(Icons.replay_10), skipDuration: const Duration(seconds: -10));
}
