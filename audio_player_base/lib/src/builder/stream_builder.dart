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
  final Widget Function(BuildContext context) defaultBuilder;
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
        return state.when(
          initial: () => defaultBuilder(context),
          loading: (audio, playerStream) => loadingBuilder(context, playerStream, audio),
          startup: (audio) => defaultBuilder(context),
          playing: (audio, playerStream) => playingBuilder(context, playerStream, audio),
          stopped: () => defaultBuilder(context),
          error: () => defaultBuilder(context),
        );
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

  final Widget Function(BuildContext context) playingBuilder;
  final Widget Function(BuildContext context) defaultBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApbPlayerBloc, ApbPlayerState>(
      builder: (context, state) {
        return state.when(
          initial: () => defaultBuilder(context),
          loading: (audio, playerStream) => defaultBuilder(context),
          startup: (audio) => defaultBuilder(context),
          playing: (audio, playerStream) => playingBuilder(context),
          stopped: () => defaultBuilder(context),
          error: () => defaultBuilder(context),
        );
      },
    );
  }
}
