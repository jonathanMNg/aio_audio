import 'package:audio_download_manager/audio_download_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bloc/download_item/adm_download_item_bloc.dart';

class AdmBlocProvider extends StatelessWidget {
  const AdmBlocProvider({super.key, required this.child, required this.listProvider});
  final Widget child;
  final AdmDownloadListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
      BlocProvider(create: (context) => AdmDownloadListBloc(downloadListProvider: listProvider)),
      BlocProvider(create: (context) => GetIt.I<AdmDownloadItemBloc>()),
    ], child: child);
  }
}
