import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/ads_model.dart';
import 'package:ebll_mall/models/auctions_model.dart';
import 'package:ebll_mall/models/category_model.dart';
import 'package:ebll_mall/models/my_offers_model.dart';
import 'package:ebll_mall/models/offers_auctions_model.dart';
import 'package:ebll_mall/models/sub_category_model.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/tools/custom_flushbar.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/tools/push.dart';
import 'package:ebll_mall/ui/account/auth/sign_in_page.dart';
import 'package:ebll_mall/ui/banner/banner_model.dart';
import 'package:ebll_mall/ui/home/home_page.dart';
import 'package:ebll_mall/widgets/custom_loading.dart';
import 'package:ebll_mall/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

//
class API {
  // sign-up
  static Future<void> signUP({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      final _url = Constants.baseUrl +
          'auth/register?name=${userModel.name}&password=${userModel.password}&address=${userModel.address}&email=${userModel.email}&phone=${userModel.phone}';
      // define response from http package
      final response = await http.post(
        Uri.parse(_url),
        // body: json.encode(userModel),
      );
      // print(
      //     'response.body from signup = ${response.body} \n ----------- \ code = ${response.statusCode}');
      print('response.body from signup  code = ${response.statusCode}');
      // show dialog
      Mdialog.showLoading(context);
      //
      if (response.statusCode > 100) {
        // close dialog
        Navigator.pop(context);
        //
        switch (response.statusCode) {
          //
          case 200:
            CustomFlushBar.flushbar(Constants.successMSG, context,
                isError: false);
            //
            Future.delayed(Duration(seconds: 4), () {
              Push.to(context, SignInPage());
            });
            break;
          //
          case 500:
            return CustomFlushBar.flushbar(Constants.serverError, context,
                isError: true);
          //
          case 404:
            return CustomFlushBar.flushbar(Constants.loginErrorMsg, context,
                isError: true);
          //
          case 401:
            return CustomFlushBar.flushbar(Constants.loginErrorMsg, context,
                isError: true);
          //
          case 422:
            return CustomFlushBar.flushbar(
                Constants.emailOrPasswordTaken, context,
                isError: true);
          //
        }
      }
    } catch (e) {
      // close dialog
      Navigator.pop(context);
      //
      if (e is SocketException) {
        return CustomFlushBar.flushbar(Constants.internetError, context,
            isError: true);
      }
      return Future.error(e);
    }
  }

  // sign-in
  static Future signIN({
    required UserModel userModel,
    required BuildContext context,
  }) async {
    try {
      final String _url = Constants.baseUrl +
          'auth/login?email=${userModel.email}&password=${userModel.password}';
      //
      EasyLoading.show(status: 'loading...');
      //
      await http.post(Uri.parse(_url)).then((response) async {
        //
        EasyLoading.dismiss();
        //
        if (response.statusCode == 200) {
          //
          final UserModel _userModel = userModelFromJson(response.body);
          //
          print('_userModel password url ${_userModel.password}');
          // save password
          await LocalStorage.setValPrefs(
              key: LocalStorage.passwordKey, value: userModel.password ?? '');
          //
          await LocalStorage.seveUserModelInPrefs(userModel: _userModel);
          await LocalStorage.setLogin(true);
          //
          // CustomFlushBar.flushbar(Constants.successMSG, context,
          //     isError: false);
          EasyLoading.showSuccess(Constants.successMSG);
          //
          Future.delayed(Duration(seconds: 2), () {
            //
            Push.to(
              context,
              Directionality(
                textDirection: TextDirection.rtl,
                child: MyHomePage(),
              ),
            );
          });
          //
        } else if (response.statusCode == 500) {
          return CustomFlushBar.flushbar(Constants.serverError, context,
              isError: true);
        } else {
          return CustomFlushBar.flushbar(Constants.loginErrorMsg, context,
              isError: true);
        }
      });
    } catch (e) {
      //
      if (e is SocketException) {
        return CustomFlushBar.flushbar(Constants.internetError, context,
            isError: true);
      }
      return Future.error(e);
    }
  }

// sign-in
  static Future changeUserPassword({
    required String currentPassword,
    required String newPassword,
    required String token,
    required BuildContext context,
  }) async {
    try {
      //
      final String _url = Constants.baseUrl +
          'profile/UpdatePassword?current=$currentPassword&password=$newPassword';
      //
      Map<String, String> _headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      //
      final response = await http.post(
        Uri.parse(_url),
        headers: _headers,
      );
      CustomLoading();
      //
      print(response.body);
      print(response.statusCode);

      if (response.statusCode > 199) {
        Navigator.pop(context);
        switch (response.statusCode) {
          //
          case 200:
            CustomFlushBar.flushbar(Constants.successMSG, context,
                isError: false);
            //
            Future.delayed(Duration(seconds: 4), () {
              Push.to(context, SignInPage());
            });
            break;
          //
          case 500:
            return CustomFlushBar.flushbar(Constants.serverError, context,
                isError: true);
          //
          case 404:
            return CustomFlushBar.flushbar(Constants.loginErrorMsg, context,
                isError: true);
          //
          case 401:
            return CustomFlushBar.flushbar(Constants.loginErrorMsg, context,
                isError: true);
          //
        }
      }
    } catch (e) {
      if (e is SocketException) {
        return CustomFlushBar.flushbar(Constants.internetError, context,
            isError: true);
      }
      return Future.error(e);
    }
  }

  static Future<void> updateProfileUser(
    String token,
    UserModel userModel,
    BuildContext context,
    File? fileImage,
  ) async {
    //
    final _url = Constants.baseUrl +
        'profile/update?name=${userModel.name}&email=${userModel.email}&address=${userModel.address}&phone=${userModel.phone}&img=&current=${userModel.password}&password=${userModel.password}';

    try {
      // Send authorization headers to the backend.
      Map<String, String> _headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      // print('fileImage ${fileImage.path ?? ''}');
      //
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(_url))
            ..headers.addAll(_headers);
      //
      if (fileImage != null) {
        request.files
            .add(await http.MultipartFile.fromPath('img', fileImage.path));
      }
      //
      http.StreamedResponse _request = await request.send();
      //
      print('userModel password = ${userModel.password}');
      await http.Response.fromStream(_request).then((_response) {
        //
        print('_response from update ${_response.statusCode}');
        //
        if (_response.statusCode == 200) {
          //
          CustomFlushBar.flushbar(Constants.successMSG, context,
              isError: false);
          //
          Future.delayed(Duration(seconds: 2), () {
            Push.to(context, SignInPage());
          });
        }
        if (_response.statusCode == 500) {
          return CustomFlushBar.flushbar(Constants.serverError, context,
              isError: true);
        }
        return null;
      });
    } catch (e) {
      if (e is SocketException) {
        return CustomFlushBar.flushbar(Constants.internetError, context,
            isError: true);
      }
      return Future.error(e);
    }
  }

  // section categories
  static Future<List<CategoryModel>?> fetchMainCategories() async {
    print('fetchMainCategories');
    final _url = Constants.baseUrl + 'catogries';
    try {
      // define response from http package
      final _response = await http.get(Uri.parse(_url));
      print('_response ${_response.body}');
      print('res ${_response.body}');
      if (_response.statusCode == 200) {
        return categoriesModelFromJson(_response.body).data;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future fetchCategories() async {
    try {
      // define response from http package
      final _url = '${Constants.baseUrl}catogries';
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return categoriesModelFromJson(response.body).data;
      }
      if (response.statusCode == 500) {
        return 500;
      } else {
        return null;
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  // sub categories
  static Future<List<SubCategory>?> fetchSubCategories(int categoryID) async {
    try {
      // define response from http package
      final _url = Constants.baseUrl + 'SubCatogery/index/$categoryID';
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return subCategoryModelFromJson(response.body).data;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  // section banners
  static Future fetchBanners() async {
    try {
      // define response from http package
      final response =
          await http.get(Uri.parse(Constants.baseUrl + 'slite/index'));
      if (response.statusCode == 200) {
        return bannerModelFromJson(response.body).data;
      }
      if (response.statusCode == 500) {
        return 500;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  // section adds = offers
  static Future fetchAds() async {
    try {
      // define response from http package
      final _response =
          await http.get(Uri.parse(Constants.baseUrl + 'offers/offers'));
      if (_response.statusCode == 200) {
        return offersAuctionsModelFromJson(_response.body).data;
      }
      //
      if (_response.statusCode == 500) {
        return 500;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  static Future fetchAdsByMainCategoryOrSubCategoryID({
    int? subCategoryID,
    int? mainCategoryID,
    required bool isSubCategory,
  }) async {
    try {
      final _url = isSubCategory
          // is sub category
          ? Constants.baseUrl + 'offers/sub_catogery/$subCategoryID'
          // is main category
          : Constants.baseUrl + 'offers/$mainCategoryID';
      //
      final _response = await http.get(Uri.parse(_url));
      // check reponse if equals 200 it mean success
      if (_response.statusCode == 200) {
        return adsModelFromJson(_response.body).data;
      }
      //
      if (_response.statusCode == 500) {
        return 500;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }

  // section banners
  // section auctions

  static Future fetchAuctions() async {
    try {
      final _url = Constants.baseUrl + 'offers/auctions';
      final _response = await http.get(Uri.parse(_url));
      print('fetchAuctions $_response.body}');
      if (_response.statusCode == 200) {
        return offersAuctionsModelFromJson(_response.body).data;
      }
      return null;
    } catch (e) {
      print('Exception on Func fetchAuctions() ${e.toString()}');
      return Future.error(e);
    }
  }

  static Future addValueAuction({
    required String token,
    required int userID,
    required int productID,
    required double auction_price,
    required BuildContext context,
  }) async {
    //
    final _url = Constants.baseUrl +
        'offers/auction/117?product_id=$productID&user_id=$userID&auction_price=$auction_price';
    //
    final _response = await http.post(
      Uri.parse(_url),
      // Send authorization headers to the backend.
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('_response from add auction operation = ${_response.statusCode}');
    //
    try {
      if (_response.statusCode == 200) {
        return CustomFlushBar.flushbar(
          Constants.youAreNotLogin,
          context,
          isError: false,
        );
      } else {
        return CustomFlushBar.flushbar(
          Constants.errorHappend,
          context,
          isError: false,
        );
      }
    } catch (e) {
      return Future.error(e);
    }
  } // end section auctions

  static Future addAuction(
    BuildContext context, {
    File? img1,
    File? img2,
    File? img3,
    required String token,
    required AcutionModel auctionModel,
  }) async {
    //
    final _url = Constants.baseUrl +
        'offers/storeauction?name=${auctionModel.name}&details=${auctionModel.details},&type_name=${auctionModel.typeName},&owner_name=${auctionModel.ownerName},&location=${auctionModel.location},&price=${auctionModel.price},&savety=${auctionModel.savety},&savety=${auctionModel.savety}';
    //
    try {
      // Send authorization headers to the backend.
      Map<String, String> _headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      // print('fileImage ${img1!.path}');
      //
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(_url))
            ..headers.addAll(_headers);
      //
      if (img1 != null) {
        request.files.add(await http.MultipartFile.fromPath('img1', img1.path));
      }
      //
      if (img2 != null) {
        request.files.add(await http.MultipartFile.fromPath('img2', img2.path));
      }
      //
      if (img3 != null) {
        request.files.add(await http.MultipartFile.fromPath('img3', img3.path));
      }
      //
      http.StreamedResponse _request = await request.send();
      //
      MyCustomEasyLoading.show(status: Constants.loadingMSG);
      //
      await http.Response.fromStream(_request).then((_response) {
        //
        // print('_response from add auction ${_response.body}');
        //
        if (_response.statusCode == 200) {
          MyCustomEasyLoading.showSuccess();
          //
        } else
          MyCustomEasyLoading.showError(
              status: _response.statusCode.toString());
        // return CustomFlushBar.flushbar(
        //   Constants.errorHappend,
        //   context,
        //   isError: true,
        // );
        return null;
      });
    } catch (e) {
      return Future.error(e);
    }
  } // end section auctions

  static Future addOffers({
    required String token,
    required String name,
    required String details,
    required String location,
    required int categoryID,
    required int subCatogeryID,
  }) async {
    //
    final _url = Constants.baseUrl +
        'https://ebl-mall.com/api/offers/store?name=$name&details=$details&category_id=$categoryID&sub_catogery_id=$subCatogeryID&location=$location';
    //
    final _response = await http.post(
      Uri.parse(_url),
      // Send authorization headers to the backend.
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json',
      //   'Authorization': 'Bearer $token',
      // },
    );

    try {
      if (_response.statusCode == 200) {
        print(_response.statusCode);
        print(_response.body);
      }
      print(_response.body);
      print(_response.statusCode);
      return null;
    } catch (e) {
      print('error on addOffers() ;; $e');
      return Future.error(e);
    }
  } // end section auctions

  static Future fetchMyOffers(String token) async {
    //
    final _url = Constants.baseUrl + 'profile/myoffers';
    try {
      //
      final _response = await http.get(
        Uri.parse(_url),
        // Send authorization headers to the backend.
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print('res from profile myoffers ${_response.statusCode}');
      if (_response.statusCode == 200) {
        return myOffersModelFromJson(_response.body).data;
      }
      if (_response.statusCode == 500) {
        return 500;
      }
      return null;
    } catch (e) {
      return Future.error(e);
    }
  }
}
