import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/account/auth/sign_up_page.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({Key? key, required this.isSignInPage}) : super(key: key);
  //
  final bool isSignInPage;
  @override
  Widget build(BuildContext context) {
    //
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 4.0,
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('او'),
            ),
            Expanded(
              child: Container(
                height: 4.0,
                color: Colors.grey.shade200,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        // btn sign in or sign up
        MyElevatedBtn(
          color: Style.primaryColor,
          radius: 5.0,
          child: Text(
            _data,
            style: Style.bold(color: Colors.white),
          ),
          onPressed: () => Push.to(context, _nextPage),
        ),
      ],
    );
  }

  String get _data => isSignInPage ? 'إنشاء حساب جديد' : 'تسجيل دخول';
  Widget get _nextPage => isSignInPage ? SignUpPage() : SignInPage();
}
