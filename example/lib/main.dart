import 'package:flutter/material.dart';
import 'package:audio_player_base/audio_player_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Audio Player Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ApbUrlPlayableAudio> audioList = [
    ApbUrlPlayableAudio(
      id: '1',
      name: 'Sample Audio 1',
      fileUrl: 'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/bat-nha-ba-la-mat-da-tam-kinh-quynh-trang.mp3',
      imageUrl: 'https://res.cloudinary.com/jnappdev/image/upload/v1684756638/kinhtritung/images/Nghi_Th%E1%BB%A9c_S%C3%A1m_H%E1%BB%91i_S%C3%A1u_C%C4%83n.jpg',
      contributors: ['Artist 1'],
    ),
    ApbUrlPlayableAudio(
      id: '2',
      name: 'Sample Audio 2',
      fileUrl: 'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/chu-dai-bi-tieng-viet-ngan-tay-kim-linh.mp3',
      imageUrl: 'https://res.cloudinary.com/jnappdev/image/upload/v1682510748/kinhtritung/images/nhac_thien.jpg',
      contributors: ['Artist 2'],
    ),
    ApbUrlPlayableAudio(
      id: '3',
      name: 'Sample Audio 3',
      fileUrl: 'https://jnapp2.b-cdn.net/Nhac-Phat-Giao/luat-doi-quynh-trang.mp3',
      imageUrl: 'https://res.cloudinary.com/jnappdev/image/upload/v1682509536/kinhtritung/images/chu_dai_bi_nhac_hoa.jpg',
      contributors: ['Artist 3'],
    ),
  ];

  void _playAudio(ApbUrlPlayableAudio audio) {
    // TODO: Implement audio playback functionality
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: audioList.length,
        itemBuilder: (context, index) {
          final audio = audioList[index];
          return ListTile(
            leading: audio.imageUrl != null
                ? Image.network(
                    audio.imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.music_note);
                    },
                  )
                : const Icon(Icons.music_note),
            title: Text(audio.name ?? 'Unknown'),
            subtitle: Text(audio.contributorsToString ?? 'Unknown Artist'),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () => _playAudio(audio),
            ),
          );
        },
      ),
    );
  }
}
