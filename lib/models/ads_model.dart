// To parse this JSON data, do
//
//     final adsModel = adsModelFromJson(jsonString);

import 'dart:convert';

AdsModel adsModelFromJson(String str) => AdsModel.fromJson(json.decode(str));

class AdsModel {
  AdsModel({
    required this.data,
  });

  List<DataAds> data;

  factory AdsModel.fromJson(Map<String, dynamic> json) => AdsModel(
        data: List<DataAds>.from(json["data"].map((x) => DataAds.fromJson(x))),
      );
}

class DataAds {
  DataAds({
    this.id,
    this.category,
    this.subCatogery,
    this.typeName,
    this.userName,
    this.name,
    this.location,
    this.wight,
    this.color,
    this.number,
    this.details,
    required this.price,
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
  });

  dynamic id;
  Category? category;
  String? subCatogery;
  TypeName? typeName;
  UserName? userName;
  String? name;
  String? location;
  dynamic wight;
  dynamic color;
  dynamic number;
  dynamic details;
  dynamic price;
  dynamic savety;
  dynamic family;
  dynamic img1;
  dynamic img2;
  dynamic img3;
  dynamic auctionEndTime;
  dynamic auctionPrice;
  dynamic time;
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

  factory DataAds.fromJson(Map<dynamic, dynamic> json) => DataAds(
        id: json["id"],
        category: categoryValues.map[json["category"]],
        subCatogery: json["sub_catogery"],
        typeName: typeNameValues.map[json["type_name"]],
        userName: userNameValues.map[json["user_name"]],
        name: json["name"],
        location: json["location"] == null ? null : json["location"],
        wight: json["wight"],
        color: json["color"] == null ? null : json["color"],
        number: json["number"] == null ? null : json["number"],
        details: json["details"],
        price: json["price"] == null ? null : priceValues.map[json["price"]],
        savety: json["savety"] == null ? null : json["savety"],
        family: json["family"] == null ? null : json["family"],
        img1: json["img1"] == null ? null : json["img1"],
        img2: json["img2"] == null ? null : json["img2"],
        img3: json["img3"] == null ? null : json["img3"],
        auctionEndTime: json["auction_end_time"],
        auctionPrice: json["auction_price"],
        time: timeValues.map[json["time"]],
        currency: json["currency"],
        productType: json["product_type"] == null ? null : json["product_type"],
        orgnizer: json["orgnizer"] == null ? null : json["orgnizer"],
        phone: json["phone"] == null ? null : json["phone"],
        auctionDate: json["auction_date"] == null ? null : json["auction_date"],
        video: json["video"] == null ? null : json["video"],
        feed: json["feed"] == null ? null : json["feed"],
        device: json["device"] == null ? null : json["device"],
        deviceDetails:
            json["device_details"] == null ? null : json["device_details"],
        deal: json["deal"] == null ? null : json["deal"],
        thodName: json["thod_name"] == null ? null : json["thod_name"],
        ownerName: json["owner_name"] == null ? null : json["owner_name"],
        tag: json["tag"] == null ? null : json["tag"],
        witness: json["witness"] == null ? null : json["witness"],
        originDate: json["origin_date"] == null ? null : json["origin_date"],
        transporter: json["transporter"] == null ? null : json["transporter"],
        transporterType:
            json["transporter_type"] == null ? null : json["transporter_type"],
        restNumber: json["rest_number"] == null ? null : json["rest_number"],
        age: json["age"] == null ? null : json["age"],
        lostType: json["lost_type"] == null ? null : json["lost_type"],
        lostNumber: json["lost_number"] == null ? null : json["lost_number"],
        day: json["day"],
        father: json["father"],
        mother: json["mother"],
        type: json["type"],
        stutes: json["stutes"],
        conditions: json["conditions"],
        own: json["own"],
        stableName: json["stable_name"] == null ? null : json["stable_name"],
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
      );
}

enum Category { EMPTY, CATEGORY, PURPLE, FLUFFY }

final categoryValues = EnumValues({
  "ﻗﺴﻢ اﻟﺨﻴﻮل": Category.CATEGORY,
  "اﻟﻘﺴﻢ اﻟﻌﺎم واﻟﺎﺑﻞ": Category.EMPTY,
  "ﻗﺴﻢ اﻟﺪواﺟﻦ واﻟﻄﻴﻮر": Category.FLUFFY,
  "ﻗﺴﻢ اﻟﻤﻮاﺷﻲ": Category.PURPLE
});

enum Price { EMPTY, PRICE }

final priceValues = EnumValues({"على السوم": Price.EMPTY, "٠٠٠٠": Price.PRICE});

enum Time { EMPTY, THE_3, TIME, PURPLE }

final timeValues = EnumValues({
  "منذ أسبوع": Time.EMPTY,
  "منذ شهرين": Time.PURPLE,
  "منذ 3 أسابيع": Time.THE_3,
  "منذ شهر": Time.TIME
});

enum TypeName { EMPTY }

final typeNameValues = EnumValues({"إعلان": TypeName.EMPTY});

enum UserName { EMPTY, USER_NAME, MUAWIA, ABDALMJIED }

final userNameValues = EnumValues({
  "abdalmjied": UserName.ABDALMJIED,
  "سبحان": UserName.EMPTY,
  "Muawia": UserName.MUAWIA,
  "سبحان الله": UserName.USER_NAME
});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
