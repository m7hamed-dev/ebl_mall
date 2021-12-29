import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/profile.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:flutter/material.dart';

class UserAccountDrawerHeader extends StatelessWidget {
  //
  const UserAccountDrawerHeader({Key? key, required this.user})
      : super(key: key);
  //
  final UserModel user;
  //
  @override
  Widget build(BuildContext context) {
    //
    return UserAccountsDrawerHeader(
      onDetailsPressed: () {
        Navigator.pop(context);
        Push.to(context, ProfilePage());
      },
      currentAccountPicture: CustomCachedNetworkImage(
        width: 80.0,
        height: 80.0,
        imageUrl: user.img,
        urlIsProfile: true,
      ),
      accountName: Text(user.name ?? ''),
      accountEmail: Text(user.email ?? ''),
    );
  }
}
