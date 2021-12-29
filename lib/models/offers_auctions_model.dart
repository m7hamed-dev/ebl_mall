// To parse this JSON data, do
//
//     final offersAuctionsModel = offersAuctionsModelFromJson(jsonString);

import 'dart:convert';

OffersAuctionsModel offersAuctionsModelFromJson(String str) =>
    OffersAuctionsModel.fromJson(json.decode(str));

class OffersAuctionsModel {
  OffersAuctionsModel({
    required this.data,
  });

  List<OffersAuctionsClass> data;

  factory OffersAuctionsModel.fromJson(Map<String, dynamic> json) =>
      OffersAuctionsModel(
        data: List<OffersAuctionsClass>.from(json["data"].map((x) => OffersAuctionsClass.fromJson(x))),
      );
}

class OffersAuctionsClass {
  OffersAuctionsClass({
    this.id,
    this.category,
    this.subCatogery,
    this.typeName,
    this.name,
    this.location,
    this.wight,
    this.color,
    this.number,
    this.details,
    this.price,
    this.savety,
    this.family,
    this.img1,
    this.img2,
    this.img3,
    this.auctionEndTime,
    this.auctionPrice,
    this.time,
    this.currency,
    this.productType,
    this.orgnizer,
    this.phone,
    this.auctionDate,
    this.video,
    this.feed,
    this.device,
    this.deviceDetails,
    this.deal,
    this.thodName,
    this.ownerName,
    this.tag,
    this.witness,
    this.originDate,
    this.transporter,
    this.transporterType,
    this.restNumber,
    this.age,
    this.lostType,
    this.lostNumber,
    this.day,
    this.father,
    this.mother,
    this.type,
    this.stutes,
    this.conditions,
    this.own,
    this.stableName,
    this.directions,
    this.transporterNumber,
    this.font,
    this.vaccine,
    this.height,
    this.lenghth,
    this.wieght,
    this.abuse,
    this.ofCource,
    this.discriotins,
    this.marbaName,
    this.cotchName,
    this.width,
    this.traning,
    this.tagDescrip,
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userWhatsappNumber,
    this.userAddress,
    this.userImage,
  });

  late int? id;
  String? category;
  String? subCatogery;
  String? typeName;
  String? name;
  String? location;
  dynamic wight;
  dynamic color;
  dynamic number;
  String? details;
  dynamic price;
  dynamic savety;
  dynamic family;
  String? img1;
  String? img2;
  String? img3;
  dynamic auctionEndTime;
  dynamic auctionPrice;
  String? time;
  dynamic currency;
  dynamic productType;
  dynamic orgnizer;
  dynamic phone;
  dynamic auctionDate;
  dynamic video;
  dynamic feed;
  dynamic device;
  dynamic deviceDetails;
  dynamic deal;
  dynamic thodName;
  dynamic ownerName;
  dynamic tag;
  dynamic witness;
  dynamic originDate;
  dynamic transporter;
  dynamic transporterType;
  dynamic restNumber;
  dynamic age;
  dynamic lostType;
  dynamic lostNumber;
  dynamic day;
  dynamic father;
  dynamic mother;
  dynamic type;
  dynamic stutes;
  dynamic conditions;
  dynamic own;
  dynamic stableName;
  dynamic directions;
  dynamic transporterNumber;
  dynamic font;
  dynamic vaccine;
  dynamic height;
  dynamic lenghth;
  dynamic wieght;
  dynamic abuse;
  dynamic ofCource;
  dynamic discriotins;
  dynamic marbaName;
  dynamic cotchName;
  dynamic width;
  dynamic traning;
  dynamic tagDescrip;
  int? userId;
  String? userName;
  String? userEmail;
  String? userPhone;
  dynamic userWhatsappNumber;
  String? userAddress;
  String? userImage;

  factory OffersAuctionsClass.fromJson(Map<String, dynamic> json) => OffersAuctionsClass(
        id: json["id"],
        category: json["category"],
        subCatogery: json["sub_catogery"],
        typeName: json["type_name"],
        name: json["name"],
        location: json["location"],
        wight: json["wight"],
        color: json["color"],
        number: json["number"],
        details: json["details"],
        price: json["price"],
        savety: json["savety"],
        family: json["family"],
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
        auctionEndTime: json["auction_end_time"],
        auctionPrice: json["auction_price"],
        time: json["time"],
        currency: json["currency"],
        productType: json["product_type"],
        orgnizer: json["orgnizer"],
        phone: json["phone"],
        auctionDate: json["auction_date"],
        video: json["video"],
        feed: json["feed"],
        device: json["device"],
        deviceDetails: json["device_details"],
        deal: json["deal"],
        thodName: json["thod_name"],
        ownerName: json["owner_name"],
        tag: json["tag"],
        witness: json["witness"],
        originDate: json["origin_date"],
        transporter: json["transporter"],
        transporterType: json["transporter_type"],
        restNumber: json["rest_number"],
        age: json["age"],
        lostType: json["lost_type"],
        lostNumber: json["lost_number"],
        day: json["day"],
        father: json["father"],
        mother: json["mother"],
        type: json["type"],
        stutes: json["stutes"],
        conditions: json["conditions"],
        own: json["own"],
        stableName: json["stable_name"],
        directions: json["directions"],
        transporterNumber: json["transporter_number"],
        font: json["font"],
        vaccine: json["vaccine"],
        height: json["height"],
        lenghth: json["lenghth"],
        wieght: json["wieght"],
        abuse: json["abuse"],
        ofCource: json["of_cource"],
        discriotins: json["discriotins"],
        marbaName: json["marba_name"],
        cotchName: json["cotch_name"],
        width: json["width"],
        traning: json["traning"],
        tagDescrip: json["tag_descrip"],
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userWhatsappNumber: json["user_whatsapp_number"],
        userAddress: json["user_address"],
        userImage: json["user_image"],
      );
}
