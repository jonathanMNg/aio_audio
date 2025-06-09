import 'dart:io';
import 'package:flutter/material.dart';
import '../../../aio_image_provider.dart';

class AipImageWidget extends StatelessWidget {
  const AipImageWidget({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit,
  });

  final AipImage image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    switch (image.type) {
      case AipImageType.file:
        final imagePath = image.path!.contains(RegExp('[\\/]')) ? image.path! : "${AioImageProvider().saveDirectory}/${image.path!}";
        return Image.file(
          File(imagePath),
          fit: fit,
          height: height,
          width: width,
          errorBuilder: (context, error, stackTrace) {
            return _buildAipErrorWidget(
              context,
              error,
              stackTrace,
              height,
              width,
            );
          },
        );
      case AipImageType.url:
        return Image.network(
          image.url!,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return _buildAipErrorWidget(
              context,
              error,
              stackTrace,
              height,
              width,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            return _buildAipLoadingWidget(
              context,
              child,
              loadingProgress,
              height,
              width,
            );
          },
        );
      case AipImageType.asset:
        return Image.asset(
          image.assetName!,
          height: height,
          width: width,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            return _buildAipErrorWidget(
              context,
              error,
              stackTrace,
              height,
              width,
            );
          },
        );
    }
  }
}

Widget _buildAipErrorWidget(
  BuildContext context,
  Object error,
  StackTrace? stackTrace,
  double? height,
  double? width,
) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(border: Border.all(color: Colors.red,), borderRadius: BorderRadius.circular(25)),
    child: Center(child: const Text('Image not found', style: TextStyle(fontSize: 12,),textAlign: TextAlign.center,)),
  );
}

Widget _buildAipLoadingWidget(
  BuildContext context,
  Widget child,
  ImageChunkEvent? loadingProgress,
  double? height,
  double? width,
) {
  if (loadingProgress == null) return child;
  return Center(
    child: SizedBox(
      height: height,
      width: width,
      child: CircularProgressIndicator(
        value:
            loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
      ),
    ),
  );
}

class AipSquareImageWidget extends StatelessWidget {
  const AipSquareImageWidget({super.key, this.size = 150, required this.image});
  final double size;
  final AipImage image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: size,
        width: size,
        child: AspectRatio(
          aspectRatio: 1,
          child: AipImageWidget(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


