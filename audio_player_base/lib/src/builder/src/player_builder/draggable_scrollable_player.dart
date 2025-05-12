import 'package:flutter/material.dart';

const maxHeight = 1.0;

class DraggableScrollablePlayer extends StatefulWidget {
  final ValueNotifier<double> valueNotifier;
  final double minHeight;
  final Widget Function(bool isMiniPlayer) builder;
  final DraggableScrollableController? controller;
  final bool shouldBeScrollable;
  const DraggableScrollablePlayer(
      {
        super.key,
        this.controller,
        required this.valueNotifier,
        required this.minHeight,
        required this.builder, this.shouldBeScrollable = false,
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
      widget.valueNotifier.value = _draggableScrollableController?.pixels ?? 0.0;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        snap: true,
        controller: _draggableScrollableController,
        initialChildSize: widget.minHeight / MediaQuery.of(context).size.height,
        minChildSize:  widget.minHeight / MediaQuery.of(context).size.height,
        maxChildSize: maxHeight,
        builder: (context, scrollController) {
          return ValueListenableBuilder<double>(
            valueListenable: widget.valueNotifier,
            builder: (context, height, child) {
              bool isMiniPlayer = height.floor() <= widget.minHeight.floor();
              return SingleChildScrollView(controller: scrollController, physics: widget.shouldBeScrollable ? null : const NeverScrollableScrollPhysics(), child: widget.builder(isMiniPlayer),);
            }
          );
        }
    );
  }
}
