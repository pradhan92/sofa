// To parse this JSON data, do
//
//     final specialDealModel = specialDealModelFromJson(jsonString);

import 'dart:convert';

SpecialDealModel specialDealModelFromJson(String str) =>
    SpecialDealModel.fromJson(json.decode(str));

String specialDealModelToJson(SpecialDealModel data) =>
    json.encode(data.toJson());

class SpecialDealModel {
  SpecialDealModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory SpecialDealModel.fromJson(Map<String, dynamic> json) =>
      SpecialDealModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
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
        description: json["description"] == null ? null : json["description"],
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
        "description": description == null ? null : description,
        "image": image,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "vendor": vendor,
        "city_id": cityId,
      };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic? prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}
