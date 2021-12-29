import 'package:ebll_mall/tools/custom_box_decoration.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class InfoSelectCategory extends StatelessWidget {
  const InfoSelectCategory({Key? key,required this.length,required this.subCategoryName}) : super(key: key);
  //
  final int length;
  final String subCategoryName;
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      margin: const EdgeInsets.only(
        bottom: 10.0,
        top: 3.0,
        right: 3.0,
        left: 3.0,
      ),
      decoration: CustomBoxDecoration.decoration(
        color: Colors.grey.shade100,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            Txt(
              typesTxt: TypesTxt.medium,
              data: ' الاعلانات الخاصه بالقسم ',
              color: Colors.grey,
            ),
            Spacer(),
            Txt(
              data: '$length : وجد ',
              typesTxt: TypesTxt.small,
              color: Colors.green,
            )
          ],
        ),
        subtitle: Txt(
          typesTxt: TypesTxt.medium,
          data: subCategoryName,
          color: Colors.orange,
        ),
      ),
    );
  }
}
