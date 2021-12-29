import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/models/sub_category_model.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/ui/ads/grid_view_ads.dart';
import 'package:ebll_mall/ui/category/listview_category.dart';
import 'package:ebll_mall/ui/category/widgets/info_select_category.dart';
import 'package:ebll_mall/widgets/custom_loading.dart';
import 'package:ebll_mall/widgets/server_error.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:http/http.dart' as http;
import 'package:ebll_mall/models/category_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/widgets/error_network_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/shimmer_category.dart';

// all categories
class CategoriesPage extends StatefulWidget {
  //
  final bool isShowScaffold;
  final String? selectCategoryName;
  final int? selectCategoryID;

  const CategoriesPage({
    required this.isShowScaffold,
    this.selectCategoryID,
    this.selectCategoryName,
  });
  //
  @override
  _mainCategoriesPageState createState() => _mainCategoriesPageState();
}

class _mainCategoriesPageState extends State<CategoriesPage> {
  //
  // properties sub category
  String _subCatValue = '';
  bool _isLoadingSubCategories = true;
  bool _isLoadingMainCategories = true;
  bool _isInternetError = false;
  List<SubCategory> _subCategories = <SubCategory>[];
  // properties ads
  // bool _isLoadingAds = false;
  List<OffersAuctionsClass> _ads = [];
  //
  bool isLoading = true;
  bool _isServerError = false;
  int _subCategoryID = 0;
  // int _index = 0;
  //
  List<CategoryModel> _mainCategories = <CategoryModel>[];
  //
  Future<void> _fetchSubCategoriesByCatID() async {
    //
    try {
      final _url = Constants.baseUrl +
          'SubCatogery/catogeries/${widget.selectCategoryID}';
      //
      await http.get(Uri.parse(_url)).then((res) {
        // print('_response categories ####################\n ${_response.body}');
        //
        if (!mounted) {
          return;
        }
        switch (res.statusCode) {
          //
          case 200:
            final subCategoryModel = subCategoryModelFromJson(res.body).data;
            //
            for (SubCategory category in subCategoryModel) {
              _subCategories.add(category);
            }
            _isLoadingSubCategories = false;
            setState(() {});
            break;
          //
          case 500:
            //
            _isLoadingSubCategories = false;
            _isServerError = true;
            setState(() {});
            break;
        }
      });
    } catch (e) {
      if (!mounted) {
        return;
      }
      if (e is SocketException) {
        _isLoadingSubCategories = false;
        _isInternetError = true;
        setState(() {});
      }
    }
  }

  //
  Future _fetchOffersBySubCatID() async {
    //
    MyCustomEasyLoading.show();
    //
    return await http
        .get(Uri.parse(
            Constants.baseUrl + 'offers/sub_catogery/$_subCategoryID'))
        // .get(Uri.parse(Constants.baseUrl + 'offers/sub_catogery/3'))
        // Constants.baseUrl + 'offers/sub_catogery/$_subCategoryID'))
        .then((res) {
      //

      MyCustomEasyLoading.dismiss();
      //
      if (!mounted) {
        return;
      }
      //
      if (res.statusCode == 200) {
        // _ads.length = 0;
        final offersAuctionsModel = offersAuctionsModelFromJson(res.body).data;
        //
        // print('length ads = ${offersAuctionsModel.length}');
        for (OffersAuctionsClass item in offersAuctionsModel) {
          _ads.add(item);
        }
        _isServerError = false;
        setState(() {});
      }
      if (res.statusCode == 500) {
        _isServerError = true;
        setState(() {});
        return;
      }
    }).catchError((err) {
      print('_fetchOffersBySubCatID onError $err');
      if (!mounted) {
        return;
      }
      if (err is SocketException) {
        MyCustomEasyLoading.showError(isInternetError: true);
      }
      _isInternetError = true;
      setState(() {});
    });
  }

  //
  @override
  void initState() {
    super.initState();
    _mainThread();
    //
  }

  Future<void> _mainThread() async {
    if (widget.selectCategoryID == null) {
      _fetchCategories();
    } else {
      _fetchSubCategoriesByCatID();
    }
  }

  /// show all sub cats
  Widget _dropDwonSubCategory() {
    //
    if (_isLoadingSubCategories) {
      return CustomLoading();
    }
    if (_isInternetError) {
      return Center(child: Text('check internet connection'));
    }
    return Container(
      padding: const EdgeInsets.all(14.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<SubCategory>(
        underline: Container(),
        icon: Icon(Icons.keyboard_arrow_down),
        isExpanded: true,
        isDense: true,
        // style: Style.medium(),
        onChanged: (SubCategory? v) {
          _ads.length = 0;
          _subCatValue = '$v';
          _subCategoryID = v!.id!;
          _subCatValue = v.name!;
          _fetchOffersBySubCatID();
          setState(() {});
        },
        hint: Text(_subCatValue),
        items: _subCategories.map((SubCategory category) {
          //
          return DropdownMenuItem<SubCategory>(
            value: category,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Txt(
                typesTxt: TypesTxt.medium,
                data: category.name,
              ),
            ),
          );
        }).toList(),
      ),
    );
  } //

  /// get all categories
  Future<void> _fetchCategories() async {
    //
    return await API.fetchCategories().then((res) {
      print('res = $res ====================');
      if (!mounted) {
        return;
      }
      if (res == 500) {
        _isLoadingMainCategories = false;
        _isServerError = true;
        setState(() {});
        return;
      }
      if (res != null) {
        for (var item in res) {
          _mainCategories.add(item);
        }
        _isLoadingMainCategories = false;
        setState(() {});
      }
    }).catchError((error) {
      if (!mounted) {
        return;
      }
      if (error is SocketException) {
        _isLoadingMainCategories = false;
        _isInternetError = true;
        setState(() {});
      }
    });
  }

  //
  Widget _listViewMainCategories() {
    //
    if (_isLoadingMainCategories) {
      return ShimmerCategory();
    }
    //
    if (_isInternetError) {
      return Container(child: InternetErrorWidget());
    } //
    if (_isServerError) {
      return ServerError();
    }
    //
    if (_mainCategories.isEmpty) {
      return Center(child: Text('no categoties'));
    }
    //
    return Container(
      height: 120.0,
      child: ListViewCategory(
        categories: _mainCategories,
      ),
    );
  }

  //
  Widget _gridViewAds() {
    //
    // if (_isLoadingAds) {
    //   return CustomLoading();
    // }
    if (_isInternetError) {
      return InternetErrorWidget();
    }
    if (_ads.isEmpty) {
      return Center(child: Text('لاتوجد اعلانات او عروض'));
    }
    return GridViewAds(ads: _ads);
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    if (widget.isShowScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Txt(
            typesTxt: TypesTxt.medium,
            data: '${widget.selectCategoryName}',
          ),
        ),
        bottomNavigationBar: InfoSelectCategory(
          length: _ads.length,
          subCategoryName: _subCatValue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _dropDwonSubCategory(),
              Expanded(child: _gridViewAds()),
            ],
          ),
        ),
      );
    }
    //
    return _listViewMainCategories();
  }
}
