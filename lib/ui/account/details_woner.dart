import 'dart:io';

import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/tools/custom_box_decoration.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsWonerWidget extends StatelessWidget {
  //
  const DetailsWonerWidget({Key? key, required this.data}) : super(key: key);
  //
  final OffersAuctionsClass data;
  //
  @override
  Widget build(BuildContext context) {
    //
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: CustomBoxDecoration.decoration(
        color: Colors.grey.shade100,
      ),
      child: Row(
        children: [
          CustomCachedNetworkImage(
            urlIsProfile: true,
            imageUrl: data.userImage!,
            width: 70.0,
            height: 70.0,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Txt(
                typesTxt: TypesTxt.medium,
                data: data.userName,
                color: Colors.orange,
              ),
              Txt(
                typesTxt: TypesTxt.small,
                data: data.userEmail,
                color: Colors.grey,
              ),
              Txt(
                typesTxt: TypesTxt.medium,
                data: data.userPhone,
                color: Colors.grey,
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // call
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  focusColor: Colors.orange,
                  onTap: () => _makePhoneCall(data.userPhone ?? ''),
                  child: Icon(Icons.call),
                ),
              ),
              // whatssap
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () =>
                      _openWhatssApp(data.userWhatsappNumber ?? '', 'msg'),
                  child: Icon(Icons.whatshot_sharp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _openWhatssApp(String phone, String msg) {
    if (Platform.isAndroid) {
      // add the [https]
      return "https://wa.me/$phone/?text=${Uri.parse(msg)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(msg)}"; // new line
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
