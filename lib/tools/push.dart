import 'package:flutter/material.dart';

class Push {
  //
  static void to(BuildContext context, Widget nextPage) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return nextPage;
    }));
  }
}
