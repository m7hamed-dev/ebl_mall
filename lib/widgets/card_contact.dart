import 'dart:io';
import 'package:ebll_mall/style/style.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'my_elevated_btn.dart';

class CardContact extends StatelessWidget {
  // constructor
  const CardContact({Key? key, required this.animal}) : super(key: key);
  //
  final  animal;
  // method whatsapp and send sms
  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  // build method
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // whatssapp
              Expanded(
                flex: 2,
                child: MyElevatedBtn(
                  color: Colors.white,
                  elevation: 20.0,
                  onPressed: () {
                    String content = '';
                    if (Platform.isAndroid) {
                      var whatsappUrl ="whatsapp://send?phone=${animal.phone}";
                      // add the [https]
                      content =
                          "https://wa.me/${animal.phone}/?text=${Uri.parse('message')}";
                      print('content $content');
                      _launchURL(whatsappUrl);
                    } else {
                      // add the [https]
                      content =
                          "https://api.whatsapp.com/send?phone=$animal.phone=${Uri.parse('message')}";
                      print('content $content');
                      _launchURL(content);
                    }
                  },
                  child: Icon(Icons.call, color: Colors.green),
                ),
              ),
              SizedBox(width: 5.0),
              // send sms
              Expanded(
                flex: 2,
                child: MyElevatedBtn(
                  color: Style.scafoldBackground,
                  elevation: 20.0,
                  onPressed: () => _launchURL('sms:${animal.phone}'),
                  child: Icon(Icons.sms,
                      color: Colors.black.withOpacity(.7)),
                ),
              ),
              SizedBox(width: 5.0),
              // tel or call
              Expanded(
                flex: 6,
                child: MyElevatedIconBtn(
                  onPressed: () => _launchURL('tel:${animal.phone}'),
                  icon: Icon(Icons.call),
                  label: Text('???????? ????????',
                      style: Style.medium(color: Colors.white)),
                ),
              ),
            ],
        ),
      ),
    );
  }
}
