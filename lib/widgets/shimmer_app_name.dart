import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class WidgetAppName extends StatelessWidget {
  const WidgetAppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return Txt(
      data: Constants.appName,
      typesTxt: TypesTxt.large,
      color: Colors.white,
    );
  }
}
