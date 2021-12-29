import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/details_ads/details_ads_page.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class CardAds extends StatelessWidget {
  //
  const CardAds({Key? key, required this.adsModel}) : super(key: key);
  //
  final OffersAuctionsClass adsModel;

  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: EdgeInsets.all(4.0),
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
      child: InkWell(
        onTap: () => Push.to(
            context,
            DetailsAdsPage(
              dataAds: adsModel,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: adsModel,
                child: CustomCachedNetworkImage(
                  imageUrl: adsModel.img1!,
                  width: 120.0,
                  height: 120.0,
                ),
              ),
            ),
            Text(adsModel.name!, style: Style.tiny()),
            //
            Txt(data: '${adsModel.price} SDG', typesTxt: TypesTxt.medium),
            Text('${adsModel.price} SDG', style: Style.subTitle()),
            //
          ],
        ),
      ),
    );
  }
}
