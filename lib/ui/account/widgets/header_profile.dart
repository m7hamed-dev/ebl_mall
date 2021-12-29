import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/tools/custom_box_decoration.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/update_profile.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class HeaderProfileWidget extends StatelessWidget {
  //
  final UserModel userModel;
  //
  const HeaderProfileWidget({Key? key, required this.userModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: CustomBoxDecoration.decoration(),
      child: ListTile(
        title: Txt(
          data: userModel.name,
          typesTxt: TypesTxt.medium,
        ),
        subtitle: Txt(
          data: userModel.email,
          typesTxt: TypesTxt.small,
        ),
        leading: Hero(
          tag: userModel,
          child: CustomCachedNetworkImage(
            width: 66.0,
            height: 78.0,
            imageUrl: userModel.img,
            urlIsProfile: true,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            Push.to(
              context,
              UpdateProfileUser(
                userModel: userModel,
                imgUrl: userModel.img,
              ),
            );
          },
          icon: Icon(Icons.edit),
        ),
      ),
    );
  }
}
