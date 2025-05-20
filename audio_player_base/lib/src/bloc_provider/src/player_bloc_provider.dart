import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ApbBlocProvider extends StatelessWidget {
  const ApbBlocProvider({super.key, required this.child, required this.audioProvider, required this.playlistProvider});
  final Widget child;
  final ApbAudioProvider audioProvider;
  final ApbPlaylistProvider playlistProvider;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApbPlayerBloc(playlistProvider: playlistProvider, audioProvider: audioProvider)),
        BlocProvider(create: (context) => GetIt.I<ApbTimerCubit>())
      ],
      child: child,
    );
  }
}
