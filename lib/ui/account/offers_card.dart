import 'package:ebll_mall/models/my_offers_model.dart';
import 'package:ebll_mall/tools/custom_box_decoration.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  //
  const OfferCard({
    Key? key,
    required this.myOfferModel,
  }) : super(key: key);

  final MyOfferModel myOfferModel;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      margin: EdgeInsets.all(4.0),
      decoration: CustomBoxDecoration.decoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CustomCachedNetworkImage(
              imageUrl: myOfferModel.img1,
              height: 100.0,
            ),
            //
          ),
          Txt(typesTxt: TypesTxt.medium, data: myOfferModel.name),
          Txt(typesTxt: TypesTxt.medium, data: myOfferModel.location),
          Txt(typesTxt: TypesTxt.medium, data: myOfferModel.price),
        ],
      ),
    );
  }
}
