import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();
  //
  await LocalStorage.initLocalStorage();
  //
  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      title: 'Ebl Mall APP',
      theme: Style.themeData(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  //
  const Home({Key? key}) : super(key: key);
  //
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  bool _isLogin = false;
  //
  @override
  void initState() {
    super.initState();
    _isLogin = LocalStorage.checkLogin();
  }

  Widget check() {
    if (_isLogin) {
      return MyHomePage();
    }
    return SignInPage();
  }

  //
  @override
  Widget build(BuildContext context) => check();
}

extension CustomExtensions on BuildContext {
  //
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}
