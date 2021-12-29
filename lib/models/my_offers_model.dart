// To parse this JSON data, do
//
//     final myOffersModel = myOffersModelFromJson(jsondynamic);

import 'dart:convert';

MyOffersModel myOffersModelFromJson(dynamic str) =>
    MyOffersModel.fromJson(json.decode(str));

// dynamic myOffersModelToJson(MyOffersModel data) => json.encode(data.toJson());

class MyOffersModel {
  MyOffersModel({
    required this.data,
  });

  List<MyOfferModel> data;

  factory MyOffersModel.fromJson(Map<dynamic, dynamic> json) => MyOffersModel(
        data: List<MyOfferModel>.from(
            json["data"].map((x) => MyOfferModel.fromJson(x))),
      );

  // Map<dynamic, dynamic> toJson() => {
  //     "data": List<dynamic>.from(data.map((x) => x.toJson())),
  // };
}

class MyOfferModel {
  MyOfferModel({
    this.id,
    this.categoryId,
    this.subCatogeryId,
    this.typeId,
    this.userId,
    this.name,
    this.location,
    this.color,
    this.number,
    this.details,
    this.price,
    this.currency,
    this.savety,
    this.family,
    this.img1,
    this.img2,
    this.img3,
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
    this.isApproved,
    this.isClosed,
    this.auctionEndTime,
    this.auctionPrice,
    // this.createdAt,
    // this.updatedAt,
  });

  dynamic id;
  dynamic categoryId;
  dynamic subCatogeryId;
  dynamic typeId;
  dynamic userId;
  dynamic name;
  dynamic location;
  dynamic color;
  dynamic number;
  dynamic details;
  dynamic price;
  dynamic currency;
  dynamic savety;
  dynamic family;
  dynamic img1;
  dynamic img2;
  dynamic img3;
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
  dynamic isApproved;
  dynamic isClosed;
  dynamic auctionEndTime;
  dynamic auctionPrice;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory MyOfferModel.fromJson(Map<dynamic, dynamic> json) => MyOfferModel(
        id: json["id"],
        categoryId: json["category_id"],
        subCatogeryId: json["sub_catogery_id"],
        typeId: json["type_id"],
        userId: json["user_id"],
        name: json["name"],
        location: json["location"],
        color: json["color"],
        number: json["number"] == null ? null : json["number"],
        details: json["details"],
        price: json["price"] == null ? null : json["price"],
        currency: json["currency"] == null ? null : json["currency"],
        savety: json["savety"] == null ? null : json["savety"],
        family: json["family"],
        img1: json["img1"],
        img2: json["img2"] == null ? null : json["img2"],
        img3: json["img3"],
        productType: json["product_type"],
        orgnizer: json["orgnizer"],
        phone: json["phone"] == null ? null : json["phone"],
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
        age: json["age"] == null ? null : json["age"],
        lostType: json["lost_type"],
        lostNumber: json["lost_number"],
        day: json["day"] == null ? null : json["day"],
        father: json["father"] == null ? null : json["father"],
        mother: json["mother"] == null ? null : json["mother"],
        type: json["type"] == null ? null : json["type"],
        stutes: json["stutes"] == null ? null : json["stutes"],
        conditions: json["conditions"] == null ? null : json["conditions"],
        own: json["own"] == null ? null : json["own"],
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
        isApproved: json["is_approved"],
        isClosed: json["is_closed"],
        auctionEndTime: json["auction_end_time"],
        auctionPrice: json["auction_price"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );

  // Map<dynamic, dynamic> toJson() => {
  //     "id": id,
  //     "category_id": categoryId,
  //     "sub_catogery_id": subCatogeryId,
  //     "type_id": typeId,
  //     "user_id": userId,
  //     "name": name,
  //     "location": location,
  //     "color": color,
  //     "number": number == null ? null : number,
  //     "details": details,
  //     "price": price == null ? null : price,
  //     "currency": currency == null ? null : currency,
  //     "savety": savety == null ? null : savety,
  //     "family": family,
  //     "img1": img1,
  //     "img2": img2 == null ? null : img2,
  //     "img3": img3,
  //     "product_type": productType,
  //     "orgnizer": orgnizer,
  //     "phone": phone == null ? null : phone,
  //     "auction_date": auctionDate,
  //     "video": video,
  //     "feed": feed,
  //     "device": device,
  //     "device_details": deviceDetails,
  //     "deal": deal,
  //     "thod_name": thodName,
  //     "owner_name": ownerName,
  //     "tag": tag,
  //     "witness": witness,
  //     "origin_date": originDate,
  //     "transporter": transporter,
  //     "transporter_type": transporterType,
  //     "rest_number": restNumber,
  //     "age": age == null ? null : age,
  //     "lost_type": lostType,
  //     "lost_number": lostNumber,
  //     "day": day == null ? null : day,
  //     "father": father == null ? null : father,
  //     "mother": mother == null ? null : mother,
  //     "type": type == null ? null : type,
  //     "stutes": stutes == null ? null : stutes,
  //     "conditions": conditions == null ? null : conditions,
  //     "own": own == null ? null : own,
  //     "stable_name": stableName,
  //     "directions": directions,
  //     "transporter_number": transporterNumber,
  //     "font": font,
  //     "vaccine": vaccine,
  //     "height": height,
  //     "lenghth": lenghth,
  //     "wieght": wieght,
  //     "abuse": abuse,
  //     "of_cource": ofCource,
  //     "discriotins": discriotins,
  //     "marba_name": marbaName,
  //     "cotch_name": cotchName,
  //     "width": width,
  //     "traning": traning,
  //     "tag_descrip": tagDescrip,
  //     "is_approved": isApproved,
  //     "is_closed": isClosed,
  //     "auction_end_time": auctionEndTime,
  //     "auction_price": auctionPrice,
  //     "created_at": createdAt.toIso8601dynamic(),
  //     "updated_at": updatedAt.toIso8601dynamic(),
  // };

}
