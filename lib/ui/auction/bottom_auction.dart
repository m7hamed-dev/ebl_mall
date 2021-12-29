import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/auction/add_auction_page.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class BottomAuction extends StatelessWidget {
  const BottomAuction({
    Key? key,
    required this.token,
  }) : super(key: key);
  //
  final String token;
  //
  @override
  Widget build(BuildContext context) {
    // print(_data);
    return Container(
      color: Colors.orange,
      margin: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: () => Push.to(context, _nextPage),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Txt(typesTxt: TypesTxt.medium, data: _data),
            const SizedBox(width: 20.0),
            Icon(Icons.add, size: 30.0),
          ],
        ),
      ),
    );
  }
  String get _data => token.isEmpty ? 'انشئ  حساب اولا' : 'اضافة حراج جديد';
  Widget get _nextPage => token.isEmpty ? SignInPage() : AddAuctionPage();
  //
}
