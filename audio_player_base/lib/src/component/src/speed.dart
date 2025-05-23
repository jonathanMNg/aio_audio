import 'package:audio_player_base/audio_player_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/apb_player/apb_player_bloc.dart';
import '../../builder/src/stream_builder.dart';

class ApbSpeedToggleWidget extends StatelessWidget {
  const ApbSpeedToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final disabledButton = IconButton(
      onPressed: null,
      icon: const Icon(Icons.speed),
    );
    return ApbPlayingOrNotStreamBuilder(
      defaultBuilder: (context) => disabledButton,
      playingBuilder: (context, psStream) {
        return ApbCustomStreamBuilder<double>(
          defaultBuilder: (context) => disabledButton,
          stream: psStream.speedStream,
          itemBuilder: (context, speed) {
            return IconButton(
              icon: Icon(Icons.speed, color: speed != 1 ? Theme.of(context).colorScheme.primary : null,),
              onPressed: () {
                showModalBottomSheet<void>(
                  showDragHandle: true,
                  context: context,
                  builder: (context) {
                    return ApbCustomStreamBuilder<double>(
                        defaultBuilder: (context) => SizedBox.shrink(),
                        stream: psStream.speedStream,
                        itemBuilder: (context, speed) {
                          return SizedBox(
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('${speed}x', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          if(speed > 0.25) {
                                            context.read<ApbPlayerBloc>().add(
                                                ApbToggleSpeedEvent(speed - 0.25));
                                          }
                                        },
                                        icon: Icon(Icons.remove_circle),
                                      ),
                                      Expanded(
                                        child: SliderTheme(
                                          data: SliderThemeData(
                                            thumbShape: RoundSliderThumbShape(
                                              enabledThumbRadius: 6,
                                            ),
                                            trackHeight: 1,
                                          ),
                                          child: Slider(
                                            min: 0.25,
                                            max: 2,
                                            divisions: 7,
                                            value: speed,
                                            onChanged: (value) {
                                              context.read<ApbPlayerBloc>().add(
                                                  ApbToggleSpeedEvent(value));
                                            },
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if(speed < 2) {
                                            context.read<ApbPlayerBloc>().add(
                                                ApbToggleSpeedEvent(speed + 0.25));
                                          }
                                        },
                                        icon: Icon(Icons.add_circle),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });

                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
