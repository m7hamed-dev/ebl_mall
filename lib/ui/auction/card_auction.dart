import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/ui/auction/details_auction_page.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class CardAuction extends StatelessWidget {
  //
  final OffersAuctionsClass auctionModel;
  //
  const CardAuction({Key? key, required this.auctionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                DetailsauctionPage(auctionModel: auctionModel),
          ),
        );
      },
      //
      child: Container(
        width: 193,
        height: 195,
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              // color: HexColor("#ffffff"),
              color: Colors.grey.shade300,
              blurRadius: 2.0,
              spreadRadius: 2.0,
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: Constants.crossAxisAlignment,
          // mainAxisAlignment: Constants.mainAxisAlignment,
          children: [
            Expanded(
              flex: 2,
              child: Hero(
                tag: auctionModel,
                child: CustomCachedNetworkImage(
                  width: double.infinity,
                  imageUrl: auctionModel.img1,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Txt(typesTxt: TypesTxt.small, data: auctionModel.name),
                    Txt(typesTxt: TypesTxt.large, data: auctionModel.price),
                    Txt(
                        typesTxt: TypesTxt.large,
                        data: auctionModel.auctionEndTime),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
