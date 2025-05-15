part of 'player_builder.dart';

class ApbScrollablePlayer extends StatefulWidget {
  const ApbScrollablePlayer({
    super.key,
    this.secondaryWidgetBuilder,
    required this.audio,
    required this.playlist,
    required this.config,

  });

  final ApbPlayableAudio audio;
  final ApbPlayablePlaylist playlist;
  final Widget Function(BuildContext context, ApbPlayableAudio audio)?
  secondaryWidgetBuilder;
  final ApbPlayerConfig config;

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
            config: widget.config,
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