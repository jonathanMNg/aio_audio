import 'package:flutter/material.dart';
import '../../audio_player_base.dart'
    show
        ApbPlayerConfig,
        ApbPlayerWidget,
        percentageFromValueInRange,
        playerExpandProgress,
        playerMinHeightPercentage;

class ApbPlayerWrapper extends StatelessWidget {
  const ApbPlayerWrapper({
    required this.child,
    super.key,
    this.config = const ApbPlayerConfig(),
  });

  final Widget child;
  final ApbPlayerConfig config;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [child, ApbPlayerWidget(config: config,)],
    );
  }
}

class ApbPlayerWrapperWithBottomBar extends StatelessWidget {
  const ApbPlayerWrapperWithBottomBar({
    required this.child,
    super.key,
    required this.bottomNavigationBar,
    this.config = const ApbPlayerConfig(),
  });

  final BottomNavigationBar bottomNavigationBar;
  final Widget child;
  final ApbPlayerConfig config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: playerExpandProgress,
        builder: (context, heightPercentage, child) {
          final height = percentageFromValueInRange(
            min: playerMinHeightPercentage,
            max: 1,
            value: heightPercentage,
          );
          return SafeArea(
            bottom: heightPercentage <= playerMinHeightPercentage + 0.005 ? true : false,
            child: SizedBox(
              height:
                  kBottomNavigationBarHeight -
                  kBottomNavigationBarHeight * height,
              child: Transform.translate(
                offset: Offset(0.0, kBottomNavigationBarHeight * height),
                child: child,
              ),
            ),
          );
        },
        child: SafeArea(child: Wrap(children: [bottomNavigationBar])),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [child, ApbPlayerWidget(config: config,)],
      ),
    );
  }
}
