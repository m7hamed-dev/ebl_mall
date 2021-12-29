import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/widgets/animal_properties_widget.dart';
import 'package:flutter/material.dart';

class DetailsAdsPage extends StatelessWidget {
  //
  DetailsAdsPage({required this.dataAds});
  //
  final OffersAuctionsClass dataAds;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimalProperty(animal: dataAds),
    );
  }
}
