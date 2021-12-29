import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/ui/ads/inputs_ads.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsAdsWidget extends StatefulWidget {
  //
  const DetailsAdsWidget({Key? key, required this.categoryName})
      : super(key: key);
  final String categoryName;

  @override
  _DetailsAdsWidgetState createState() => _DetailsAdsWidgetState();
}

class _DetailsAdsWidgetState extends State<DetailsAdsWidget> {
  //
  bool isExpandedMoreDetailsAds = false;
  bool isExpandedDetailsAds = false;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              // color: Style.customGrey,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: HexColor('#c4c4c4'),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          isExpandedDetailsAds = !isExpandedDetailsAds;
                        });
                      },
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 2),
                        child: Icon(
                          isExpandedDetailsAds
                              ? Icons.close
                              : Icons.touch_app_rounded,
                        ),
                      ),
                      //
                    ),
                    Text('تفاصيل اللإعلان'),
                  ],
                ),
                Divider(),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: isExpandedDetailsAds ? 470.0 : 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('إسم الإعلان', style: Style.labelStyle()),
                        // InputWidget(
                        //   hint: 'إسم الإعلان ( مثال : جمل فحل أحمر )',
                        // ),
                        // Text('السعر', style: Style.labelStyle()),
                        // InputWidget(
                        //   textInputType: TextInputType.number,
                        //   hint: 'السعر المطلوب',
                        // ),
                        // Text('تفاصيل الإعلان', style: Style.labelStyle()),
                        // InputWidget(
                        //   hint:
                        //       'وصف الإعلان ( فضلا أضف المذيد من التفاصيل عن منتجك ليتم العثور عليه بسهولة وسرعة )',
                        //   maxLines: 5,
                        // ),
                        InputsAds(categoryName: widget.categoryName),
                      ]
                          .map(
                            (e) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: e),
                          )
                          .toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
