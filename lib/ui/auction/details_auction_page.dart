import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/custom_flushbar.dart';
import 'package:ebll_mall/widgets/animal_properties_widget.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class DetailsauctionPage extends StatefulWidget {
  //
  final OffersAuctionsClass auctionModel;
  //
  const DetailsauctionPage({Key? key, required this.auctionModel})
      : super(key: key);

  @override
  _DetailsauctionPageState createState() => _DetailsauctionPageState();
}

class _DetailsauctionPageState extends State<DetailsauctionPage> {
  //
  bool isShowAuction = false;
  //
  String _token = '';

  @override
  void initState() {
    super.initState();
    _token = LocalStorage.getToekn;
  }

  TextEditingController _auctionPrecieController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: AnimalProperty(animal: widget.auctionModel),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
        title: Row(
      children: [
        Icon(
          Icons.notifications_on,
          color: Colors.white,
        ),
        const SizedBox(width: 10.0),
        Txt(
          data: widget.auctionModel.name,
          typesTxt: TypesTxt.medium,
          // style: Style.medium(color: Colors.white),
        ),
      ],
    ));
  }

  Container _bottomNavigationBar() {
    return Container(
      height: 100.0,
      padding: const EdgeInsets.all(8.0),
      color: Style.heighOrang,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Txt(
              data: ' السعر الحالي للمذاد ${widget.auctionModel.price}',
              typesTxt: TypesTxt.medium,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 2,
            child: MyElevatedBtn(
              height: 50.0,
              color: Colors.white,
              elevation: 10.0,
              onPressed: () async {
                await _dialogShowAuction();
              },
              child: Text(
                isShowAuction ? ' مذايدة الأن' : ' دخول إلي المذاد',
                style: Style.bold(color: Style.heighOrang),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogShowAuction() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: null,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InputWidget(
                  controller: _auctionPrecieController,
                  hint: ' قم بإدخل المبلغ المراد المذيدة به ',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 10.0),
                MyElevatedBtn(
                  child: Txt(
                    typesTxt: TypesTxt.medium,
                    data: 'اضافة',
                  ),
                  onPressed: () async {
                    if (_token.isEmpty) {
                      return CustomFlushBar.flushbar(
                          Constants.serverError, context,
                          isError: true);
                    } else
                      await API.addValueAuction(
                        context: context,
                        token: _token,
                        userID: widget.auctionModel.userId!,
                        productID: widget.auctionModel.id!,
                        auction_price:
                            double.parse(_auctionPrecieController.text.trim()),
                      );
                  },
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: MyElevatedBtn(
                  elevation: 1.0,
                  color: Colors.white,
                  child: Txt(
                    typesTxt: TypesTxt.medium,
                    data: 'خروج',
                    color: Style.heighOrang,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          );
        });
  }
}
