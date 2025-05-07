import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApbNextButton extends StatelessWidget {
  const ApbNextButton({super.key, this.button});
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return ApbPlayingOrNotStreamBuilder(
        defaultBuilder: (context) {
          return IconButton(onPressed: null, icon: button ?? Icon(Icons.skip_next));
        }, playingBuilder: (context) {
          return IconButton(onPressed: () {
            context.read<ApbPlayerBloc>().add(ApbPlayerEvent.next());
          }, icon: button ?? Icon(Icons.skip_next));
    });
  }
}

class ApbPrevButton extends StatelessWidget {
  const ApbPrevButton({super.key, this.button});
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return ApbPlayingOrNotStreamBuilder(
        defaultBuilder: (context) {
          return IconButton(onPressed: null, icon: button ?? Icon(Icons.skip_previous));
        }, playingBuilder: (context) {
      return IconButton(onPressed: () {
        context.read<ApbPlayerBloc>().add(ApbPlayerEvent.prev());
      }, icon: button ?? Icon(Icons.skip_previous));
    });
  }
}