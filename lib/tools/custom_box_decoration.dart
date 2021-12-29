import 'package:flutter/material.dart';

class CustomBoxDecoration {
  //
  static BoxDecoration decoration({Color? color, double? radius}) {
    //
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius ?? 5.0),
      boxShadow: [
        BoxShadow(
          // color: HexColor("#ffffff"),
          color: Colors.grey.shade300,
          blurRadius: 2.0,
          spreadRadius: 2.0,
          offset: Offset(0.0, 2.0),
        )
      ],
    );
  }
}
