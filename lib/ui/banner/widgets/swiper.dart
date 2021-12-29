import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';

import '../banner_model.dart';

class MyOffersSwiper extends StatelessWidget {
  const MyOffersSwiper({Key? key, required this.banners}) : super(key: key);
  final List<DataBanner> banners;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: banners.length,

      itemBuilder: (BuildContext context, int index) {
        print('object');
        //
        return InkWell(
          onTap: () => _showDialogDetailsBanner(banners[index], context),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: CustomCachedNetworkImage(
              width: double.infinity,
              imageUrl: banners[index].img,
            ),
          ),
        );
      },
      // indicatorLayout: PageIndicatorLayout.COLOR,
      autoplay: true,
      // control: SwiperControl(),
      loop: true,
      viewportFraction: 0.8,
      scale: 0.9,
      // layout: SwiperLayout.STACK,
      pagination: SwiperPagination(
        // alignment: Alignment.bottomCenter,
        builder: SwiperPagination.dots,
        margin: EdgeInsets.only(top: 10.0),
      ),
      // indicatorLayout: PageIndicatorLayout.COLOR,
    );
  }

  void _showDialogDetailsBanner(DataBanner banner, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            banner.title ?? '',
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCachedNetworkImage(
                height: 200.0,
                width: 200.0,
                imageUrl: banner.img,
              ),
              Text(
                banner.content ?? '',
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}
