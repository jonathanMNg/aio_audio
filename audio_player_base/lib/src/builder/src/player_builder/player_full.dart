part of 'player_builder.dart';

class ApbFullPlayer extends StatelessWidget {
  const ApbFullPlayer({super.key, this.secondaryWidgetBuilder, required this.audio});
  final ApbPlayableAudio audio;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)? secondaryWidgetBuilder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage( image: CachedNetworkImageProvider(audio.imageUrl!),
              fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceBright.withOpacity(0.7)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                // controller.animateTo(controller.pixelsToSize(70), duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                              },
                              icon: const Icon(
                                Icons.expand_more,
                                size: 33,
                              )),
                          Expanded(child: Center(child: Text(audio.name!, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis,)))
                        ]),
                  ],
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
                      ),),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - kToolbarHeight - 110 - (getMaxImgSize(context) - 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 30,
                              child: Text(audio.name!, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                          // child: BigPlayerTitle(track: track, onPressed: () {
                          //   if(track.collectionId == null || track.collectionId == 'yt_temp_collection') return;
                          //   controller.jumpTo(70 / MediaQuery.of(context).size.height,);
                          //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocalAudioColPage(audioColId: track.collectionId!),),);
                          //   playerExpandProgress.value = playerMinHeight;
                          // })
                          // ),
                          Text(audio.contributorsToString ?? '', style: Theme.of(context).textTheme.bodySmall,),
                          const SizedBox(height: 5,),
                          SizedBox(
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
                              defaultBuilder: (context, progress, duration, position) {
                                return LinearProgressIndicator(value: progress);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ApbPrevWidget(),
                                    ApbSkipBackwardWidget(),
                                    ApbPlayPauseWidget(
                                      pauseWidget: IconButton(onPressed: (){
                                        context.read<ApbPlayerBloc>().add(ApbPauseEvent());
                                      }, icon: Icon(Icons.pause)),
                                      playWidget: IconButton(onPressed: (){
                                        context.read<ApbPlayerBloc>().add(ApbResumeEvent());
                                      }, icon: Icon(Icons.play_arrow)),
                                      loadingWidget: CircularProgressIndicator(),
                                      replayWidget: IconButton(onPressed: (){
                                        context.read<ApbPlayerBloc>().add(ApbReplayEvent());
                                      }, icon: Icon(Icons.replay)),
                                      resumeWidget: IconButton(onPressed: (){
                                        context.read<ApbPlayerBloc>().add(ApbResumeEvent());
                                      }, icon: Icon(Icons.play_arrow)),

                                    ),
                                    ApbSkipForwardWidget(),
                                    ApbNextWidget(),
                                  ],
                                ),
                                SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ApbSpeedToggleWidget(),
                                    // TimerButton(),
                                    ApbLoopToggleWidget(),
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}

