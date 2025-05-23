import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/apb_player/apb_player_bloc.dart';
import '../../bloc/apb_timer/apb_timer_cubit.dart';

class ApbBlocProvider extends StatelessWidget {
  const ApbBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<ApbPlayerBloc>()),
        BlocProvider(create: (context) => GetIt.I<ApbTimerCubit>())
      ],
      child: child,
    );
  }
}
