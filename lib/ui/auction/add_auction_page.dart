import 'dart:io';
import 'package:dio/dio.dart';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/auctions_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/custom_flushbar.dart';
import 'package:ebll_mall/tools/cutom_eazy_loading.dart';
import 'package:ebll_mall/tools/validation.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart' as dio;

class AddAuctionPage extends StatefulWidget {
  const AddAuctionPage({Key? key}) : super(key: key);
  @override
  _AddAuctionPageState createState() => _AddAuctionPageState();
}

class _AddAuctionPageState extends State<AddAuctionPage> {
  //
  final _nameController = TextEditingController();
  final _dayController = TextEditingController();
  final _phoneController = TextEditingController();
  final _typeController = TextEditingController();
  final _fatherController = TextEditingController();
  final _motherController = TextEditingController();
  final _stutesController = TextEditingController();
  final _ageController = TextEditingController();
  final _ownController = TextEditingController();
  final _numberController = TextEditingController();
  final _priceownController = TextEditingController();
  final _savetyController = TextEditingController();
  final _conditionsController = TextEditingController();
  final _locationController = TextEditingController();
  final _detailsController = TextEditingController();
  //
  String _token = '';
  //
  @override
  void initState() {
    super.initState();
    _token = LocalStorage.getToekn;
  }

  final _formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(title: const Text('شاشة اضافة حراج')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InputWidget(
                    hint: 'للبيع: جمل/حصان/صقر',
                    textInputType: TextInputType.text,
                    controller: _dayController,
                  ),
                  InputWidget(
                    hint: 'للبيع: جمل/حصان/صقر',
                    textInputType: TextInputType.text,
                    controller: _nameController,
                    validator: ValidationsClass.emptyField,
                  ),
                  InputWidget(
                    hint: 'الهاتف',
                    textInputType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputWidget(
                          hint: 'النوع',
                          textInputType: TextInputType.text,
                          controller: _typeController,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InputWidget(
                          hint: 'الاب',
                          textInputType: TextInputType.text,
                          controller: _fatherController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputWidget(
                          hint: 'الام',
                          textInputType: TextInputType.text,
                          controller: _motherController,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InputWidget(
                          hint: 'الحالة',
                          textInputType: TextInputType.text,
                          controller: _stutesController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputWidget(
                          hint: 'االسن',
                          textInputType: TextInputType.number,
                          controller: _ageController,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InputWidget(
                          hint: 'العدد',
                          textInputType: TextInputType.number,
                          controller: _numberController,
                        ),
                      ),
                    ],
                  ),
                  InputWidget(
                    hint: 'المالك',
                    textInputType: TextInputType.text,
                    controller: _ownController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputWidget(
                          hint: 'السوم',
                          textInputType: TextInputType.number,
                          controller: _priceownController,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: InputWidget(
                          hint: 'السلامه',
                          textInputType: TextInputType.text,
                          controller: _savetyController,
                        ),
                      ),
                    ],
                  ),

                  InputWidget(
                    hint: 'الشروط',
                    textInputType: TextInputType.text,
                    controller: _conditionsController,
                  ),
                  InputWidget(
                    hint: 'التعريف والمعلومات بالسلعة',
                    textInputType: TextInputType.text,
                    controller: _detailsController,
                    validator: ValidationsClass.emptyField,
                  ),
                  InputWidget(
                    hint: 'الموقع',
                    textInputType: TextInputType.text,
                    controller: _locationController,
                  ),

                  _containerImages(),
                  // sign in
                  MyElevatedBtn(
                    color: Style.primaryColor,
                    radius: 5.0,
                    child: Text(
                      'اضافة',
                      style: Style.bold(color: Colors.white),
                    ),
                    onPressed: _addAuction,
                  ),
                  //
                ].map((e) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 7.0),
                    child: e,
                  );
                }).toList(),
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
    _nameController.dispose();
    _phoneController.dispose();
    _typeController.dispose();
    _fatherController.dispose();
    _motherController.dispose();
    _stutesController.dispose();
    _ageController.dispose();
    _ownController.dispose();
    _numberController.dispose();
    _priceownController.dispose();
    _savetyController.dispose();
    _conditionsController.dispose();
    _locationController.dispose();
    _detailsController.dispose();
  }

  Future<void> _addAuction() async {
    //
    if (_formKey.currentState!.validate()) {
      //
      final AcutionModel _auctionModel = AcutionModel(
        id: 1,
        day: _dayController.text.trim(),
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        type: _nameController.text.trim(),
        father: _fatherController.text.trim(),
        mother: _motherController.text.trim(),
        stableName: _stutesController.text.trim(),
        age: _ageController.text.trim(),
        number: _numberController.text.trim(),
        own: _ownController.text.trim(),
        savety: _savetyController.text.trim(),
        conditions: _conditionsController.text.trim(),
        details: _detailsController.text.trim(),
        location: _locationController.text.trim(),
        // img1: widget.image1,
      );
      await API.addAuction(
        context,
        img1: _image1,
        img2: _image2,
        img3: _image3,
        token: _token,
        auctionModel: _auctionModel,
      );
    } else
      MyCustomEasyLoading.showError(status: 'اسم والتفاصيل مطلوبه !!');
  }

  //
  final picker = ImagePicker();
  //
  File? _image1;
  File? _image2;
  File? _image3;
  //
  Future sourceImage1({ImageSource? imageSource}) async {
    // isShow = true;
    //
    final XFile? pickedFile =
        await picker.pickImage(source: imageSource ?? ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image1 = File(pickedFile.path);
      }
    });
  }

  Future sourceImage2({ImageSource? imageSource}) async {
    // isShow = true;
    //
    final XFile? pickedFile =
        await picker.pickImage(source: imageSource ?? ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image2 = File(pickedFile.path);
      }
    });
  }

  Future sourceImage3({ImageSource? imageSource}) async {
    // isShow = true;
    //
    final XFile? _pickedFile =
        await picker.pickImage(source: imageSource ?? ImageSource.camera);

    setState(() {
      if (_pickedFile != null) {
        _image3 = File(_pickedFile.path);
      }
    });
  }

  ImageSource _imageSource1 = ImageSource.camera;
  ImageSource _imageSource2 = ImageSource.camera;
  ImageSource _imageSource3 = ImageSource.camera;
  //
  Container _containerImages() {
    return Container(
      child: Row(
        children: [
          // select image NO.1
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.red.shade100,
              ),
              margin: const EdgeInsets.all(10.0),
              child: _image1 == null
                  ? ListTile(
                      onTap: () => _dilogToSelectSourceImg(imgNo: 1),
                      title: Icon(Icons.add),
                      subtitle: Text(
                        'اضف صورة',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        print('_dilogToSelectSourceImg1 ');
                        await _dilogToSelectSourceImg(imgNo: 1);
                      },
                      child: _setImgFromFile(_image1),
                    ),
            ),
          ),
          // select image NO.2
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.red.shade100,
              ),
              margin: const EdgeInsets.all(10.0),
              child: _image2 == null
                  ? ListTile(
                      onTap: () => _dilogToSelectSourceImg(imgNo: 2),
                      title: Icon(Icons.add),
                      subtitle: Text(
                        'اضف صورة',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        print('_dilogToSelectSourceImg2 ');
                        await _dilogToSelectSourceImg(imgNo: 2);
                      },
                      child: _setImgFromFile(_image2),
                    ),
            ),
          ),

          // select image NO.3
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.center,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                color: Colors.red.shade100,
              ),
              margin: const EdgeInsets.all(10.0),
              child: _image3 == null
                  ? ListTile(
                      onTap: () => _dilogToSelectSourceImg(imgNo: 3),
                      title: Icon(Icons.add),
                      subtitle: Text(
                        'اضف صورة',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        print('_dilogToSelectSourceImg3 ');
                        await _dilogToSelectSourceImg(imgNo: 3);
                      },
                      child: _setImgFromFile(_image3),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  _setImgFromFile(File? file) {
    if (file != null) {
      return Image.file(
        File(file.path),
        height: 100.0,
        width: 100.0,
      );
    }
    return null;
  }

  Future<void> _dilogToSelectSourceImg({required int imgNo}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        //
        return AlertDialog(
          title: Text('select image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyElevatedBtn(
                child: Text('select image cmaera'),
                onPressed: () async {
                  if (imgNo == 1) {
                    _imageSource1 = await ImageSource.camera;
                    sourceImage1(imageSource: _imageSource1).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                  if (imgNo == 2) {
                    _imageSource2 = await ImageSource.camera;
                    sourceImage2(imageSource: _imageSource2).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                  if (imgNo == 3) {
                    _imageSource3 = await ImageSource.camera;
                    sourceImage3(imageSource: _imageSource3).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                },
              ),
              const SizedBox(height: 10.0),
              MyElevatedBtn(
                child: Text('select image gallery'),
                onPressed: () async {
                  if (imgNo == 1) {
                    _imageSource1 = await ImageSource.gallery;
                    sourceImage1(imageSource: _imageSource1).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                  if (imgNo == 2) {
                    _imageSource2 = await ImageSource.gallery;
                    sourceImage2(imageSource: _imageSource2).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                  if (imgNo == 3) {
                    _imageSource3 = await ImageSource.gallery;
                    sourceImage3(imageSource: _imageSource3).then((value) {
                      Navigator.pop(context);
                      setState(() {});
                    });
                  }
                },
              ),
              const SizedBox(height: 10.0),
              MyElevatedBtn(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
        'offers/storeauction?name=${auctionModel.name}&details=${auctionModel.details},&type_name=${auctionModel.typeName},&location=${auctionModel.location},&location=${auctionModel.location}';
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
      // http.MultipartRequest request =
      //     http.MultipartRequest('POST', Uri.parse(_url))
      //       ..headers.addAll(_headers);
      //
      // if (img1 != null) {
      //   request.files.add(await http.MultipartFile.fromPath('img1', img1.path));
      // }
      // //
      // if (img2 != null) {
      //   request.files.add(await http.MultipartFile.fromPath('img2', img2.path));
      // }
      // //
      // if (img3 != null) {
      //   request.files.add(await http.MultipartFile.fromPath('img3', img3.path));
      // }
      BaseOptions options = new BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          // HttpHeaders.acceptHeader: "accept: multipart/form-data",
          HttpHeaders.acceptHeader: "accept: application/json",
        },
      );
      Dio dio = new Dio(options);
      // dio.options.contentType = Headers.formUrlEncodedContentType;
      //
      Map<String, dynamic> _map = {
        'data': auctionModel.toJson(),
        'img1': await MultipartFile.fromFile(img1!.path, filename: img1.path),
        // 'files': [
        //   if (img1 != null)
        //     {
        //       await MultipartFile.fromFile(img1.path, filename: img1.path),
        //     },
        //   if (img2 != null)
        //     {
        //       await MultipartFile.fromFile(img2.path, filename: img2.path),
        //     },
        //   if (img3 != null)
        //     {await MultipartFile.fromFile(img3.path, filename: img3.path)}
        // ]
      };
      FormData formData = FormData.fromMap(_map);
      //
      MyCustomEasyLoading.show(status: Constants.loadingMSG);
      //
      await dio
          .post('${Constants.baseUrl}offers/storeauction?',
              options: Options(
                contentType: 'multipart/form-data',
                // headers: {
                //   // 'Accept': "multipart/form-data",
                //   'Accept': "application/json",
                //   'Content-Type': "multipart/form-data",
                //   'Authorization': 'Bearer $token',
                // },
                headers: _headers,
              ),
              data: formData
              // Options(
              // headers: {
              //   HttpHeaders.authorizationHeader: token,
              //   HttpHeaders.contentTypeHeader: 'application/json',
              // },
              // ),
              )
          .then((response) {
        print('response = ${response.statusCode}');
        MyCustomEasyLoading.show(status: response.statusCode.toString());
      }).catchError((err) {
        print('my dio err = $err');
      });
      //
      // http.StreamedResponse _request = await request.send();
      // //
      // MyCustomEasyLoading.show(status: Constants.loadingMSG);
      // //
      // await http.Response.fromStream(_request).then((_response) {
      //   //
      //   // print('_response from add auction ${_response.statusCode}');
      //   //
      //   if (_response.statusCode == 200) {
      //     MyCustomEasyLoading.showSuccess();
      //     //
      //   } else
      //     return CustomFlushBar.flushbar(
      //       Constants.errorHappend,
      //       context,
      //       isError: true,
      //     );
      //   return null;
      // });

    } catch (e) {
      return Future.error(e);
    }
  } // end section auctions

}
