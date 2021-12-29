import 'package:ebll_mall/models/my_offers_model.dart';
import 'package:flutter/material.dart';

import 'offers_card.dart';

class MyOffersList extends StatelessWidget {
  //
  const MyOffersList(
      {Key? key, required this.myOfferModel, required this.itemCount})
      : super(key: key);
  //
  final List<MyOfferModel> myOfferModel;
  final itemCount;
  //
  @override
  Widget build(BuildContext context) {
    //
    return GridView.builder(
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        //
        return OfferCard(myOfferModel: myOfferModel[index]);
      },
    );
  }
}
