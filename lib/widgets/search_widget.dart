import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/hide_keyboard.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/details_ads/search_animals_page.dart';
import 'package:ebll_mall/ui/search/search_page.dart';
import 'package:flutter/material.dart';
import 'custom_box_decoration.dart';

class SearchWidget extends StatelessWidget {
  //
  const SearchWidget({this.onChange, this.controller});
  final Function(dynamic)? onChange;
  //
  final TextEditingController? controller;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: Custom.customBoxDecoration(),
      child: TextFormField(
        controller: controller,
        onTap: () {
          Push.to(context, SearchPage());
          KeyboardUtil.hideKeyboard(context);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          prefixIcon: Icon(Icons.search, color: Style.primaryColor),
          // hintTextDirection: TextDirection.,
          hintText: ' بحث',
          // hintStyle: Style.labelStyle(),
          border: InputBorder.none,
          // isDense: true,
          // icon: Icon(Icons.search),
          // enabledBorder: Decorb,
        ),
      ),
    );
  }
}
