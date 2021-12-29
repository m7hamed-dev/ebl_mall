import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:flutter/material.dart';

import 'card_ads.dart';

class GridViewAds extends StatelessWidget {
  //
  const GridViewAds({required this.ads});
  //
  final List<OffersAuctionsClass> ads;
  //
  @override
  Widget build(BuildContext context) {
    //
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      scrollDirection: Axis.vertical,
      itemCount: ads.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        //
        return CardAds(adsModel: ads[index]);
      },
    );
  }
}
