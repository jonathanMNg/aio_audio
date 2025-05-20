import 'package:audio_download_manager/audio_download_manager.dart';
import 'package:example/provider/download/download_mock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Download')),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = downloadMockList[index];
              return ListTile(
                title: Text(item.fileName!),
                trailing: SizedBox(
                  width: 30, height: 30,
                  child: AdmItemBuilder(
                    defaultBuilder: (context) {
                      return IconButton(onPressed: (){
                        context.read<AdmDownloadListBloc>().add(AdmAddItemToQueue(item));
                      }, icon: Icon(Icons.download));
                    },
                    enqueuedBuilder: (context) {
                      return CircularProgressIndicator();
                    },
                    downloadingBuilder: (context, progress) {
                      return CircularProgressIndicator(value: progress,);
                    },
                    downloadedBuilder: (context) {
                      return Icon(Icons.done);
                    },
                    itemId: item.id!,
                  ),
                ),
              );
            },
            itemCount: downloadMockList.length,
          ),
          // BlocBuilder<AdmDownloadListBloc, AdmDownloadListState>(
          //   builder: (context, state) {
          //     return ListView(
          //       shrinkWrap: true,
          //       physics: NeverScrollableScrollPhysics(),
          //       children: [
          //         _buildEnqueued(state.enqueuedList),
          //         _buildDownloading(state.downloadingList),
          //         _buildCompleted(state.downloadedList),
          //         _buildFailed(state.failedList),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildDownloading(List<AdmDownloadModel> downloadingList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = downloadingList[index];
        return ListTile(title: Text('${item.fileName!} Downloading'));
      },
      itemCount: downloadingList.length,
      shrinkWrap: true,
    );
  }

  Widget _buildCompleted(List<AdmDownloadModel> completedList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = completedList[index];
        return ListTile(title: Text('${item.fileName!} Completed'));
      },
      itemCount: completedList.length,
      shrinkWrap: true,
    );
  }

  Widget _buildEnqueued(List<AdmDownloadModel> enqueuedList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = enqueuedList[index];
        return ListTile(title: Text('${item.fileName!} Enqueued'));
      },
      itemCount: enqueuedList.length,
      shrinkWrap: true,
    );
  }

  Widget _buildFailed(List<AdmDownloadModel> failedList) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = failedList[index];
        return ListTile(title: Text('${item.fileName!} Failed'));
      },
      itemCount: failedList.length,
      shrinkWrap: true,
    );
  }
}
