import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/widgets/custom_box_decoration.dart';
import 'package:ebll_mall/widgets/error_network_widget.dart';
import 'package:ebll_mall/widgets/no_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'bottom_auction.dart';
import 'grid_view_auction.dart';

class AuctionsPage extends StatefulWidget {
  //
  final bool isShowSearch;
  final bool? showAllAuctions;
  //
  const AuctionsPage({
    Key? key,
    required this.isShowSearch,
    this.showAllAuctions,
  }) : super(key: key);
  //
  @override
  _AuctionsPageState createState() => _AuctionsPageState();
}

class _AuctionsPageState extends State<AuctionsPage> {
  //
  final TextEditingController _searchController = TextEditingController();
  //
  String _token = '';
  bool isLoading = true;
  bool isNetworkError = false;
  // bool is = false;
  List<OffersAuctionsClass> _auctionsList = <OffersAuctionsClass>[];
  List<OffersAuctionsClass> _searcAuctionsList = <OffersAuctionsClass>[];
  //
  Future<void> _fetchAuctions() async {
    //
    EasyLoading.show(status: ' جاري جلب البيانات ');
    await API.fetchAuctions().then((value) {
      //
      EasyLoading.dismiss();
      //
      if (!mounted) {
        return;
      }
      if (value != null) {
        //
        for (var item in value) {
          if (widget.showAllAuctions == true) {
            _auctionsList.add(item);
            print('length = ${_auctionsList.length}');
          } else {
            if (_auctionsList.length < 4) {
              _auctionsList.add(item);
            }
          }
        }
        isLoading = false;
        setState(() {});
      }
    }).catchError((onError) {
      //
      //
      if (!mounted) {
        return;
      }
      if (onError is SocketException) {
        MyCustomEasyLoading.showError(isInternetError: false);
        isLoading = false;
        isNetworkError = true;
        setState(() {});
      }
    });
  }

  Widget _body() {
    //
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    //
    if (_auctionsList.isEmpty) {
      return NoItemWidget();
    }
    //
    if (isNetworkError) {
      return InternetErrorWidget();
    }
    //
    if (widget.isShowSearch == true) {
      //
      //
      _searcAuctionsList = _searchController.text.trim().isEmpty
          ? _auctionsList
          : _auctionsList.where((e) {
              if (e.name!.contains(_searchController.text.trim()) ||
                  e.price
                      .toString()
                      .startsWith(_searchController.text.trim())) {
                return true;
              }
              return false;
            }).toList();
      //
      return Column(
        children: [
          _searchWidget(),
          Expanded(
              child: GridViewAuction(
            showGridInHomePage: false,
            auctions: _searcAuctionsList,
          )),
        ],
      );
    }

    return GridViewAuction(
      auctions: _auctionsList,
      showGridInHomePage: false,
    );
  }

  //
  @override
  void initState() {
    super.initState();
    _token = LocalStorage.getToekn;
    _fetchAuctions();
  }

  @override
  Widget build(BuildContext context) {
    //
    if (widget.isShowSearch == false) {
      return GridViewAuction(
        auctions: _auctionsList,
        showGridInHomePage: true,
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('شاشة الحراجات')),
      bottomNavigationBar: BottomAuction(token: _token),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: _body(),
        ),
      ),
    );
  }

  Container _searchWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: Custom.customBoxDecoration(),
      child: TextFormField(
        controller: _searchController,
        onChanged: (value) {
          //
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          // contentPadding: EdgeInsets.zero,
          prefixIcon: Icon(Icons.search, color: Style.primaryColor),
          suffix: _searcAuctionsList.isEmpty
              ? const SizedBox(width: 0.0, height: 0.0)
              : InkWell(
                  child: Icon(Icons.clear, color: Colors.red),
                  onTap: () {
                    _searcAuctionsList.length = 0;
                    setState(() {});
                  },
                ),
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

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}
