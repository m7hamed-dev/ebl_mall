import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class BoxDropDown extends StatelessWidget {
  final content, title;

  const BoxDropDown({Key? key, this.content, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Txt(typesTxt: TypesTxt.small, data: title),
          content,
        ],
      ),
    );
  }
}
