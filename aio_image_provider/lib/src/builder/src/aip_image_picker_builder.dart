import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../aio_image_provider.dart';

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

class AipImagePickerWidget extends AipImagePickerBuilder {
  AipImagePickerWidget({
    super.key,
    required super.defaultImage,
    this.imageSize = 100,
  }) : super(
      selectButtonBuilder: _buildSelectButton,
      imageBuilder: (context, image) => _buildImage(context, image, imageSize),
  );
  final double imageSize;

  static Widget _buildImage(BuildContext context, AipImage image, double size) {
    return AipSquareImageWidget(image: image, size: size);
  }
  static Widget _buildSelectButton(BuildContext context) {
    return TextButton.icon(onPressed: () {
      _showActionSheet(context);
    }, label: Text('Select Image'), icon: Icon(Icons.image_search));
  }


  static void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder:
          (BuildContext context) => CupertinoActionSheet(
        title: const Text('Select Image From'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Device'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Image Search'),
          ),
        ],
      ),
    );
  }
}
