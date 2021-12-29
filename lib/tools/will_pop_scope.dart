import 'dart:io';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

Future<bool?> builonBackPressed(BuildContext context) {
  //
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Txt(
            data: 'سيتم إغلاق التطبيق',
            color: Colors.black,
            typesTxt: TypesTxt.medium,
          ),
          content: Txt(
            data: 'هل أنت متأكد ؟  ',
            color: Colors.black,
            typesTxt: TypesTxt.medium,
          ),
          actions: <Widget>[
            MyElevatedBtn(
              color: Style.heighOrang,
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Txt(
                data: 'no',
                color: Colors.black,
                typesTxt: TypesTxt.medium,
              ),
              // color: secondAmber,
              onPressed: () => Navigator.of(context).pop(false),
            ),
            MyElevatedBtn(
              child: Txt(
                data: 'yes',
                color: Colors.black,
                typesTxt: TypesTxt.medium,
              ),
              onPressed: () => exit(0),
            ),
          ],
        ),
      );
    },
  );
}
