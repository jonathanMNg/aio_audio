import 'package:audio_player_base/audio_player_base.dart';
import 'package:example/screen/audio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ApbPlayerWrapperWithBottomBar(
      config: ApbPlayerConfig(),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationItems,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
      child: Scaffold(
        body: _screens[currentIndex],
      ),
    );
  }
}

final _bottomNavigationItems = [
  BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
  BottomNavigationBarItem(icon: Icon(Icons.download), label: 'Download'),
];

final _screens = [AudioScreen(), Center(child: Text('Download'))];
