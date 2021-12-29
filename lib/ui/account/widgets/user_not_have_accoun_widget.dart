import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/account/auth/sign_up_page.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class UserNotHaveAccountWidget extends StatelessWidget {
  const UserNotHaveAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Txt(
            typesTxt: TypesTxt.large,
            data: '!! انت لاتمتلك حساب معنا ',
          ),
          const SizedBox(height: 15.0),
          // sign up
          MyElevatedBtn(
            color: Style.primaryColor,
            radius: 5.0,
            child: Text(
              'إنشاء حساب',
              style: Style.medium(color: Colors.white),
            ),
            onPressed: () {
              Push.to(context, SignUpPage());
            },
          ),
          const SizedBox(height: 15.0),
          // sign in
          MyElevatedBtn(
            color: Style.primaryColor,
            radius: 5.0,
            child: Text(
              'تسجيل دخول',
              style: Style.medium(color: Colors.white),
            ),
            onPressed: () {
              Push.to(context, SignInPage());
            },
          ),
        ],
      ),
    );
  }
}
