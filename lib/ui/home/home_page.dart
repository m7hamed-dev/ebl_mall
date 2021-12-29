import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/ui/home/widgets/widgets_home_page.dart';
import 'package:ebll_mall/widgets/my_drawer.dart';
import 'package:ebll_mall/widgets/shimmer_app_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHomePage extends StatefulWidget {
  //
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //
  UserModel _userModel = UserModel(
    accessToken: '',
    tokenType: '',
    expiresIn: 1,
    id: 0,
    name: '',
    phone: '',
    whatsappNumber: '',
    address: '',
    email: '',
    img: '',
    password: '',
  );
  //
  @override
  void initState() {
    super.initState();
    //
    _userModel = LocalStorage.getUserModelFromPrefs();
  }

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: WidgetAppName()),
      drawer: MyDrawer(userModel: _userModel),
      backgroundColor: Style.scafoldBackground,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WidgetsHomePage(),
      ),
    );
  }
}
