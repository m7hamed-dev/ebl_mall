import 'dart:io';

import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class CatchErrorWidget extends StatelessWidget {
  final erro;
  const CatchErrorWidget({Key? key, required this.erro}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    switch (erro) {
      //
      case SocketException:
        return Center(
          child: Txt(
            typesTxt: TypesTxt.medium,
            data: Constants.internetError,
          ),
        );
      //
      // case ClientException:
      //   return Center(
      //     child: Txt(
      //       typesTxt: TypesTxt.medium,
      //       data: 'ClientException',
      //     ),
      //   );
    }
    return Center(
      child: Txt(
        typesTxt: TypesTxt.medium,
        data: Constants.internetError,
      ),
    );
  }
}
