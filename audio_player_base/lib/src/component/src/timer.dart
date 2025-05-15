import 'dart:ui';

import 'package:audio_player_base/src/bloc/apb_timer/apb_timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApbTimerConfig {
  const ApbTimerConfig({
    this.remainingLabel = 'Hẹn giờ tắt - Còn lại ',
    this.minuteLabel = 'phút',
    this.secondLabel = 'giây',
    this.closeLabel = 'Đóng',
    this.cancelLabel = 'Hủy Hẹn Giờ',
    this.inactiveRemainingLabel = 'Hẹn giờ tắt'
  });

  final String remainingLabel;
  final String minuteLabel;
  final String secondLabel;
  final String closeLabel;
  final String cancelLabel;
  final String inactiveRemainingLabel;
}

class ApbTimerWidget extends StatelessWidget {
  const ApbTimerWidget({super.key, this.config = const ApbTimerConfig()});

  final ApbTimerConfig config;

  @override
  Widget build(BuildContext context) {
    return TimerButton(config: config,);
  }
}

class TimerScreen extends StatelessWidget {
  final Animation<double> animation;
  final ApbTimerConfig config;

  const TimerScreen({super.key, required this.animation, required this.config});

  @override
  Widget build(BuildContext context) {
    var tween = Tween(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeIn));
    return Scaffold(
      backgroundColor: Colors.black12.withValues(alpha: 0.3),
      body: FadeTransition(
        opacity: animation.drive(tween),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: BlocBuilder<ApbTimerCubit, Duration>(
                  builder: (context, state) {
                    if (state != Duration.zero) {
                      return Text(
                        '${config.remainingLabel} ${state >= const Duration(minutes: 1) ? '${state.inMinutes.remainder(60)} ${config.minuteLabel}' : '${state.inSeconds.remainder(60)} ${config.secondLabel}'}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return Text(
                        config.inactiveRemainingLabel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }
                  },
                ),
              ),
              TimerItem(minutes: 5, config: config,),
              TimerItem(minutes: 15, config: config,),
              TimerItem(minutes: 30, config: config,),
              TimerItem(minutes: 45, config: config,),
              TimerItem(minutes: 60, config: config,),
              BlocBuilder<ApbTimerCubit, Duration>(
                builder: (context, state) {
                  if (state != Duration.zero) {
                    return ListTile(
                      title: Text(
                        config.cancelLabel,
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        context.read<ApbTimerCubit>().stopTimer();
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              Center(
                child: TextButton(
                  child: Text(
                    config.closeLabel,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerButton extends StatelessWidget {
  const TimerButton({super.key, required this.config});
  final ApbTimerConfig config;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApbTimerCubit, Duration>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 300),
                reverseTransitionDuration: const Duration(milliseconds: 300),
                opaque: false,
                // set to false
                pageBuilder:
                    (context, animation, secondaryAnimation) =>
                        TimerScreen(animation: animation, config: config,),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  var tween = Tween(
                    begin: 0.0,
                    end: 15.0,
                  ).chain(CurveTween(curve: Curves.ease));
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: tween.evaluate(animation),
                      sigmaY: tween.evaluate(animation),
                    ),
                    child: child,
                  );
                },
              ),
            );
          },
          icon: BlocBuilder<ApbTimerCubit, Duration>(
            builder: (context, state) {
              if (state != Duration.zero) {
                return Icon(
                  Icons.timer,
                  size: 25,
                  color: Theme.of(context).colorScheme.primary,
                );
              } else {
                return const Icon(Icons.timer, size: 25);
              }
            },
          ),
        );
      },
    );
  }
}

class TimerItem extends StatelessWidget {
  final int minutes;
  final ApbTimerConfig config;

  const TimerItem({super.key, required this.minutes, required this.config});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$minutes ${config.minuteLabel}', style: const TextStyle(color: Colors.white)),
      onTap: () {
        context.read<ApbTimerCubit>().startTimer(Duration(minutes: minutes));
        Navigator.of(context).pop();
      },
    );
  }
}
