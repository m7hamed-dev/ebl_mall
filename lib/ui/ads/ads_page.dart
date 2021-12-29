import 'dart:io';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/ui/ads/grid_view_ads.dart';
import 'package:ebll_mall/widgets/custom_box_decoration.dart';
import 'package:ebll_mall/widgets/error_network_widget.dart';
import 'package:ebll_mall/widgets/no_item_widget.dart';
import 'package:ebll_mall/widgets/server_error.dart';
import 'package:ebll_mall/widgets/shimmer_gridview.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_ads.dart';

class AdsPage extends StatefulWidget {
  //
  const AdsPage({
    Key? key,
    required this.isShowSearch,
    required this.isShowAdsThanFour,
  }) : super(key: key);
  //
  final bool isShowSearch;
  final bool isShowAdsThanFour;

  @override
  _AdsPageState createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  final controller = TextEditingController();
  //
  bool _isLoading = true;
  bool _isNetworkError = false;
  bool _isServerError = false;
  // bool is = false;
  List<OffersAuctionsClass> _allAds = [];
  List<OffersAuctionsClass> _searchAds = [];
  //
  Future _fetchAds() async {
    print('_fetchAds()');
    //
    await API.fetchAds().then((value) {
      print('_value from fetch ads = $value');
      if (!mounted) {
        return;
      }
      //
      if (value == 500) {
        _isServerError = true;
        setState(() {});
        return;
      } else
        //
        // if (value == null) {
        //   _isServerError = true;
        //   setState(() {});
        //   return;
        // } else {
        //
        for (var item in value) {
          // show all auctions
          if (widget.isShowAdsThanFour) {
            _allAds.add(item);
            // print('ads img == ${item.img1}');
          } else {
            if (_allAds.length <= 4) {
              _allAds.add(item);
            }
          }
          // }
          _isLoading = false;
          setState(() {});
        }
    }).catchError((onError) {
      // print('_fetchAds onError $onError');
      if (onError is SocketException) {
        _isNetworkError = true;
        _isLoading = false;
        setState(() {});
      } else
        _isServerError = true;
      _isLoading = false;
      setState(() {});
    });
  }

  /// this is body
  Widget _body() {
    if (_isLoading) {
      return const ShimmerGridView();
    }
    if (_isNetworkError) {
      return InternetErrorWidget();
    }
    if (_allAds.isEmpty) {
      return const NoItemWidget();
    }
    if (_isServerError) {
      return const ServerError();
    }
    if (widget.isShowSearch) {
      //
      _searchAds = controller.text.isEmpty
          ? _allAds
          : _searchAds.where((e) {
              if (e.name!.contains(controller.text.trim())) {
                return true;
              }
              return false;
            }).toList();
      //
      setState(() {});
      return Column(
        children: [
          const SizedBox(height: 10.0),
          //
          _searchWidget(),
          Expanded(
            child: GridViewAds(ads: _searchAds),
          ),
        ],
      );
    }
    // hide search widget
    return GridViewAds(ads: _allAds);
  }

  //
  @override
  void initState() {
    super.initState();
    _fetchAds();
  }

  @override
  Widget build(BuildContext context) {
    //
    if (widget.isShowSearch) {
      return Scaffold(
        appBar: AppBar(
          title: Text('شاشة الاعلانات'),
        ),
        body: SafeArea(
          child: _body(),
        ),
        bottomNavigationBar: BottomAds(),
      );
    }
    return _body();
  }

  Container _searchWidget() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: Custom.customBoxDecoration(),
      child: TextFormField(
        controller: controller,
        onTap: () {},
        onChanged: (v) => setState(() {}),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          prefixIcon: Icon(Icons.search, color: Style.primaryColor),
          // hintTextDirection: TextDirection.,
          hintText: ' بحث',
          // hintStyle: Style.labelStyle(),
          border: InputBorder.none,
          // isDense: true,
          // icon: Icon(Icons.search),
          // enabledBorder: Decorb,
        ),
      ),
    );
  }
}
