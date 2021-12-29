import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/widgets/asset_img.dart';
import 'package:flutter/material.dart';

class NoItemWidget extends StatelessWidget {
  // constructor
  const NoItemWidget({this.title, this.imgUrl, this.width, this.height});
  //
  final String? title;
  final String? imgUrl;
  final double? width, height;
  // build method
  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title ?? 'لاتوجد بيانات',
            style: Style.labelStyle(color: Colors.black),
          ),
          AssetImg(
            imageUrl: imgUrl ?? 'no-data.jpeg',
            width: width,
            height: height,
          ),
        ],
      ),
    );
  }
}
