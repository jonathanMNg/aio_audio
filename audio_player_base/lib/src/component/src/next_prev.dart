import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../builder/src/stream_builder.dart';

class ApbNextWidget extends StatelessWidget {
  const ApbNextWidget({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: widget ?? const Icon(Icons.skip_next),
    );
    final enabledButton = IconButton(
      onPressed: () {
        context.read<ApbPlayerBloc>().add(const ApbNextEvent());
      },
      icon: widget ?? const Icon(Icons.skip_next),
    );
    return ApbPlayingOrNotStreamBuilder(
      defaultBuilder: (context) {
        return disabledButton;
      },
      playingBuilder: (context, psStream) {
        return ApbCustomStreamBuilder<bool>(
          defaultBuilder: (context) {
            return disabledButton;
          },
          stream: psStream.hasNextStream,
          itemBuilder: (context, hasNext) {
            return hasNext ? enabledButton : disabledButton;
          }
        );
      },
    );
  }
}

class ApbPrevWidget extends StatelessWidget {
  const ApbPrevWidget({super.key, this.widget});

  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: widget ?? const Icon(Icons.skip_previous),
    );
    final enabledButton = IconButton(
      onPressed: () {
        context.read<ApbPlayerBloc>().add(const ApbPrevEvent());
      },
      icon: widget ?? const Icon(Icons.skip_previous),
    );
    return ApbPlayingOrNotStreamBuilder(
      defaultBuilder: (context) {
        return disabledButton;
      },
      playingBuilder: (context, psStream) {
        return ApbCustomStreamBuilder<bool>(
            defaultBuilder: (context) {
              return disabledButton;
            },
            stream: psStream.hasPreviousStream,
            itemBuilder: (context, hasPrevious) {
              return hasPrevious ? enabledButton : disabledButton;
            }
        );
      },
    );
  }
}
