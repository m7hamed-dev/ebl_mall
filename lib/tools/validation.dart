class ValidationsClass {
  //
  static String? phoneValidate(String? value) {
    if (value!.length < 9) {
      return 'please check';
    }
    return null;
  } //

  static String? emptyField(String? value) {
    if (value!.length < 3) {
      return ' يجب ان يحتوي علي قيمه ';
    }
    return null;
  }

  //
  static String? passwordValidate(String? value) {
    if (value!.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    return null;
  }

  static String? isEmail(String? value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(value!)) {
      return null;
    }
    return 'من فضلك ادخل ايميلك بطريقة صحيحه';
  }
}
