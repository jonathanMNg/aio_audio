import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../audio_player_base.dart';
import '../../bloc/apb_player/apb_player_bloc.dart';
import '../../builder/src/stream_builder.dart';

class ApbShuffleToggleWidget extends StatelessWidget {
  const ApbShuffleToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: const Icon(Icons.shuffle),
    );
    return ApbPlayingOrNotStreamBuilder(
      defaultBuilder: (context) => disabledButton,
      playingBuilder: (context, psStream) {
        return ApbCustomStreamBuilder<bool>(
          defaultBuilder: (context) => disabledButton,
          stream: psStream.shuffleModeEnabledStream,
          itemBuilder: (context, shuffleModeEnabled) {
            if(shuffleModeEnabled) {
              return IconButton(onPressed: (){
                context.read<ApbPlayerBloc>().add(const ApbToggleShuffleEvent());
              }, icon: Icon(Icons.shuffle_on_outlined), color: Theme.of(context).colorScheme.primary,);
            } else {
              return IconButton(onPressed: (){
                context.read<ApbPlayerBloc>().add(const ApbToggleShuffleEvent());
              }, icon: const Icon(Icons.shuffle));
            }
          },
        );
      },
    );
  }
}
