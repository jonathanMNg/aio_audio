import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';


class DraggableScrollablePlayer extends StatefulWidget {
  final ValueNotifier<double> valueNotifier;
  final DraggableScrollableController? controller;
  final Widget Function(BuildContext context, bool isMini) builder;
  const DraggableScrollablePlayer(
      {
        super.key,
        this.controller,
        required this.valueNotifier,
        required this.builder,
      }
  );

  @override
  State<DraggableScrollablePlayer> createState() => _DraggableScrollablePlayerState();
}

class _DraggableScrollablePlayerState extends State<DraggableScrollablePlayer> {
  late final DraggableScrollableController? _draggableScrollableController;
  @override
  void initState() {
    super.initState();
    _draggableScrollableController = widget.controller;
    _draggableScrollableController?.addListener(() {
      widget.valueNotifier.value = _draggableScrollableController.size;
    });
  }

  @override
  void dispose() {
    _draggableScrollableController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        snap: true,
        controller: _draggableScrollableController,
        initialChildSize: playerMinHeightPercentage,
        minChildSize: playerMinHeightPercentage,
        maxChildSize: maxHeight,
        builder: (context, scrollController) {
          return ValueListenableBuilder(
            valueListenable: widget.valueNotifier,
            builder: (context, heightPercentage, child) {
              bool isMini = heightPercentage <= playerMinHeightPercentage + 0.005;
              return SingleChildScrollView(controller: scrollController, child: widget.builder(context, isMini),);
            }
          );
        }
    );
  }
}
