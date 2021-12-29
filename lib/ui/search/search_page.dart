import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/widgets/card_animal.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //
  bool _isBtnOffersSelected = true;
  bool _isBtnAuctionsSelected = true;
  //
  String _url = '';

  Future<void> _search() async {
    if (_url.isEmpty) {
      // _isLoading = false;
      // setState(() {});
      return;
    } else
      EasyLoading.show(status: ' جاري جلب البيانات ');
    //
    await http.get(Uri.parse(_url)).then((respose) async {
      EasyLoading.dismiss();
      if (!mounted) {
        return;
      }
      if (respose == 500) {
        return;
      } else if (respose.statusCode == 200) {
        names = await offersAuctionsModelFromJson(respose.body).data;
        // _isLoading = false;
        setState(() {});
      }
    }).catchError((error) {
      if (error is SocketException) {
        MyCustomEasyLoading.showError(isInternetError: true);
        // _isLoading = false;
        setState(() {});
      }
    });
  }

  List<OffersAuctionsClass> names = <OffersAuctionsClass>[];

  List<OffersAuctionsClass> filtterNames = <OffersAuctionsClass>[];
  //
  Widget _body() {
    //
    // if (_isLoading) {
    //   return Center(child: CircularProgressIndicator());
    // }
    // if (isInternetError) {
    //   return Center(child: Text('internet error !!'));
    // }
    // if (_url.isEmpty) {
    //   return Center(child: Text('internet error !!'));
    // }
    //
    filtterNames = searchController.text.isEmpty
        ? names
        : filtterNames.where((e) {
            if (e.name!.contains(searchController.text.trim()) ||
                e.price.toString().contains(searchController.text.trim())) {
              return true;
            }
            return false;
          }).toList();
    //
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: filtterNames.length,
      itemBuilder: (BuildContext context, int index) {
        return CardAnimal(adsModel: filtterNames[index]);
      },
    );
  }

  TextEditingController searchController = TextEditingController();
  //
  int get countOfResult => names.length > 0 ? names.length : 0;
  //
  @override
  void initState() {
    super.initState();
    _search();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _btnsSelection(),
            const SizedBox(height: 10.0),
            Expanded(
              child: InputWidget(
                controller: searchController,
                onChange: (v) => setState(() {}),
                prefixIcon: InkWell(
                  onTap: () {
                    if (searchController.text.isNotEmpty) {
                      searchController.clear();
                      setState(() {});
                    }
                  },
                  child: Icon(searchController.text.isEmpty
                      ? Icons.search
                      : Icons.close),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: _body(),
            ),
          ],
        ),
      ),
    );
  }

// searchController.text.isNotEmpty
// ? Expanded(child: Text('$countOfResult'))
// : const SizedBox(width: 0.0, height: 0.0),

  Row _btnsSelection() {
    return Row(
      children: [
        Expanded(
          child: MyElevatedBtn(
            color:
                _isBtnOffersSelected ? Colors.orange : Colors.orange.shade100,
            onPressed: () {
              _url = '${Constants.baseUrl}offers/offers'; //auctions
              _isBtnOffersSelected = true;
              _isBtnAuctionsSelected = false;
              setState(() {});
              _search();
            },
            child: Txt(typesTxt: TypesTxt.medium, data: 'الاعلانات'),
          ),
        ),
        const SizedBox(width: 5.0),
        Expanded(
          child: MyElevatedBtn(
            color:
                _isBtnAuctionsSelected ? Colors.orange : Colors.orange.shade100,
            onPressed: () {
              _url = '${Constants.baseUrl}offers/auctions';
              _isBtnOffersSelected = false;
              _isBtnAuctionsSelected = true;
              setState(() {});
              _search();
            },
            child: Txt(typesTxt: TypesTxt.medium, data: 'الحراجات'),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
