// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsondynamic);

import 'dart:convert';

BannerModel bannerModelFromJson(dynamic str) =>
    BannerModel.fromJson(json.decode(str));

class BannerModel {
  BannerModel({
    required this.data,
  });

  List<DataBanner> data;

  factory BannerModel.fromJson(Map<dynamic, dynamic> json) => BannerModel(
        data: List<DataBanner>.from(json["data"].map((x) => DataBanner.fromJson(x))),
      );
}

class DataBanner {
  DataBanner({
    this.id,
    this.title,
    this.content,
    this.img,
    // this.createdAt,
    // this.updatedAt,
  });

  dynamic id;
  dynamic title;
  dynamic content;
  dynamic img;
  // DateTime createdAt;
  // DateTime updatedAt;

  factory DataBanner.fromJson(Map<dynamic, dynamic> json) => DataBanner(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        img: json["img"],
        // createdAt: DateTime.parse(json["created_at"]),
        // updatedAt: DateTime.parse(json["updated_at"]),
      );
}
