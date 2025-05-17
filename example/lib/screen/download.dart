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
      appBar: AppBar(title: Text('Download'),),
      body: ListView.builder(itemBuilder: (context, index) {
        final item = downloadMockList[index];
        return ListTile(
          title: Text(item.fileName!),
          trailing: BlocBuilder<AdmDownloadItemBloc, AdmDownloadItemState>(
            builder: (context, state) {
              if(state is AdmDownloadItemLoaded) {
                if(state.update.task.taskId == item.id) {
                  return CircularProgressIndicator(value: state.update.progress,);
                }
              }
              return IconButton(onPressed: () {
                context.read<AdmDownloadListBloc>().add(
                    AdmAddItemToQueue(item));
              }, icon: Icon(Icons.download));
            },
          ),
        );
      }, itemCount: downloadMockList.length,),
    );
  }
}
