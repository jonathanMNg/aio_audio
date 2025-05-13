part of 'player_builder.dart';


class ApbScrollablePlayer extends StatefulWidget {
  const ApbScrollablePlayer({
    super.key,
    this.secondaryWidgetBuilder,
    required this.audio,
    required this.playlist,
  });

  final ApbPlayableAudio audio;
  final ApbPlayablePlaylist playlist;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)?
  secondaryWidgetBuilder;

  @override
  State<ApbScrollablePlayer> createState() => _ApbScrollablePlayerState();
}

class _ApbScrollablePlayerState extends State<ApbScrollablePlayer> {
  late DraggableScrollableController controller;

  @override
  void initState() {
    super.initState();
    controller = DraggableScrollableController();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollablePlayer(
      valueNotifier: playerExpandProgress,
      controller: controller,
      builder: (context, isMini) {
        if (isMini) {
          return GestureDetector(
            onTap: () {
              controller.animateTo(
                1.0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            child: ApbMiniPlayer(audio: widget.audio),
          );
        } else {
          return ApbFullPlayer(
            audio: widget.audio,
            playlist: widget.playlist,
            controller: controller,
            secondaryWidgetBuilder: widget.secondaryWidgetBuilder,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    if(controller.isAttached) {
      controller.dispose();
    }
    super.dispose();
  }
}

class ApbFullPlayer extends StatelessWidget {
  const ApbFullPlayer({
    super.key,
    required this.audio,
    required this.playlist,
    this.secondaryWidgetBuilder,
    required this.controller,
  });

  final ApbPlayableAudio audio;
  final ApbPlayablePlaylist playlist;
  final DraggableScrollableController controller;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)?
  secondaryWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(audio.imageUrl!),
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
                                  controller.pixelsToSize(70),
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
                              },
                              icon: const Icon(Icons.expand_more, size: 33),
                            ),
                            Expanded(
                              child: Text(
                                audio.name!,
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
                            child: CachedImageBuilder(
                              imageUrl: audio.imageUrl!,
                              width: getMaxImgSize(context),
                              height: getMaxImgSize(context),
                            ),
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
                                SizedBox(
                                  height: 25,
                                  child: Text(
                                    playlist.name!,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    audio.name!,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  audio.contributorsToString ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  height: 30,
                                  child: ApbReactiveProgressWidget(),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 15),
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
                                          ApbSkipForwardWidget(),
                                          ApbNextWidget(),
                                        ],
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ApbSpeedToggleWidget(),
                                          // TimerButton(),
                                          ApbLoopToggleWidget(),
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
