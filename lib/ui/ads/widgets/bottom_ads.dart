import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

import '../create_ads_page.dart';

class BottomAds extends StatelessWidget {
  const BottomAds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      margin: const EdgeInsets.all(10.0),
      child: IconButton(
        onPressed: () => Push.to(context, CreateAdsPage()),
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 35.0),
            const SizedBox(width: 10.0),
            Txt(typesTxt: TypesTxt.medium, data: 'اضافة اعلان جديد'),
          ],
        ),
      ),
    );
  }
}
