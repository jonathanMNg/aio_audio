import 'package:audio_download_manager/audio_download_manager.dart';
import 'package:audio_player_base/audio_player_base.dart';
import 'package:example/provider/audio/example_audio_provider.dart';
import 'package:example/provider/audio/example_playlist_provider.dart';
import 'package:example/provider/download/example_download_list_provider.dart';
import 'package:example/screen/home.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioPlayerBase.init(androidNotificationChannelId: 'app.jng.audio_player_base');
  await AudioDownloadManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApbBlocProvider(
      audioProvider: ExampleAudioProvider(),
      playlistProvider: ExamplePlaylistProvider(),
      child: AdmBlocProvider(
        listProvider: ExampleDownloadListProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
