import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bloc/bloc.dart';

class AdmBlocProvider extends StatelessWidget {
  const AdmBlocProvider({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider(create: (context) => GetIt.I<AdmDownloadListBloc>()),
      BlocProvider(create: (context) => GetIt.I<AdmDownloadItemBloc>()),
    ], child: child,);
  }
}
