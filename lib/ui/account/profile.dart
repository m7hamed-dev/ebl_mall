import 'dart:io';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/my_offers_model.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/ui/account/list_my_offers.dart';
import 'package:ebll_mall/ui/account/widgets/header_profile.dart';
import 'package:ebll_mall/ui/account/widgets/user_not_have_accoun_widget.dart';
import 'package:ebll_mall/widgets/custom_chip.dart';
import 'package:ebll_mall/widgets/error_network_widget.dart';
import 'package:ebll_mall/widgets/no_item_widget.dart';
import 'package:ebll_mall/widgets/server_error.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'widgets/shimmer_profile.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //
  List<MyOfferModel> _offers = <MyOfferModel>[];
  //
  bool _userIsNotHaveAccount = true;
  bool isLoading = true;
  bool _isNetworkError = false;
  bool isEmptyList = false;
  bool isServerErro = false;
  String _token = '';
  //
  Future<void> _fetchMyOffers() async {
    print('_fetchMyOffers');
    //
    if (_token.isNotEmpty) {
      //
      _userIsNotHaveAccount = false;
      await API.fetchMyOffers(_token).then((value) {
        if (!mounted) {
          return;
        }
        if (value == 500) {
          isLoading = false;
          setState(() {});
          return;
        }
        //
        if (value != null) {
          for (var item in value) {
            _offers.add(item);
            print('item = ${item.img1}');
          }
          isLoading = false;
          setState(() {});
        } else {
          _offers = [];
        }
        //
      }).catchError((onError) {
        print('onError FetchMyOffers() $onError');
        if (onError is SocketException) {
          isLoading = false;
          _isNetworkError = true;
          setState(() {});
        }
      });
      return;
    } else {
      _userIsNotHaveAccount = true;
      isLoading = false;
      _isNetworkError = false;
      setState(() {});
    }
  }

  UserModel _userModel =
      UserModel(id: 0, img: '', name: '', password: '', email: '');

  @override
  void initState() {
    super.initState();
    //
    _token = LocalStorage.getToekn;
    //
    _userModel = LocalStorage.getUserModelFromPrefs();
    //
    _fetchMyOffers();
  }

  Widget _body() {
    //
    if (_userIsNotHaveAccount) {
      return const UserNotHaveAccountWidget();
    }
    if (isLoading) {
      return ShimmerProfile();
    }
    if (_isNetworkError) {
      return InternetErrorWidget();
    }

    if (isServerErro) {
      return ServerError();
    }
    if (_offers.isEmpty) {
      return Center(child: NoItemWidget(width: 90.0, height: 90.0));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // header
        HeaderProfileWidget(userModel: _userModel),
        //
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomChip(
            label: Txt(data: 'اعلاناتك', typesTxt: TypesTxt.medium),
          ),
        ),

        Expanded(
          child: MyOffersList(
            myOfferModel: _offers,
            itemCount: _offers.length,
          ),
        ),
      ],
    );
  }

//
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text('شاشة الملف الشخصي')),
      body: SafeArea(
        child: _body(),
      ),
    );
  }
}
