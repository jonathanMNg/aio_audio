part of 'player_builder.dart';

class ApbMiniPlayer extends StatelessWidget {
  const ApbMiniPlayer({super.key, required this.audio});
  final ApbPlayableAudio audio;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainer,
      height: playerMinHeight + 5,
      child: Card(
        margin: EdgeInsets.zero,
        shape: const ContinuousRectangleBorder(),
        child: Column(
          children: [
            Row(
              children: [
                CachedImageBuilder(
                  imageUrl: audio.imageUrl!,
                  height: playerMinHeight,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                          child: Text('${audio.name}'),
                        ),
                        Text(audio.contributorsToString ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      // context.read<PlayerBloc>().add(const PlayerEvent.stop());
                    },
                  ),
                )
              ],
            ),
            LinearProgressIndicator(value: 0.5,)
          ],
        ),
      ),
    );
  }
}