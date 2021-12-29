import 'dart:io';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/ui/banner/banner_model.dart';
import 'package:ebll_mall/ui/banner/widgets/swiper.dart';
import 'package:ebll_mall/widgets/error_network_widget.dart';
import 'package:ebll_mall/widgets/server_error.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'shimmer_banner.dart';

class BannerPage extends StatefulWidget {
  const BannerPage();
  //
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  //
  bool _isLoading = true;
  bool _isNetworkError = false;
  bool _isServerError = false;
  List<DataBanner> _banners = <DataBanner>[];
  //
  Widget _body() {
    //
    if (_isLoading) {
      return ShimmerBanner();
    }
    if (_isNetworkError) {
      return Center(child: InternetErrorWidget());
    }
    if (_isServerError) {
      return ServerError();
    }

    return MyOffersSwiper(banners: _banners);
  }

  Future<void> _fetchBanners() async {
    // print('_fetchBanners');
    await API.fetchBanners().then((value) {
      if (!mounted) {
        return;
      } else {
        switch (value) {
          case 500:
            _isServerError = true;
            _isLoading = false;
            _isNetworkError = false;
            setState(() {});
            break;

          default:
            //
            for (var item in value) {
              _banners.add(item);
            }
            _isLoading = false;
            _isServerError = false;
            setState(() {});
        }
      }
    }).catchError((error) {
      print('_fetchBanners error $error');
      if (!mounted) {
        return;
      }
      _isLoading = false;
      _isNetworkError = true;
      _isServerError = false;
      if (error is SocketException) {
        _isLoading = false;
        _isNetworkError = true;
        _isServerError = false;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchBanners();
  }

  // biuld ui
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      height: context.height * 0.25,
      width: context.width,
      child: _body(),
    );
  }
}
