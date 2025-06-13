part of 'player_builder.dart';

class ApbFullPlayer extends StatelessWidget {
  const ApbFullPlayer({
    super.key,
    required this.audio,
    required this.playlist,
    this.secondaryWidgetBuilder,
    required this.controller,
    required this.config,
  });

  final ApbPlayableAudio audio;
  final ApbPlayablePlaylist playlist;
  final DraggableScrollableController controller;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)?
  secondaryWidgetBuilder;
  final ApbPlayerConfig config;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: audio.imagePath != null
              ? AipFileImage(path: audio.imagePath!).imageProvider
              : AipUrlImage(url: audio.imageUrl ?? '').imageProvider,
          // image: CachedNetworkImageProvider(audio.imageUrl!),
          fit: BoxFit.fill,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceBright.withValues(alpha: 0.6),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.animateTo(
                                  playerMinHeightPercentage,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              },
                              icon: const Icon(Icons.expand_more, size: 33),
                            ),
                            Expanded(
                              child: Text(
                                playlist.name!,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: ApbImageWidget(audio: audio, size: getMaxImgSize(context)),
                            // child: ApbCachedImageBuilder(
                            //   imageUrl: audio.imageUrl!,
                            //   width: getMaxImgSize(context),
                            //   height: getMaxImgSize(context),
                            // ),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height -
                                kToolbarHeight -
                                110 -
                                (getMaxImgSize(context) - 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(
                                //   height: 25,
                                //   child: Text(
                                //     playlist.name!,
                                //     style:
                                //         Theme.of(context).textTheme.titleMedium,
                                //     maxLines: 1,
                                //     overflow: TextOverflow.ellipsis,
                                //   ),
                                // ),
                                FlutterMarquee(
                                  text: audio.name!,
                                  height: 30,
                                  pauseAfterRound: Duration(seconds: 3),
                                  startAfter: Duration(seconds: 3),
                                  velocity: 100,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  audio.contributorsToString ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 15),
                                SizedBox(
                                  height: 30,
                                  child: ApbReactiveProgressWidget(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ApbPrevWidget(),
                                          if (config
                                              .enableSkipForwardBackwardButton)
                                            ApbSkipBackwardWidget(),
                                          ApbPlayPauseWidget(
                                            pauseWidget: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ApbPlayerBloc>()
                                                    .add(ApbPauseEvent());
                                              },
                                              icon: Icon(Icons.pause, size: 50),
                                            ),
                                            playWidget: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ApbPlayerBloc>()
                                                    .add(ApbResumeEvent());
                                              },
                                              icon: Icon(
                                                Icons.play_arrow,
                                                size: 50,
                                              ),
                                            ),
                                            loadingWidget:
                                                CircularProgressIndicator(
                                                  padding: EdgeInsets.all(15),
                                                ),
                                            replayWidget: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ApbPlayerBloc>()
                                                    .add(ApbReplayEvent());
                                              },
                                              icon: Icon(
                                                Icons.replay,
                                                size: 50,
                                              ),
                                            ),
                                            resumeWidget: IconButton(
                                              onPressed: () {
                                                context
                                                    .read<ApbPlayerBloc>()
                                                    .add(ApbResumeEvent());
                                              },
                                              icon: Icon(
                                                Icons.play_arrow,
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                          if (config
                                              .enableSkipForwardBackwardButton)
                                            ApbSkipForwardWidget(),
                                          ApbNextWidget(),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          if (config.enableSpeedButton)
                                            ApbSpeedToggleWidget(),
                                          if (config.enableTimerButton)
                                            ApbTimerWidget(
                                              config: config.timerConfig,
                                            ),
                                          if (config.enableLoopButton)
                                            ApbLoopToggleWidget(),
                                          if (config.enableShuffleButton)
                                            ApbShuffleToggleWidget(),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              secondaryWidgetBuilder?.call(context, audio) ?? SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
