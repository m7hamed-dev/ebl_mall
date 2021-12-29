import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/ui/account/details_woner.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';
import 'custom_chip.dart';
import 'hero_header_imgs.dart';

class AnimalProperty extends StatelessWidget {
  const AnimalProperty({Key? key, required this.animal}) : super(key: key);
  //
  final OffersAuctionsClass animal;
  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            // header -> images
            HeroHeaderImages(animal: animal),
            // name
            ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Txt(typesTxt: TypesTxt.medium, data: animal.name),
              subtitle: Txt(typesTxt: TypesTxt.medium, data: animal.price),
              trailing: Txt(typesTxt: TypesTxt.medium, data: animal.age),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomChip(
                  label: Text(
                    'details',
                    style: Style.bold(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            // animal properties
            _column(title: 'السن', subtitle: animal.age),
            _column(title: 'category', subtitle: animal.category),
            _column(title: 'auctionDate', subtitle: animal.family),
            _column(title: 'auctionDate', subtitle: animal.stutes),
            _column(title: 'الاب', subtitle: animal.age),
            _column(title: 'تاريخ الحراج', subtitle: animal.auctionDate),
            _column(title: 'originDate', subtitle: animal.originDate),
            _column(title: 'day', subtitle: animal.day),
            _column(title: 'conditions', subtitle: animal.conditions),
            _column(title: 'conditions', subtitle: animal.conditions),
            _column(title: 'conditions', subtitle: animal.conditions),
            // woner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomChip(
                  label: Text(
                    'تفاصيل المعلن',
                    style: Style.bold(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            //
            DetailsWonerWidget(data: animal),
          ],
        ),
      ),
    );
  }

  Column _column({title, subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Txt(
          typesTxt: TypesTxt.medium,
          data: title,
        ),
        // sub title
        Txt(
          data: subtitle,
          typesTxt: TypesTxt.medium,
          color: Colors.grey,
          // color: Style.primaryColor,
        ),
        _div(),
      ].map((StatelessWidget e) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: e is Container ? 0.0 : 6.0,
            horizontal: e is Container ? 0.0 : 12.0,
          ),
          child: e,
        );
      }).toList(),
    );
  }

  Container _div() {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      color: Colors.grey.shade100,
      height: 8.0,
    );
  }
}
