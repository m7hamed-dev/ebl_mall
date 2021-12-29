import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/home/home_page.dart';
import 'package:flutter/material.dart';

import 'my_elevated_btn.dart';

class SkipBtn extends StatelessWidget {
  const SkipBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyElevatedBtn(
      color: Colors.orange.shade100,
      // color: Style.primaryColor,
      radius: 5.0,
      child: Text(
        'تخطي',
        style: Style.bold(color: Style.primaryColor),
      ),
      onPressed: () async {
        Navigator.pop(context);
        //
        await LocalStorage.setLogin(false);
        await LocalStorage.resetPresSetting();
        //
        Push.to(
          context,
          Directionality(
            textDirection: TextDirection.rtl,
            child: MyHomePage(),
          ),
        );
      },
    );
  }
}
