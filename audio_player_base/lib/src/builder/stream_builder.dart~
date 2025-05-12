import 'package:audio_player_base/src/model/audio_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/apb_player/apb_player_bloc.dart';

class ApbCustomStreamBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context) defaultBuilder;
  final Widget Function(BuildContext context, T snapshotData) itemBuilder;
  final Stream stream;

  const ApbCustomStreamBuilder({
    super.key,
    required this.defaultBuilder,
    required this.stream,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return itemBuilder(context, snapshot.data!);
        }
        return defaultBuilder(context);
      },
    );
  }
}

class ApbActiveStreamBuilder<T> extends StatelessWidget {
  final Widget Function(BuildContext context, ApbPlayableAudio? audio) defaultBuilder;
  final Widget Function(
    BuildContext context,
    ApbPlayerStateStream psStream,
    ApbPlayableAudio loadingAudio,
  )
  loadingBuilder;
  final Widget Function(
    BuildContext context,
    ApbPlayerStateStream psStream,
    ApbPlayableAudio playingAudio,
  )
  playingBuilder;

  const ApbActiveStreamBuilder({
    super.key,
    required this.loadingBuilder,
    required this.defaultBuilder,
    required this.playingBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApbPlayerBloc, ApbPlayerState>(
      builder: (context, state) {
        switch (state.status) {
          case ApbPlayerStateStatus.startUp:
            return defaultBuilder(context, state.initialAudio);
          case ApbPlayerStateStatus.loading:
            return ApbCustomStreamBuilder<int>(
                defaultBuilder: (context) => defaultBuilder(context, state.initialAudio),
                stream: state.playerStream!.currentIndexStream,
                itemBuilder: (context, currentIndex) {
                  final currentAudio = state.playlist!.audios![currentIndex];
                  return loadingBuilder(context, state.playerStream!, currentAudio);
                }
            );
          case ApbPlayerStateStatus.playing:
            return ApbCustomStreamBuilder<int>(
                defaultBuilder: (context) => defaultBuilder(context, state.initialAudio),
                stream: state.playerStream!.currentIndexStream,
                itemBuilder: (context, currentIndex) {
                  final currentAudio = state.playlist!.audios![currentIndex];
                  return playingBuilder(context, state.playerStream!, currentAudio);
                }
            );
          case ApbPlayerStateStatus.stopped:
            return defaultBuilder(context, state.initialAudio);
          case ApbPlayerStateStatus.error:
            return defaultBuilder(context, state.initialAudio);
          default:
            return defaultBuilder(context, state.initialAudio);
        }
      },
    );
  }
}

class ApbPlayingOrNotStreamBuilder extends StatelessWidget {
  const ApbPlayingOrNotStreamBuilder({
    super.key,
    required this.defaultBuilder,
    required this.playingBuilder,
  });

  final Widget Function(BuildContext context, ApbPlayerStateStream psStream)
  playingBuilder;
  final Widget Function(BuildContext context) defaultBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApbPlayerBloc, ApbPlayerState>(
      builder: (context, state) {
        switch (state.status) {
          case ApbPlayerStateStatus.playing:
            return playingBuilder(context, state.playerStream!);
          case ApbPlayerStateStatus.stopped:
            return defaultBuilder(context);
          case ApbPlayerStateStatus.loading:
            return defaultBuilder(context);
          case ApbPlayerStateStatus.error:
            return defaultBuilder(context);
          default:
            return defaultBuilder(context);
        }
      },
    );
  }
}
