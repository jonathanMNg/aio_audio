import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../aio_image_provider.dart';
import '../../screen/screen.dart';

class AipImagePickerBuilder extends StatelessWidget {
  const AipImagePickerBuilder({
    super.key,
    required this.selectButtonBuilder,
    required this.imageBuilder,
    required this.defaultImage,
  });

  final Widget Function(BuildContext context) selectButtonBuilder;
  final Widget Function(BuildContext context, AipImage image) imageBuilder;
  final AipImage defaultImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 15,
      children: [
        imageBuilder(context, defaultImage),
        selectButtonBuilder(context),
      ],
    );
  }
}

typedef AipDeviceImagePickerBuilderCallback =
    void Function(String tempFilePath);
typedef AipSearchImagePickerBuilderCallback = void Function(String imageUrl);

class AipImagePickerWidget extends AipImagePickerBuilder {
  AipImagePickerWidget({
    super.key,
    required super.defaultImage,
    this.imageSize = 150,
    required this.onSelectImage,
    required this.onSearchImage,
    this.query,
  }) : super(
         selectButtonBuilder:
             (context) =>
                 _buildSelectButton(context, onSelectImage, onSearchImage, query),
         imageBuilder:
             (context, image) => _buildImage(context, image, imageSize),
       );
  final String? query;
  final double imageSize;
  final AipDeviceImagePickerBuilderCallback onSelectImage;
  final AipSearchImagePickerBuilderCallback onSearchImage;

  static Widget _buildImage(BuildContext context, AipImage image, double size) {
    return AipSquareImageWidget(image: image, size: size);
  }

  static Widget _buildSelectButton(
    BuildContext context,
    AipDeviceImagePickerBuilderCallback onSelectImage,
    AipSearchImagePickerBuilderCallback onSearchImage,
    String? query,
  ) {
    return TextButton.icon(
      onPressed: () {
        _showActionSheet(context, onSelectImage, onSearchImage, query);
      },
      label: Text('Select Image'),
      icon: Icon(Icons.image_search),
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.blue),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
    );
  }

  static void _showActionSheet(
    BuildContext context,
    AipDeviceImagePickerBuilderCallback onSelectImage,
    AipSearchImagePickerBuilderCallback onSearchImage,
    String? query,
  ) {
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (BuildContext context) => CupertinoActionSheet(
            title: const Text('Select Image From'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  FilePickerResult? result = await FilePicker.platform
                      .pickFiles(type: FileType.image);
                  if (result != null) {
                    File file = File(result.files.single.path!);
                    onSelectImage(file.path);
                  } else {
                    // User canceled the picker
                  }
                },
                child: const Text('Device'),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  Navigator.pop(context);
                  final imageUrl = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              SearchImageScreenPage(searchKey: query ?? ''),
                    ),
                  );
                  onSearchImage(imageUrl!);
                },
                child: const Text('Image Search'),
              ),
            ],
          ),
    );
  }
}
