import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ApbCachedImageBuilder extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const ApbCachedImageBuilder(
      {super.key, required this.imageUrl, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
            ),
            errorWidget: (context, object, errorWidget) =>
                Icon(Icons.music_note),
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
            errorListener: (error) {
              // ignore
            },
          ),
        ));
  }
}