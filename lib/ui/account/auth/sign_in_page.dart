import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/custom_flushbar.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/tools/validation.dart';
import 'package:ebll_mall/tools/will_pop_scope.dart';
import 'package:ebll_mall/ui/account/widgets/or.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/skip_btn.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:ebll_mall/widgets/txt.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //
  final TextEditingController _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(leading: const SizedBox()),
      body: WillPopScope(
        onWillPop: (() => builonBackPressed(context).then((value) => value!)),
        child: SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'هنا يمكنك ادخال بيانات الدخول الخاصه بك',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    InputWidget(
                      hint: 'ادخل بريدك الالكتروني',
                      controller: _emailController,
                      validator: (value) {
                        return ValidationsClass.isEmail(value);
                      },
                    ),

                    InputWidget(
                      hint: 'إدخل كلمة المرور',
                      // textInputType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) =>
                          ValidationsClass.passwordValidate(value),
                    ),
                    const SizedBox(height: 10.0),
                    // sign in
                    MyElevatedBtn(
                      color: Style.primaryColor,
                      radius: 5.0,
                      child: Text(
                        'تسجيل دخول',
                        style: Style.bold(color: Colors.white),
                      ),
                      onPressed: _auth,
                    ),
                    const SizedBox(height: 20.0),
                    OrWidget(isSignInPage: true),
                    const SizedBox(height: 20.0),
                    SkipBtn(),
                  ]
                      .map((e) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: e,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  void _auth() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      final UserModel _userModel = UserModel(
        password: _passwordController.text.trim(),
        email: _emailController.text.trim(),
      );
      API.signIN(context: context, userModel: _userModel);
    } else {
      MyCustomEasyLoading.showError(status: Constants.allInputsIsEmpty);
      return;
      return CustomFlushBar.flushbar(
        Constants.allInputsIsEmpty,
        context,
        isError: false,
      );
    }
    //
  }
}
