import 'dart:io';
import 'package:ebll_mall/data/constant.dart';
import 'package:ebll_mall/data/local_storage.dart';
import 'package:ebll_mall/models/user_model.dart';
import 'package:ebll_mall/network/api.dart';
import 'package:ebll_mall/style/style.dart';
import 'package:ebll_mall/tools/custom_flushbar.dart';
import 'package:ebll_mall/tools/validation.dart';
import 'package:ebll_mall/widgets/custom_cached_network_img.dart';
import 'package:ebll_mall/widgets/my_elevated_btn.dart';
import 'package:ebll_mall/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileUser extends StatefulWidget {
  //
  final String? imgUrl;
  final UserModel userModel;
  //
  const UpdateProfileUser({Key? key, this.imgUrl, required this.userModel})
      : super(key: key);
  // UpdateProfileUser(this.type);
  @override
  UpdateProfileUserState createState() => UpdateProfileUserState();
}

class UpdateProfileUserState extends State<UpdateProfileUser> {
  File? _image;
  var imagePicker;

  //
  String _token = '';
  //
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  //
  //
  @override
  void initState() {
    super.initState();
    //
    imagePicker = ImagePicker();
    _token = LocalStorage.getToekn;
    //
    _nameController.text = widget.userModel.name ?? '';
    _phoneController.text = widget.userModel.phone ?? '';
    //
    _passwordController.text =
        LocalStorage.getValPrefs(LocalStorage.passwordKey);
    //
    _emailController.text = widget.userModel.email ?? '';
    _addressController.text = widget.userModel.address ?? '';
  }

  // ImageSource? source;
  ImageSource source = ImageSource.camera;
  //
  final _formKey = GlobalKey<FormState>();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text('update profile'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Center(
              child: InkWell(
                onTap: () async {
                  //
                  await showDialog(
                      context: context,
                      builder: (builder) {
                        //
                        return AlertDialog(
                          title: Text('select image'),
                          actions: [
                            //
                            MyElevatedBtn(
                              onPressed: () async {
                                source = await ImageSource.camera;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text('select from camera'),
                            ),
                            const SizedBox(height: 10.0),
                            //
                            MyElevatedBtn(
                              onPressed: () async {
                                source = await ImageSource.gallery;
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text('select from gallery'),
                            ),
                            const SizedBox(height: 10.0),
                          ],
                        );
                      });

                  XFile image = await imagePicker.pickImage(
                    source: source,
                    imageQuality: 50,
                    preferredCameraDevice: CameraDevice.front,
                  );
                  //
                  setState(() {
                    _image = File(image.path);
                  });
                },
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // color: Colors.orange.shade400,
                  ),
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.fill,
                        )
                      : Hero(
                          tag: widget.userModel,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              // color: Colors.orange.shade400,
                            ),
                            width: 120.0,
                            height: 120.0,
                            child: CustomCachedNetworkImage(
                              width: 120.0,
                              height: 120.0,
                              imageUrl:
                                  widget.imgUrl != null ? widget.imgUrl! : '',
                              urlIsProfile: true,
                            ),
                          ),
                        ),
                ),
              ),
            ),
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
              hint: '_email',
              controller: _emailController,
              validator: ValidationsClass.emptyField,
            ),

            InputWidget(
              hint: 'إدخل كلمة المرور',
              // textInputType: TextInputType.visiblePassword,
              controller: _passwordController,
              obscureText: true,
              validator: ValidationsClass.emptyField,
            ),

            InputWidget(
              hint: 'ادخل العنوان',
              controller: _addressController,
              validator: ValidationsClass.emptyField,
            ),

            // update
            MyElevatedBtn(
              color: Style.primaryColor,
              radius: 5.0,
              child: Text(
                'update',
                style: Style.bold(color: Colors.white),
              ),
              onPressed: _updateProfiel,
            ),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 10.0,
              ),
              child: e,
            );
          }).toList(),
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

  _updateProfiel() async {
    if (_formKey.currentState!.validate()) {
      final UserModel _userModel = UserModel(
        name: _nameController.text.trim(),
        password: _passwordController.text.trim(),
        email: _emailController.text.trim(),
        address: _addressController.text.trim(),
        phone: _phoneController.text.trim(),
      );
      //
      await API.updateProfileUser(_token, _userModel, context, _image);
    } else {
      return CustomFlushBar.flushbar(
        Constants.allInputsIsEmpty,
        context,
        isError: true,
      );
    }
  }
}
