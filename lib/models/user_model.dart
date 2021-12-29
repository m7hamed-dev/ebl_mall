// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  UserModel({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.id,
    this.name,
    this.phone,
    this.whatsappNumber,
    this.address,
    this.email,
    this.img,
    this.password,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;
  int? id;
  String? name;
  String? phone;
  String? password;
  dynamic whatsappNumber;
  String? address;
  String? email;
  String? img;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        whatsappNumber: json["whatsapp_number"],
        address: json["address"],
        email: json["email"],
        img: json["img"],
      );
}
