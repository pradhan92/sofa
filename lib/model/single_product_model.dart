// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) =>
    json.encode(data.toJson());

class SingleProductModel {
  SingleProductModel({
    this.data,
  });

  List<Datum>? data;

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.price,
    this.discountPercent,
    this.sellingPrice,
    this.unit,
    this.description,
    this.image,
    this.categoryId,
    this.vendorId,
    this.vendor,
    this.cityId,
  });

  int? id;
  String? name;
  int? price;
  int? discountPercent;
  int? sellingPrice;
  String? unit;
  String? description;
  String? image;
  int? categoryId;
  int? vendorId;
  String? vendor;
  int? cityId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discountPercent: json["discount_percent"],
        sellingPrice: json["selling_price"],
        unit: json["unit"],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        vendorId: json["vendor_id"],
        vendor: json["vendor"],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_percent": discountPercent,
        "selling_price": sellingPrice,
        "unit": unit,
        "description": description,
        "image": image,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "vendor": vendor,
        "city_id": cityId,
      };
}
