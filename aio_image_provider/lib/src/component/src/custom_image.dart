import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedNetworkImageBuilder extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Widget? errorWidget;
  final Function()? onTap;
  final Function()? onTapErrorWidget;

  const CustomCachedNetworkImageBuilder(
      {super.key, required this.imageUrl, this.width, this.height,
        this.errorWidget, this.onTap, this.onTapErrorWidget});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: AspectRatio(
          aspectRatio: 1,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            imageBuilder: (context, imageProvider) => GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter),
                ),
              ),
            ),
            errorWidget: (context, object, errorObject) {
              return GestureDetector(onTap: onTapErrorWidget, child: errorWidget ?? CachedNetworkImage(imageUrl: 'https://res.cloudinary.com/jnappdev/image/upload/v1718057643/musicium/bykfrfphyn81q68yptyw.jpg', width: width, height: height,));
            },
            placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
          ),
        ));
  }
}
class SearchImageWidget extends CustomCachedNetworkImageBuilder {
  SearchImageWidget({super.key, required super.imageUrl, super.onTap, super.onTapErrorWidget})
      : super(width: null, height: null, errorWidget: CachedNetworkImage(imageUrl: 'https://res.cloudinary.com/jnappdev/image/upload/v1718057643/musicium/bykfrfphyn81q68yptyw.jpg'));
}