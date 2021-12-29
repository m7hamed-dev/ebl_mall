import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/auction/auction_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SearchWidget extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 60,
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 0.0,
          right: 10.0,
          left: 10.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: HexColor("#1c000000"),
              blurRadius: 11.0,
              spreadRadius: 0.0,
              offset: Offset(0.0, 1.0),
            )
          ],
        ),
        child: TextFormField(
          onTap: () => Push.to(context, AuctionsPage(isShowSearch: true)),
          // onTap: () => Push.goTo(context, SearchAnimalsPage()),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            prefixIcon: Icon(Icons.search, color: Style.primaryColor),
            // hintTextDirection: TextDirection.,
            hintText: ' بحث',
            hintStyle: Style.labelStyle(),
            border: InputBorder.none,
            // isDense: true,
            // icon: Icon(Icons.search),
            // enabledBorder: Decorb,
          ),
        ),
    );
  }
}
