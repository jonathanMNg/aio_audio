import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../builder/src/stream_builder.dart';

class _LoopItem {
  const _LoopItem({
    required this.mode,
    required this.icon,
    required this.isActive,
    required this.nextMode,
  });

  final LoopMode mode;
  final LoopMode nextMode;
  final Icon icon;
  final bool isActive;
}

class ApbLoopToggleWidget extends StatelessWidget {
  ApbLoopToggleWidget({super.key, this.initialLoopMode});

  final LoopMode? initialLoopMode;
  final List<_LoopItem> _loopItems = <_LoopItem>[
    _LoopItem(
      mode: LoopMode.off,
      icon: const Icon(Icons.repeat),
      isActive: false,
      nextMode: LoopMode.all,
    ),
    _LoopItem(
      mode: LoopMode.all,
      icon: const Icon(Icons.repeat_on),
      isActive: true,
      nextMode: LoopMode.one,
    ),
    _LoopItem(
      mode: LoopMode.one,
      icon: const Icon(Icons.repeat_one_on_outlined),
      isActive: true,
      nextMode: LoopMode.off,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: const Icon(Icons.repeat),
    );
    return ApbPlayingOrNotStreamBuilder(
      defaultBuilder: (context) => disabledButton,
      playingBuilder: (context, psStream) {
        return ApbCustomStreamBuilder<LoopMode>(
          defaultBuilder: (BuildContext context) => disabledButton,
          stream: psStream.loopModeStream,
          itemBuilder: (BuildContext context, LoopMode snapshotData) {
            final loopMode = snapshotData;
            final loopIndex = _loopItems.indexWhere(
              (item) => item.mode == loopMode,
            );
            return IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(
                  ApbToggleLoopEvent(_loopItems[loopIndex].nextMode),
                );
              },
              icon: _loopItems[loopIndex].icon,
              color: _loopItems[loopIndex].isActive ? Theme.of(context).colorScheme.primary : null,
            );
          },
        );
      },
    );
  }
}
