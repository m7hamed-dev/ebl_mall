import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/tools/validation.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/account/widgets/or.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _confirPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.orange,
                    ),
                  ),
                  const Text(
                    'هنا يمكنك ادخال بيانات الحساب الخاصه بك',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  InputWidget(
                    hint: 'ادخل الاسم',
                    textInputType: TextInputType.text,
                    controller: _nameController,
                    validator: ValidationsClass.emptyField,
                  ),

                  InputWidget(
                    hint: 'إدخل رقم الهاتف',
                    textInputType: TextInputType.number,
                    controller: _phoneController,
                    validator: ValidationsClass.emptyField,
                  ),

                  InputWidget(
                    hint: 'إدخل البريد الالكتروني',
                    controller: _emailController,
                    validator: ValidationsClass.emptyField,
                  ),

                  InputWidget(
                    hint: 'إدخل كلمة المرور',
                    // textInputType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    obscureText: true,
                    validator: ValidationsClass.passwordValidate,
                  ),

                  InputWidget(
                    hint: 'ادخل العنوان',
                    controller: _addressController,
                    validator: ValidationsClass.emptyField,
                  ),

                  // _hideShowWidget(
                  //   child: InputWidget(
                  //     hint: 'إعد  كلمة ',
                  //     textInputType: TextInputType.visiblePassword,
                  //     controller: _confirPasswordController,
                  //     // validator: (value) =>
                  //     //     Validation.passwordValidate(value),
                  //   ),
                  //   visible: widget.isRegister ? true : false,
                  // ),
                  const SizedBox(height: 10.0),
                  // sign in
                  MyElevatedBtn(
                    color: Style.primaryColor,
                    radius: 5.0,
                    child: Text(
                      'تسجيل',
                      style: Style.bold(color: Colors.white),
                    ),
                    onPressed: _auth,
                  ),
                  const SizedBox(height: 10.0),
                  const OrWidget(isSignInPage: false),
                ]
                    .map((e) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0),
                          child: e,
                        ))
                    .toList(),
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
    // dispose all controllers
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _addressController.dispose();
  }

  Future<void> _auth() async {
    if (_formKey.currentState!.validate()) {
      final UserModel _userModel = UserModel(
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        phone: _phoneController.text.trim(),
      );
      //
      await API.signUP(context: context, userModel: _userModel);
    } else {
      MyCustomEasyLoading.showError(status: Constants.allInputsIsEmpty);
      return;
    }
  }
}
