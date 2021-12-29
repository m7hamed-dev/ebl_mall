import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class InternetErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/internet_error.jpeg',
            height: 90.0,
          ),
          Txt(
            typesTxt: TypesTxt.small,
            data: Constants.internetError,
          ),
        ],
      ),
    );
  }
}
