// import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'asset_img.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  //
  final String? imageUrl;
  // final bool? isAnimal;
  final bool? urlIsProfile;
  final double? width;
  final double? height;
  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  //
  const CustomCachedNetworkImage({
    Key? key,
    this.imageUrl,
    this.width,
    this.height,
    this.shape,
    this.urlIsProfile,
    this.borderRadius,
  }) : super(key: key);
  //
  //
  @override
  Widget build(BuildContext context) {
    //
    return ExtendedImage.network(
      imageUrl ?? '',
      width: width,
      height: height,
      fit: BoxFit.fill,
      cache: true,
      shape: urlIsProfile == true ? BoxShape.circle : BoxShape.rectangle,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          //
          case LoadState.loading:
            // _controller.reset();
            return AssetImg(
              imageUrl:
                  urlIsProfile == true ? 'profile.png' : 'placeholder.jpeg',
              width: width,
              height: height,
              fit: BoxFit.fill,
            );

          case LoadState.completed:
            // print('LoadState.completed');
            // _controller.forward();
            return ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: width,
              height: height,
              fit: BoxFit.fill,
              // centerSlice: Rect.largest,
            );
          //
          case LoadState.failed:
            // print('LoadState.failed');
            return AssetImg(
              imageUrl: urlIsProfile == true ? 'profile.png' : 'no_img.jpeg',
              width: width,
              height: height,
              // fit: BoxFit.contain,
              // fit: BoxFit.fill,
            );
        }
      },
    );
  }
}
