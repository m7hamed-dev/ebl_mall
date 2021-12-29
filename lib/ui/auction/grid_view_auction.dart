import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:flutter/material.dart';
import 'card_auction.dart';

class GridViewAuction extends StatelessWidget {
  final bool showGridInHomePage;
  //
  final List<OffersAuctionsClass> auctions;

  const GridViewAuction({
    Key? key,
    required this.auctions,
    required this.showGridInHomePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
      ),
      scrollDirection: Axis.vertical,
      itemCount: auctions.length,
      shrinkWrap: showGridInHomePage ? true : false,
      physics: showGridInHomePage
          ? NeverScrollableScrollPhysics()
          : BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        //
        return CardAuction(
          auctionModel: auctions[index],
        );
      },
    );
  }
}
