import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';

class PersonCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double imageWidth;
  final double imageHeight;
  final bool isFromMain;

  const PersonCacheImage({
    super.key,
    required this.imageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.isFromMain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? '',
        width: imageWidth,
        height: imageHeight,
        imageBuilder: (context, imageProvider) {
          return _imageWidget(imageProvider);
        },
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          return _imageWidget(
            const AssetImage('asset/images/noimage.jpg'),
          );
        },
      ),
    );
  }

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isFromMain
            ? const BorderRadius.only(
                topLeft: Radius.circular(AppConstants.appbarBorderRadius),
                bottomLeft: Radius.circular(AppConstants.appbarBorderRadius),
              )
            : BorderRadius.circular(AppConstants.appbarBorderRadius),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
