import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  //
  const Txt({
    Key? key,
    required this.typesTxt,
    required this.data,
    this.color,
  }) : super(key: key);
  //
  final TypesTxt typesTxt;
  final data;
  final Color? color;
  //
  @override
  Widget build(BuildContext context) {
    if (data == null) {
      //
      return Text(
        'لايوجد',
        style: TextStyle(fontSize: 11.0, color: Colors.grey),
      );
    } else {
      //
      switch (typesTxt) {
        //
        case TypesTxt.large:
          return Text(
            data.toString(),
            style: _style(
              typesTxt,
              color: color,
            ),
          );
        //
        case TypesTxt.medium:
          return Text(
            data,
            style: _style(
              typesTxt,
              color: color,
            ),
          );
        //
        case TypesTxt.small:
          return Text(
            data,
            style: _style(
              typesTxt,
              color: color,
            ),
          );
      }
    }
  }
}

TextStyle _style(
  TypesTxt typesTxt, {
  Color? color,
  // double? fontSize,
}) {
  return TextStyle(
    //
    fontFamily: 'pfd',
    fontSize: typesTxt == TypesTxt.large
        ? 20.0
        : (typesTxt == TypesTxt.medium ? 17.0 : 14.0),
    //
    color: color ?? Colors.black,
    // color: typesTxt == TypesTxt.large
    //     ? Colors.black
    //     : Colors.black.withOpacity(.8),
  );
}

//
enum TypesTxt { large, medium, small }
