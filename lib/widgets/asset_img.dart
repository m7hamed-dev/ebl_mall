import 'package:flutter/material.dart';

class AssetImg extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AssetImg(
      {Key? key, required this.imageUrl, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Image.asset(
      'assets/images/$imageUrl',
      width: width ?? 100.0,
      height: height ?? 100.0,
      fit: fit ?? BoxFit.cover,
    );
  }
}
