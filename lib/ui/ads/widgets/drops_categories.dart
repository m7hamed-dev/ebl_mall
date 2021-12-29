import 'dart:async';
import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/models/category_model.dart';
import 'package:ebll_mall/models/sub_category_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/custom_box_decoration.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/ui/ads/widgets/main_input_ads.dart';
import 'package:ebll_mall/widgets/catch_error_widget.dart';
import 'package:ebll_mall/widgets/custom_loading.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class DropsCategories extends StatefulWidget {
  //
  const DropsCategories();
  //
  @override
  _DropsCategoriesState createState() => _DropsCategoriesState();
}

class _DropsCategoriesState extends State<DropsCategories> {
  //
  var _error;
  // section category
  List<CategoryModel> _categories = <CategoryModel>[];
  // section sub category
  List<SubCategory> _subCategories = <SubCategory>[];
  int _categoryID = 0;
  bool _isShowSubCategory = false;
  //
  bool _isInternetError = false;
  bool _isLoading = true;
  String initValueCategories = 'اختر قسم';
  String _valuSubCategory = '';
  //
  Future<void> _populateMainCategories() async {
    print('_populateMainCategories');
    //catogries
    await API.fetchMainCategories().then((List<CategoryModel>? value) {
      if (!mounted) {
        return;
      }
      //
      if (value != null) {
        for (var item in value) {
          _categories.add(item);
          print('item ${item.name}');
        }
        //
        _isLoading = false;
        setState(() {});
      }
      //
    }).catchError((err) {
      if (!mounted) {
        return;
      }
      _error = err;
      _isLoading = false;
      _isInternetError = true;
      setState(() {});
    });
  }

  Future<void> _populateSubCategories() async {
    await http
        .get(Uri.parse(
            '${Constants.baseUrl}SubCatogery/catogeries/$_categoryID'))
        .then((res) async {
      print('res = ${res.statusCode}');
      if (!mounted) {
        return;
      }
      _subCategories.length = 0;

      if (res.statusCode == 200) {
        _subCategories = await subCategoryModelFromJson(res.body).data;
        _isShowSubCategory = true;
        print('_subCategories = ${_subCategories.length}');
        // setState(() {});
      }
      if (res.statusCode == 404) {
        _isShowSubCategory = true;
        _subCategories.length = 0;
        // setState(() {});
      }
    }).catchError((err) {
      print('err on get sub cats $err');
    });
  }

  Widget _body() {
    if (_isLoading) {
      return CustomLoading();
    }
    if (_isInternetError) {
      return CatchErrorWidget(erro: _error);
    }
    return Container(
      // height: 250.0,
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(3.0),
      //   border: Border.all(color: Style.customGrey),
      // ),
      child: ListView(
        children: [
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('data'),
            children:
                // Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // children:
                [
              Txt(typesTxt: TypesTxt.medium, data: 'select masin category'),
              const SizedBox(height: 10.0),
              _widgetDropsMainCategories(),
              const SizedBox(height: 20.0),
              Txt(typesTxt: TypesTxt.medium, data: 'select sub category'),
              const SizedBox(height: 10.0),
              _isShowSubCategory == true
                  ? _widgetDropDownSubCategory()
                  : const SizedBox(width: 0.0, height: 0.0),
              const SizedBox(height: 20.0),
            ],
          ),

          // 2.
          Container(
            child: ExpansionTile(
              // initiallyExpanded: true,
              title: Txt(
                typesTxt: TypesTxt.medium,
                data: 'تفاصيل الاعلان',
              ),
              children: [
                Column(
                  children: [
                    _allInputs(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      // ),
    );
  }

  Container _widgetDropsMainCategories() {
    //
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: CustomBoxDecoration.decoration(),
      child: DropdownButton<CategoryModel>(
        underline: Container(),
        icon: Icon(Icons.keyboard_arrow_down),
        // style: TextStyle(),
        isExpanded: true,
        isDense: true,
        style: Style.medium(),
        onChanged: (CategoryModel? category) async {
          initValueCategories = category!.name;
          _categoryID = category.id;
          _valuSubCategory = 'اختر قسم فرعي من  ( ${category.name} )';
          // call method to fill dropdownmenu
          _populateSubCategories();
          // rebuild UI
          setState(() {});
        },
        hint: Text(initValueCategories),
        items: _categories.map((CategoryModel category) {
          return DropdownMenuItem<CategoryModel>(
              value: category,
              child: Txt(
                data: category.name,
                typesTxt: TypesTxt.large,
              ));
        }).toList(),
      ),
    );
  }

  Container _widgetDropDownSubCategory() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: CustomBoxDecoration.decoration(),
      child: DropdownButton<String>(
        underline: Container(),
        icon: Icon(Icons.keyboard_arrow_down),
        // style: TextStyle(),
        isExpanded: true,
        isDense: true,
        style: Style.medium(),
        onChanged: (v) {
          _valuSubCategory = v.toString();
          setState(() {});
        },
        hint: Text(_valuSubCategory),
        // value: initValueCategories,
        items: _subCategories.map((subCategory) {
          return DropdownMenuItem<String>(
            value: subCategory.name,
            child: Txt(
              data: subCategory.name ?? '',
              typesTxt: TypesTxt.large,
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // _populateMainCategories();
  }

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  //
  @override
  Widget build(BuildContext context) {
    // initialUrl: 'https://ebl-mall.com/login',
    return WebView(
      gestureNavigationEnabled: true,
      initialUrl: 'https://ebl-mall.com/offers/create',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        // MyCustomEasyLoading.showSuccess();
        _controller.complete(webViewController);
        MyCustomEasyLoading.dismiss();
      },
      onProgress: (int progress) {
        MyCustomEasyLoading.show();
        print("WebView is loading (progress : $progress%)");
      },
      javascriptChannels: <JavascriptChannel>{},
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        MyCustomEasyLoading.show();
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        // MyCustomEasyLoading.showSuccess();
        MyCustomEasyLoading.dismiss();
        print('Page finished loading: $url');
      },
    );
    return _body();
  }

  //_valuSubCategory
  ListView _allInputs() {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        MainInputAds(),
      ],
    );
  }
}
