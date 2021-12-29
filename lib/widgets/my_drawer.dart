import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/account/auth/sign_up_page.dart';
import 'package:ebll_mall/ui/account/profile.dart';
import 'package:ebll_mall/ui/account/widgets/user_account_drawer_header.dart';
import 'package:ebll_mall/ui/ads/ads_page.dart';
import 'package:ebll_mall/ui/auction/auction_page.dart';
import 'package:ebll_mall/ui/home/home_page.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  //
  const MyDrawer({
    Key? key,
    required this.userModel,
  }) : super(key: key);
  //
  final UserModel userModel;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //
          UserAccountDrawerHeader(user: userModel),
          //
          _item(
            context,
            MyHomePage(),
            text: 'الرئسية ',
            subtitle: 'الصفحه الرئسية',
            icon: Icons.logout,
            isIconHome: true,
          ),
          _div(),
          _item(
            context,
            AdsPage(isShowSearch: true, isShowAdsThanFour: true),
            text: 'الإعلانات ',
            subtitle: 'هنا يمكنك الاطلاع علي الاعلانات الجديده ',
            icon: Icons.admin_panel_settings_outlined,
          ),
          _div(),
          _item(
            context,
            AuctionsPage(isShowSearch: true),
            text: 'حراج - مزاد',
            subtitle: 'كن من متابعي الحراجات',
            icon: Icons.autofps_select_outlined,
          ),
          _div(),
          userModel.accessToken!.isEmpty
              ? _item(
                  context,
                  SignInPage(),
                  text: 'انشئ حسابك',
                  subtitle: 'انشئ حسابك',
                  icon: Icons.account_box,
                )
              : _item(
                  context,
                  ProfilePage(),
                  text: 'الملف الشخصي ',
                  subtitle: 'ادارة ملفك الشخصي',
                  icon: Icons.settings,
                ),

          _div(isLogout: true),

          _item(
            context,
            SignUpPage(),
            icon: Icons.logout,
            isLogout: true,
            text: 'تسجيل خروج',
            subtitle: '',
          ),
        ],
      ),
    );
  }

  Container _div({bool? isLogout}) {
    return Container(
      height: 0.7,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      color: isLogout == true ? Colors.grey.shade300 : Colors.orange.shade100,
    );
  }

  ListTile _item(
    BuildContext context,
    Widget nextPage, {
    required String text,
    String? subtitle,
    bool? isLogout,
    bool? isIconHome,
    IconData? icon,
  }) {
    //

    return ListTile(
      //
      title: Text(text),
      //
      subtitle: Txt(
        typesTxt: TypesTxt.small,
        color: Colors.grey,
        data: subtitle,
      ),
      leading: Icon(icon, color: Colors.orange),
      onTap: () async {
        // if is home close drawer only
        if (isIconHome == true) {
          Navigator.pop(context);
          return;
        } else {
          //
          Navigator.pop(context);
          //
          if (isLogout == true) {
            await LocalStorage.setLogin(false);
            await LocalStorage.resetPresSetting();
            Push.to(context, SignInPage());
          } else
            Push.to(context, nextPage);
        }
      },
    );
  }
}
