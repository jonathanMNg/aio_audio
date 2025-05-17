import 'package:audio_player_base/audio_player_base.dart';
import 'package:example/provider/audio/example_audio_provider.dart';
import 'package:example/provider/audio/example_playlist_provider.dart';
import 'package:example/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioPlayerBase.init(androidNotificationChannelId: 'app.jng.audio_player_base');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ApbPlayerBloc(
            audioProvider: ExampleAudioProvider(),
            playlistProvider: ExamplePlaylistProvider(),
          ),
        ),
        BlocProvider( create: (context) => ApbTimerCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
