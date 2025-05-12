// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../audio_player_base.dart' show playerMinHeight;
//
// final ValueNotifier<double> playerExpandProgress =
// ValueNotifier(playerMinHeight);
//
// class PlayerWrapper extends StatelessWidget {
//   const PlayerWrapper({required this.child, super.key, this.isAttachedToHomeScreen = false});
//
//   final Widget child;
//   final bool isAttachedToHomeScreen;
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: playerExpandProgress,
//       builder: (_, height, builderChild) {
//         return Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             builderChild ?? const SizedBox.shrink(),
//             BlocBuilder<PlayerBloc, PlayerState>(
//               builder: (context, state) {
//                 return state.when(initial: () => const SizedBox.shrink(),
//                     startup: (audio) => const SizedBox.shrink(),
//                     loading: (audio, stream) => const SizedBox.shrink(),
//                     playing: (audio, stream) {
//                       return Container(
//                         color: Theme.of(context).colorScheme.background,
//                         height: kToolbarHeight,
//                         child: Container(),
//                       );
//                     },
//                     stopped: () => const SizedBox.shrink(), error: () => const SizedBox.shrink());
//               },
//             ),
//             SafeArea(
//                 top: false,
//                 bottom: height <= playerMinHeight ? true : false,
//                 child: DetailedPlayer(isAttachedToHomeScreen: isAttachedToHomeScreen,))
//           ],
//         );
//       },
//       child: child,
//     );
//   }
// }
