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
    List<AdmDownloadModel> failedList,
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
              state.failedList,
            );
          case AdmDownloadListStatus.error:
            return errorBuilder(context);
        }
      },
    );
  }
}

class AdmItemBuilder extends StatelessWidget {
  const AdmItemBuilder({
    super.key,
    required this.defaultBuilder,
    required this.enqueuedBuilder,
    required this.downloadingBuilder,
    required this.downloadedBuilder,
    this.failedBuilder, required this.itemId,
  });

  final Widget Function(BuildContext context) defaultBuilder;
  final Widget Function(BuildContext context) enqueuedBuilder;
  final Widget Function(BuildContext context, double? progress) downloadingBuilder;
  final Widget Function(BuildContext context) downloadedBuilder;
  final Widget Function(BuildContext context)? failedBuilder;
  final String itemId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdmDownloadListBloc, AdmDownloadListState>(
      builder: (context, listState) {
        if(!listState.downloadedList.map((e) => e.id).toList().contains(itemId)) {
          if (listState.enqueuedList
              .map((e) => e.id)
              .toList()
              .contains(itemId)) {
            return enqueuedBuilder(context);
          } else if (listState.downloadingList
              .map((e) => e.id)
              .toList()
              .contains(itemId)) {
            return BlocBuilder<AdmDownloadItemBloc,
                AdmDownloadItemState>(
              builder: (context, itemState) {
                if(
                itemState.taskId != null &&
                    itemState.taskId == itemId) {
                  return downloadingBuilder(context, itemState.update?.progress);
                }
                return defaultBuilder(context);
              },
            );
          }
          return defaultBuilder(context);
        }
        else {
          return downloadedBuilder(context);
        }
      },
    );
  }
}
