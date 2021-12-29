import 'package:ebll_mall/main.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import 'custom_cached_network_img.dart';

class HeroHeaderImages extends StatefulWidget {
  final OffersAuctionsClass animal;

  const HeroHeaderImages({Key? key, required this.animal}) : super(key: key);

  @override
  State<HeroHeaderImages> createState() => _HeroHeaderImagesState();
}

class _HeroHeaderImagesState extends State<HeroHeaderImages> {
  //
  List<String> _imgs = <String>[];
  //
  @override
  void initState() {
    super.initState();
    //
    _imgs = [
      widget.animal.img1 ?? '',
      widget.animal.img2 ?? '',
      widget.animal.img3 ?? '',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.animal,
      child: Container(
        height: context.height * 0.30,
        child: Swiper(
          autoplay: true,
          itemCount: _imgs.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomCachedNetworkImage(
              width: double.infinity,
              imageUrl: _imgs[index],
            );
          },
          // indicatorLayout: PageIndicatorLayout.COLOR,
          pagination: SwiperPagination(
            // alignment: Alignment.bottomCenter,
            builder: SwiperPagination.dots,
          ),
        ),
      ),
    );
  }
}
