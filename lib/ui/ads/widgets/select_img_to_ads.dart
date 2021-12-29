// // Copyright 2013 The Flutter Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// import 'dart:async';
// import 'dart:io';
// import 'package:ebll_mall/widgets/my_elevated_btn.dart';
// import 'package:ebll_mall/widgets/txt.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class SelectImgsToAdsWidget extends StatefulWidget {
//   @override
//   _SelectImgsToAdsWidgetState createState() => _SelectImgsToAdsWidgetState();
// }

// class _SelectImgsToAdsWidgetState extends State<SelectImgsToAdsWidget> {
//   //
//   List<XFile>? _imageFileList;

//   set _imageFile(XFile? value) {
//     _imageFileList = value == null ? null : [value];
//   }

//   dynamic _pickImageError;

//   String? _retrieveDataError;

//   final ImagePicker _picker = ImagePicker();
//   // final TextEditingController maxWidthController = TextEditingController();
//   // final TextEditingController maxHeightController = TextEditingController();
//   final TextEditingController qualityController = TextEditingController();

//   void _onImageButtonPressed(ImageSource source,
//       {BuildContext? context, bool isMultiImage = false}) async {
//     //
//     if (isMultiImage) {
//       // await _displayPickImageDialog(context!,
//       //     (double? maxWidth, double? maxHeight, int? quality) async {
//       {
//         try {
//           List<XFile>? pickedFileList = await _picker.pickMultiImage(
//             maxWidth: 120.0,
//             maxHeight: 120.0,
//             imageQuality: 100,
//           );
//           setState(() {
//             _imageFileList = pickedFileList;
//           });
//         } catch (e) {
//           setState(() {
//             _pickImageError = e;
//           });
//         }
//       }
//       // });
//     }
//   }

//   @override
//   void dispose() {
//     // maxWidthController.dispose();
//     // maxHeightController.dispose();
//     qualityController.dispose();
//     super.dispose();
//   }

//   Widget _previewImages() {
//     //
//     final Text? retrieveError = _getRetrieveErrorWidget();
//     if (retrieveError != null) {
//       return retrieveError;
//     }
//     if (_imageFileList != null) {
//       //
//       return GridView.builder(
//         // key: UniqueKey(),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: _imageFileList!.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           //
//           return Container(
//             padding: const EdgeInsets.all(8.0),
//             margin: const EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               border: Border.all(
//                 color: Colors.grey,
//               ),
//               borderRadius: BorderRadius.circular(
//                 10.0,
//               ),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 90.0,
//                     child: Image.file(
//                       File(
//                         _imageFileList![index].path,
//                       ),
//                       height: 300.0,
//                       width: 300.0,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 MyElevatedBtn(
//                   height: 40.0,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 2.0,
//                     vertical: 4.0,
//                   ),
//                   onPressed: () {
//                     if (_imageFileList != null) {
//                       _imageFileList!.removeAt(index);
//                       setState(() {});
//                     }
//                   },
//                   child: Txt(
//                     typesTxt: TypesTxt.medium,
//                     data: 'remove image',
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       );
//     } else if (_pickImageError != null) {
//       return Text(
//         'Pick image error: $_pickImageError',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return const Text(
//         'You have not yet picked an image.',
//         textAlign: TextAlign.center,
//       );
//     }
//   }

//   Widget _handlePreview() {
//     return _previewImages();
//   }

//   Future<void> retrieveLostData() async {
//     final LostDataResponse response = await _picker.retrieveLostData();
//     if (response.isEmpty) {
//       return;
//     }
//     if (response.file != null) {
//       setState(() {
//         _imageFile = response.file;
//         _imageFileList = response.files;
//       });
//     } else {
//       _retrieveDataError = response.exception!.code;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     //
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           FutureBuilder<void>(
//             future: retrieveLostData(),
//             builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                 case ConnectionState.waiting:
//                   return const Text(
//                     'You have not yet picked an image.',
//                     textAlign: TextAlign.center,
//                   );
//                 case ConnectionState.done:
//                   return _handlePreview();
//                 default:
//                   if (snapshot.hasError) {
//                     return Text(
//                       'Pick image/video error: ${snapshot.error}}',
//                       textAlign: TextAlign.center,
//                     );
//                   } else {
//                     return const Text(
//                       'You have not yet picked an image.',
//                       textAlign: TextAlign.center,
//                     );
//                   }
//               }
//             },
//           ),
//           // select images
//           _builOptionsSelectImgs(context),
//         ],
//       ),
//     );
//   }

//   Row _builOptionsSelectImgs(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 16.0),
//           child: FloatingActionButton(
//             onPressed: () {
//               if (_imageFileList != null) {
//                 _imageFileList!.length = 0;
//                 setState(() {});
//               }
//               _onImageButtonPressed(
//                 ImageSource.gallery,
//                 context: context,
//                 isMultiImage: true,
//               );
//             },
//             heroTag: 'image1',
//             tooltip: 'Pick Multiple Image from gallery',
//             child: const Icon(Icons.photo_library),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 16.0),
//           child: FloatingActionButton(
//             onPressed: () {
//               if (_imageFileList != null) {
//                 _imageFileList!.length = 0;
//                 setState(() {});
//               }
//               _onImageButtonPressed(
//                 ImageSource.camera,
//                 context: context,
//                 isMultiImage: true,
//               );
//             },
//             heroTag: 'camera',
//             tooltip: 'Pick Multiple Image from gallery',
//             child: const Icon(Icons.camera_sharp),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 16.0),
//           child: FloatingActionButton(
//             onPressed: () {
//               print('object ${_imageFileList!.length}');
//             },
//             heroTag: 'camera2',
//             tooltip: 'Pick Multiple Image from gallery',
//             child: const Icon(Icons.panorama_fish_eye),
//           ),
//         ),
//       ],
//     );
//   }

//   Text? _getRetrieveErrorWidget() {
//     if (_retrieveDataError != null) {
//       final Text result = Text(_retrieveDataError!);
//       _retrieveDataError = null;
//       return result;
//     }
//     return null;
//   }

//   // Future<void> _displayPickImageDialog(
//   //     BuildContext context, OnPickImageCallback onPick) async {
//   //   return showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           title: Text('Add optional parameters'),
//   //           content: Column(
//   //             children: <Widget>[
//   //               TextField(
//   //                 controller: maxWidthController,
//   //                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//   //                 decoration:
//   //                     InputDecoration(hintText: "Enter maxWidth if desired"),
//   //               ),
//   //               TextField(
//   //                 controller: maxHeightController,
//   //                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//   //                 decoration:
//   //                     InputDecoration(hintText: "Enter maxHeight if desired"),
//   //               ),
//   //               TextField(
//   //                 controller: qualityController,
//   //                 keyboardType: TextInputType.number,
//   //                 decoration:
//   //                     InputDecoration(hintText: "Enter quality if desired"),
//   //               ),
//   //             ],
//   //           ),
//   //           actions: <Widget>[
//   //             TextButton(
//   //               child: const Text('CANCEL'),
//   //               onPressed: () {
//   //                 Navigator.of(context).pop();
//   //               },
//   //             ),
//   //             TextButton(
//   //                 child: const Text('PICK'),
//   //                 onPressed: () {
//   //                   double? width = maxWidthController.text.isNotEmpty
//   //                       ? double.parse(maxWidthController.text)
//   //                       : null;
//   //                   double? height = maxHeightController.text.isNotEmpty
//   //                       ? double.parse(maxHeightController.text)
//   //                       : null;
//   //                   int? quality = qualityController.text.isNotEmpty
//   //                       ? int.parse(qualityController.text)
//   //                       : null;
//   //                   onPick(width, height, quality);
//   //                   Navigator.of(context).pop();
//   //                 }),
//   //           ],
//   //         );
//   //       });
//   // }

// }

// typedef void OnPickImageCallback(
//     double? maxWidth, double? maxHeight, int? quality);
