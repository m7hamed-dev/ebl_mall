import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/widgets/asset_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class ServerError extends StatelessWidget {
  const ServerError();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Txt(
              typesTxt: TypesTxt.medium,
              data: Constants.serverError,
            ),
            AssetImg(
              imageUrl: 'internet_error.jpeg',
              width: 180.0,
              height: 180.0,
            )
          ],
        ),
      ),
    );
  }
}
