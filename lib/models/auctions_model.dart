// To parse this JSON data, do
//
//     final auctionModel = auctionModelFromJson(jsondynamic);

import 'dart:convert';

AuctionModel auctionModelFromJson(dynamic str) =>
    AuctionModel.fromJson(json.decode(str));

dynamic auctionModelToJson(AuctionModel data) => json.encode(data.toJson());

class AuctionModel {
  AuctionModel({
    required this.data,
  });

  List<AcutionModel> data;

  factory AuctionModel.fromJson(Map<dynamic, dynamic> json) => AuctionModel(
        data: List<AcutionModel>.from(
            json["data"].map((x) => AcutionModel.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AcutionModel {
  AcutionModel({
    required this.id,
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
  });

  int id;
  dynamic category;
  dynamic subCatogery;
  dynamic typeName;
  dynamic userName;
  String? name;
  dynamic location;
  dynamic wight;
  dynamic color;
  dynamic number;
  String? details;
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

  factory AcutionModel.fromJson(Map<dynamic, dynamic> json) => AcutionModel(
        id: json["id"],
        category: json["category"],
        subCatogery: json["sub_catogery"],
        typeName: json["type_name"],
        userName: json["user_name"],
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
        img2: json["img2"] == null ? null : json["img2"],
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
      );

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "category": category,
        "sub_catogery": subCatogery,
        "type_name": typeName,
        "user_name": userName,
        "name": name,
        "location": location,
        "wight": wight,
        "color": color,
        "number": number,
        "details": details,
        "price": price,
        "savety": savety,
        "family": family,
        "img1": img1,
        "img2": img2 == null ? null : img2,
        "img3": img3,
        "auction_end_time": auctionEndTime,
        "auction_price": auctionPrice,
        "time": time,
        "currency": currency,
        "product_type": productType,
        "orgnizer": orgnizer,
        "phone": phone,
        "auction_date": auctionDate,
        "video": video,
        "feed": feed,
        "device": device,
        "device_details": deviceDetails,
        "deal": deal,
        "thod_name": thodName,
        "owner_name": ownerName,
        "tag": tag,
        "witness": witness,
        "origin_date": originDate,
        "transporter": transporter,
        "transporter_type": transporterType,
        "rest_number": restNumber,
        "age": age,
        "lost_type": lostType,
        "lost_number": lostNumber,
        "day": day,
        "father": father,
        "mother": mother,
        "type": type,
        "stutes": stutes,
        "conditions": conditions,
        "own": own,
        "stable_name": stableName,
        "directions": directions,
        "transporter_number": transporterNumber,
        "font": font,
        "vaccine": vaccine,
        "height": height,
        "lenghth": lenghth,
        "wieght": wieght,
        "abuse": abuse,
        "of_cource": ofCource,
        "discriotins": discriotins,
        "marba_name": marbaName,
        "cotch_name": cotchName,
        "width": width,
        "traning": traning,
        "tag_descrip": tagDescrip,
      };
}
