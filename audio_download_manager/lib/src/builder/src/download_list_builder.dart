import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../audio_download_manager.dart';

class AdmDownloadListBuilder extends StatelessWidget {
  const AdmDownloadListBuilder({
    super.key,
    required this.loadingBuilder,
    required this.loadedBuilder,
    required this.errorBuilder,
  });

  final Widget Function(BuildContext context) loadingBuilder;
  final Widget Function(
    BuildContext context,
      List<AdmDownloadModel> enqueuedList,
      List<AdmDownloadModel> downloadingList,
    List<AdmDownloadModel> downloadedList,
  )
  loadedBuilder;
  final Widget Function(BuildContext context) errorBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdmDownloadListBloc, AdmDownloadListState>(
      builder: (context, state) {
        switch (state.status) {
          case AdmDownloadListStatus.loading:
            return loadingBuilder(context);
          case AdmDownloadListStatus.loaded:
            return loadedBuilder(
              context,
              state.enqueuedList,
              state.downloadingList,
              state.downloadedList,
            );
          case AdmDownloadListStatus.error:
            return errorBuilder(context);
        }
      },
    );
  }
}
