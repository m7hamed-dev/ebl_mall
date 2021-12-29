import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class InputsAds extends StatefulWidget {
  final String categoryName;
  const InputsAds({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<InputsAds> createState() => _InputsAdsState();
}

class _InputsAdsState extends State<InputsAds> {
  // define all controllers
//   عنوان الاعلان/
//  تاريخ اقامة المزاد/
// نوع السلعه/
// الموقع/
// الوكيشن/
//   المنظم/
//  الهاتف/
// الون/
// العدد/
// التفاصيل/
//   الصور/
// الفديو/
  final TextEditingController _address = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _price = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Column(children: _body());
  }

  @override
  void dispose() {
    super.dispose();
    // dispose all controllers
    _name.dispose();
    _price.dispose();
  }

  List<Widget> _body() {
    List<Widget> _inputs = <Widget>[];
    //
    switch (widget.categoryName) {
      //
      case '1':
        _inputs = [
          InputWidget(
            hint: '1',
          ),
          InputWidget(
            hint: '1',
          ),
          InputWidget(
            hint: '1',
          ),
        ];
        return _inputs;
      //
      case '2':
        _inputs = [
          InputWidget(
            hint: '2',
          ),
          InputWidget(
            hint: '2',
          ),
          InputWidget(
            hint: '2',
          ),
        ];
        //
        return _inputs;
    }
    return [Container(child: Text('0000'))];
  }
}
