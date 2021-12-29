import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:flutter/material.dart';

class TitleAndDesc extends StatelessWidget {
  final String contentName;
  final Widget? page;

  const TitleAndDesc({Key? key, required this.contentName, this.page})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    //
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(contentName,
              style: Style.bold(fontSize: 17.0, color: Colors.orange)),
          Spacer(),
          InkWell(
            onTap: () {
              if (page != null) {
                Push.to(context, page!);
              }
            },
            child: Text(
              'عرض المذيد',
              style: Style.bold(fontSize: 11.0),
            ),
          ),
        ],
      ),
    );
  }
}
