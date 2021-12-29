import 'package:flutter/material.dart';

class Mdialog {
  //
  static Future<void> showDilog(BuildContext context,
      {Widget? title, Widget? content}) {
    //
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title,
          content: content,
        );
      },
    );
  }

  //
  static Future<void> showLoading(BuildContext context,
      {Widget? title, Widget? content}) {
    //
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            title: Text('Loading ...'),
            content: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
