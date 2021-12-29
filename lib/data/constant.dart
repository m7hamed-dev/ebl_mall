import 'package:flutter/material.dart';

class Constants {
  static const String appName = 'ابل مول ';
  // for column
  static const CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start;
  static const MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  // server - APIs Congig
  /// BASEURL ---- http://ebl-mall.com/api/
  static const String baseUrl = 'https://ebl-mall.com/api/';
  // error hunlding
  static const String youAreNotLogin =
      'انت غير مسجل معنا يجب عليك تسجيل حسابك ومن ثم الاستمتاع بخدمات التطبيق';
  static const String internetError = 'من فضلك تاكد من اتصالك بالانترنت';
  static const String serverError = 'هنالك خطا في السيرفر جاري حل المشكله';
  static const String errorHappend = 'هنالك خطا ';
  // validations messages
  static const String emailOrPasswordTaken = 'جرب بيانات اخري';
  static const String loginErrorMsg = 'الايميل او الباسوورد خطا';
  static const String successMSG = 'العملية تمت بنجاح';
  static const String allInputsIsEmpty = 'جميع الحقول مطلوبه';
  static const String loadingMSG = 'من فضلك انتظر';
  // all hints
  static const String hintEmail = 'البريد الالكتروني';
  static const String hintPassword = 'كلمه المرور';
  static const String hintPhone = 'رقم الهاتف';
  static const String hintName = 'اسم المستخدم';
}
