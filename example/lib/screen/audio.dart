import 'package:audio_player_base/audio_player_base.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../provider/audio/mock_audio_db.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {

  void _playAudio(ApbUrlPlayableAudio audio) {
    context.read<ApbPlayerBloc>().add(ApbPlayAudioEvent(audio));
  }

  void _playPlaylist(ApbPlayablePlaylist playlist) {
    context.read<ApbPlayerBloc>().add(ApbPlayPlaylistEvent(playlist));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Audio Screen'),
      ),
      body: Column(
        children: [
          _buildFirstControlRow(),
          _buildSecondControlRow(),
          _buildProgressBar(),
          _buildAudioList(),
          _buildNewAudioItem(),
        ],
      ),
      // body: ApbFullPlayer(audio: audio),
    );
  }

  Widget _buildProgressBar() {
    return SizedBox(
      height: 30,
      child: ApbProgressWidget(
        playingBuilder: (context, progress, duration, position) {
          return ProgressBar(
            progress: position ?? Duration.zero,
            total: duration ?? Duration.zero,
            onSeek: (value) {
              context.read<ApbPlayerBloc>().add(ApbSeekEvent(value));
            },
          );
        },
        defaultBuilder: (context, progress) {
          return LinearProgressIndicator(value: progress);
        }, loadingBuilder: (BuildContext context) {
          return LinearProgressIndicator();
      },
      ),
    );
  }

  Widget _buildSecondControlRow() {
    return Row(
      children: [
        ApbLoopToggleWidget(),
        ApbShuffleToggleWidget(),
        ApbSpeedToggleWidget(),
        IconButton(
          onPressed: () {
            context.read<ApbPlayerBloc>().add(const ApbStopPlayerEvent());
          },
          icon: const Icon(Icons.stop),
        ),
        IconButton(onPressed: (){
          context.read<ApbPlayerBloc>().add(ApbAddAudioEvent(newMockAudio));
        }, icon: const Icon(Icons.add))
      ],
    );
  }

  Widget _buildNewAudioItem() {
    return ListTile(
      leading:
      newMockAudio.imageUrl != null
          ? Image.network(
        newMockAudio.imageUrl!,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.music_note);
        },
      )
          : const Icon(Icons.music_note),
      title: Text(newMockAudio.name ?? 'Unknown'),
      subtitle: Column(
        children: [
          Text(newMockAudio.contributorsToString ?? 'Unknown Artist'),
          ApbProgressWidget(
            playingBuilder: (context, progress, duration, position) {
              return LinearProgressIndicator(value: progress);
            },
            defaultBuilder: (context, progress) {
              return LinearProgressIndicator(value: progress);
            },
            audio: newMockAudio, loadingBuilder: (BuildContext context) {
              return LinearProgressIndicator();
          },
          ),
        ],
      ),
      trailing: ApbPlayPauseWidget(
        playWidget: IconButton(
          onPressed: () => _playAudio(newMockAudio),
          icon: Icon(Icons.play_arrow),
        ),
        pauseWidget: IconButton(
          onPressed: () {
            context.read<ApbPlayerBloc>().add(ApbPauseEvent());
          },
          icon: Icon(Icons.pause),
        ),
        loadingWidget: const CircularProgressIndicator(),
        replayWidget: IconButton(
          onPressed: () {
            context.read<ApbPlayerBloc>().add(ApbReplayEvent());
          },
          icon: Icon(Icons.replay),
        ),
        resumeWidget: IconButton(
          onPressed: () {
            context.read<ApbPlayerBloc>().add(ApbResumeEvent());
          },
          icon: Icon(Icons.play_arrow),
        ),
        audio: newMockAudio,
      ),
    );
  }

  Widget _buildFirstControlRow() {
    return Row(
      children: [
        ApbPrevWidget(),
        SizedBox(
          width: 40,
          height: 40,
          child: ApbPlayPauseWidget(
            playWidget: IconButton(
              onPressed: () {
                _playPlaylist(mockPlaylist);
              },
              icon: const Icon(Icons.play_arrow),
            ),
            pauseWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbPauseEvent());
              },
              icon: const Icon(Icons.pause),
            ),
            loadingWidget: const CircularProgressIndicator(),
            replayWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbReplayEvent());
              },
              icon: const Icon(Icons.replay),
            ),
            resumeWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbResumeEvent());
              },
              icon: const Icon(Icons.play_arrow),
            ),
          ),
        ),
        ApbNextWidget(),
        ApbSkipBackwardWidget(),
        ApbSkipForwardWidget(),
      ],
    );
  }

  Widget _buildAudioList() {
    return ListView.builder(
      itemCount: audioList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final audio = audioList[index];
        return ListTile(
          leading:
          audio.imageUrl != null
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
          subtitle: Column(
            children: [
              Text(audio.contributorsToString ?? 'Unknown Artist'),
              ApbProgressWidget(
                playingBuilder: (context, progress, duration, position) {
                  return LinearProgressIndicator(value: progress);
                },
                defaultBuilder: (context, progress) {
                  return LinearProgressIndicator(value: progress);
                },
                audio: audio, loadingBuilder: (BuildContext context) {
                  return LinearProgressIndicator();
              },
              ),
            ],
          ),
          trailing: ApbPlayPauseWidget(
            playWidget: IconButton(
              onPressed: () {
                _playAudio(audio);
              },
              icon: Icon(Icons.play_arrow),
            ),
            pauseWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbPauseEvent());
              },
              icon: Icon(Icons.pause),
            ),
            loadingWidget: const CircularProgressIndicator(),
            replayWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbReplayEvent());
              },
              icon: Icon(Icons.replay),
            ),
            resumeWidget: IconButton(
              onPressed: () {
                context.read<ApbPlayerBloc>().add(ApbResumeEvent());
              },
              icon: Icon(Icons.play_arrow),
            ),
            audio: audio,
          ),
        );
      },
    );
  }
}
