import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../audio_player_base.dart';
import '../../bloc/apb_player/apb_player_bloc.dart';

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
  final Widget Function(BuildContext context) defaultBuilder;
  final Widget Function(
    BuildContext context,
    ApbPlayerStateStream psStream,
    ApbPlayablePlaylist playlist,
    ApbPlayableAudio loadingAudio,
  )
  loadingBuilder;
  final Widget Function(
    BuildContext context,
    ApbPlayerStateStream psStream,
      ApbPlayablePlaylist playlist,
    ApbPlayableAudio playingAudio,
  )
  playingBuilder;
  final Widget Function(BuildContext context)? stoppedBuilder;
  final Widget Function(BuildContext context)? errorBuilder;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)?
  startUpBuilder;

  const ApbActiveStreamBuilder({
    super.key,
    required this.loadingBuilder,
    required this.defaultBuilder,
    required this.playingBuilder,
    this.stoppedBuilder, this.errorBuilder,
    this.startUpBuilder
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApbPlayerBloc, ApbPlayerState>(
      builder: (context, state) {
        switch (state.status) {
          case ApbPlayerStateStatus.startUp:
            return startUpBuilder?.call(context, state.initialAudio!) ?? defaultBuilder(context);
          case ApbPlayerStateStatus.loading:
            return ApbCustomStreamBuilder<int>(
                defaultBuilder: (context) => defaultBuilder(context),
                stream: state.playerStream!.currentIndexStream,
                itemBuilder: (context, currentIndex) {
                  final currentAudio = state.playlist!.audios![currentIndex];
                  return loadingBuilder(context, state.playerStream!, state.playlist!, currentAudio);
                }
            );
          case ApbPlayerStateStatus.playing:
            return ApbCustomStreamBuilder<int>(
                defaultBuilder: (context) => defaultBuilder(context),
                stream: state.playerStream!.currentIndexStream,
                itemBuilder: (context, currentIndex) {
                  final currentAudio = state.playlist!.audios![currentIndex];
                  return playingBuilder(context, state.playerStream!, state.playlist!, currentAudio);
                }
            );
          case ApbPlayerStateStatus.stopped:
            return stoppedBuilder?.call(context) ?? defaultBuilder(context);
          case ApbPlayerStateStatus.error:
            return errorBuilder?.call(context) ?? defaultBuilder(context);
          case ApbPlayerStateStatus.idle:
            return defaultBuilder(context);
          default:
            return defaultBuilder(context);
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
