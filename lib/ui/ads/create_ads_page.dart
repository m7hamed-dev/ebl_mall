import 'package:ebll_mall/ui/ads/widgets/drops_categories.dart';
import 'package:flutter/material.dart';
import 'widgets/details_ads_widget.dart';

class CreateAdsPage extends StatefulWidget {
  //
  const CreateAdsPage({Key? key}) : super(key: key);
  //
  @override
  _CreateAdsPageState createState() => _CreateAdsPageState();
}

class _CreateAdsPageState extends State<CreateAdsPage> {
  //
  String _stringBtn = 'next';
  int _selectedIndex = 0;
  //
  static final List<Widget> _pages = <Widget>[
    //
    const DropsCategories(),
    //
    const DetailsAdsWidget(categoryName: '1'),
    //
    // SelectImgsToAdsWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2.0, title: const Text('اضافة اعلان جديد')),
      body: DropsCategories(),
      // body: PageView(children: _pages),
      // floatingActionButton: _floatingActionButton(),
    );
  }

  // FloatingActionButton _floatingActionButton() {
  //   return FloatingActionButton.extended(
  //     onPressed: () {
  //       switch (_selectedIndex) {
  //         case 0:
  //           _selectedIndex = 1;
  //           break;
  //         case 1:
  //           _selectedIndex = 2;
  //           _stringBtn = 'back';
  //           break;
  //         default:
  //           _selectedIndex = 2;
  //       }
  //       if (_stringBtn == 'back') {
  //         _selectedIndex = 0;
  //       }
  //       //
  //       setState(() {});
  //     },
  //     label: Text(_stringBtn),
  //   );
  // }

}
