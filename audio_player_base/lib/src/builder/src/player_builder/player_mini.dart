part of 'player_builder.dart';

class ApbMiniPlayer extends StatelessWidget {
  const ApbMiniPlayer({super.key, required this.audio});

  final ApbPlayableAudio audio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          height: getPixelFromPercentage(context, playerMinHeightPercentage),
          child: Card(
            margin: EdgeInsets.zero,
            shape: const ContinuousRectangleBorder(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ApbProgressWidget(
                  playingBuilder:
                      (context, progress, duration, position) =>
                      LinearProgressIndicator(value: progress, minHeight: 5,),
                  defaultBuilder: (context, progress) {
                    return LinearProgressIndicator(minHeight: 5, value: progress,);
                  },
                  loadingBuilder: (context) {
                    return LinearProgressIndicator(minHeight: 5,);
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ApbCachedImageBuilder(
                      imageUrl: audio.imageUrl!,
                      height: getPixelFromPercentage(context, playerMinHeightPercentage) - 5,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20, child: Text('${audio.name}')),
                            Text(
                              audio.contributorsToString ?? '',
                              style: Theme.of(context).textTheme.bodySmall!,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 3),
                      child: ApbPlayPauseWidget(
                        playWidget: IconButton(
                          onPressed: () {
                            context.read<ApbPlayerBloc>().add(
                              ApbPlayAudioEvent(audio),
                            );
                          },
                          icon: Icon(Icons.play_arrow),
                        ),
                        pauseWidget: IconButton(
                          onPressed: () {
                            context.read<ApbPlayerBloc>().add(
                              const ApbPauseEvent(),
                            );
                          },
                          icon: Icon(Icons.pause),
                        ),
                        loadingWidget: CircularProgressIndicator(
                          padding: EdgeInsets.all(10),
                        ),
                        replayWidget: IconButton(
                          onPressed: () {
                            context.read<ApbPlayerBloc>().add(
                              const ApbReplayEvent(),
                            );
                          },
                          icon: Icon(Icons.replay),
                        ),
                        resumeWidget: IconButton(
                          onPressed: () {
                            context.read<ApbPlayerBloc>().add(
                              const ApbResumeEvent(),
                            );
                          },
                          icon: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          context.read<ApbPlayerBloc>().add(
                            const ApbStopPlayerEvent(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
