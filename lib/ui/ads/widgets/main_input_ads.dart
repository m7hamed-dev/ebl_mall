import 'package:ebll_mall/tools/validation.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class MainInputAds extends StatefulWidget {
  const MainInputAds({Key? key}) : super(key: key);

  @override
  State<MainInputAds> createState() => _MainInputAdsState();
}

class _MainInputAdsState extends State<MainInputAds> {
  //
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Column(
      children: [
        InputWidget(
          hint: 'عنوان الاعلان',
          textInputType: TextInputType.text,
          controller: _name,
          validator: ValidationsClass.emptyField,
        ),
        InputWidget(
          hint: 'الهاتف',
          textInputType: TextInputType.phone,
          controller: _phone,
          validator: ValidationsClass.emptyField,
        ),
        InputWidget(
          hint: 'التفاصيل',
          textInputType: TextInputType.text,
          controller: _name,
          validator: ValidationsClass.emptyField,
        ),
        InputWidget(
          hint: 'التفاصيل',
          textInputType: TextInputType.text,
          controller: _name,
          validator: ValidationsClass.emptyField,
        ),
      ].map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: e,
        );
      }).toList(),
    );
  }
}
