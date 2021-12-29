import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/tools/will_pop_scope.dart';
import 'package:ebll_mall/ui/auction/auction_page.dart';
import 'package:ebll_mall/ui/banner/banner_page.dart';
import 'package:ebll_mall/ui/category/category_page.dart';
import 'package:ebll_mall/ui/home/widgets/title.dart';
import 'package:ebll_mall/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class WidgetsHomePage extends StatelessWidget {
  //
  const WidgetsHomePage({Key? key}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      child: WillPopScope(
        onWillPop: (() => builonBackPressed(context).then((value) => value!)),
        child: ListView(
          children: [
            //
            const SearchWidget(),
            //
            const BannerPage(),
            //
            const TitleAndDesc(
              contentName: 'الأقسام الرئيسية',
            ),
            //
            const CategoriesPage(
              isShowScaffold: false,
            ),
            // show auction page
            TitleAndDesc(
              contentName: 'حراجات',
              page: const AuctionsPage(
                isShowSearch: true,
                showAllAuctions: true,
              ),
            ),
            // auctions
            const AuctionsPage(
              isShowSearch: false,
              showAllAuctions: false,
            ),
          ],
        ),
      ),
    );
  }
}
