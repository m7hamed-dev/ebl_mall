import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Custom {
  static customBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: HexColor("#1c000000"),
          blurRadius: 11.0,
          spreadRadius: 0.0,
          offset: Offset(0.0, 1.0),
        )
      ],
    );
  }
}
