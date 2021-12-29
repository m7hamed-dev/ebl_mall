import 'package:ebll_mall/data/constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class MyCustomEasyLoading {
  //
  static void show({String? status}) {
    EasyLoading.show(status: status ?? 'جاري جلب البيانات');
  }

  static void showProgress({String? status}) {
    EasyLoading.showProgress(0.3, status: status ?? 'جاري جلب البيانات');
  }

  static void showSuccess() {
    EasyLoading.showSuccess(Constants.successMSG);
  }

  static void showError({bool? isInternetError, String? status}) {
    // if error is internet then show msg internet erro
    if (isInternetError == true) {
      EasyLoading.showError(status ?? Constants.internetError);
    }
    // owtherwise show message
    EasyLoading.showError(status ?? Constants.errorHappend);
    //
    if (isInternetError == true) {
      Future.delayed(Duration(seconds: 23));
      dismiss();
    }
  }

  static void showInfo() {
    EasyLoading.showInfo('Useful Information.');
  }

  static void showToast() {
    EasyLoading.showToast('Toast');
  }

  static void dismiss() {
    EasyLoading.dismiss();
  }
}
