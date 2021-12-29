import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    //
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Txt(
            typesTxt: TypesTxt.large,
            data: 'جاري جلب البيانات',
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),
          CircularProgressIndicator(
            strokeWidth: 7.0,
            color: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
