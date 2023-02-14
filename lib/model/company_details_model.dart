// To parse this JSON data, do
//
//     final companyDetailsModel = companyDetailsModelFromJson(jsonString);

import 'dart:convert';

CompanyDetailsModel companyDetailsModelFromJson(String str) =>
    CompanyDetailsModel.fromJson(json.decode(str));

String companyDetailsModelToJson(CompanyDetailsModel data) =>
    json.encode(data.toJson());

class CompanyDetailsModel {
  CompanyDetailsModel({
    this.data,
  });

  Data? data;

  factory CompanyDetailsModel.fromJson(Map<String, dynamic> json) =>
      CompanyDetailsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.addressOne,
    this.addressTwo,
    this.contactOne,
    this.contactTwo,
    this.contactThree,
    this.email,
    this.pan,
    this.facebook,
    this.instagram,
    this.youtube,
    this.logo,
    this.deliveryCharge,
    this.salesComissionPercent,
  });

  int? id;
  String? name;
  String? addressOne;
  String? addressTwo;
  String? contactOne;
  dynamic contactTwo;
  dynamic contactThree;
  String? email;
  dynamic pan;
  String? facebook;
  String? instagram;
  String? youtube;
  String? logo;
  int? deliveryCharge;
  int? salesComissionPercent;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        addressOne: json["address_one"],
        addressTwo: json["address_two"],
        contactOne: json["contact_one"],
        contactTwo: json["contact_two"],
        contactThree: json["contact_three"],
        email: json["email"],
        pan: json["pan"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        youtube: json["youtube"],
        logo: json["logo"],
        deliveryCharge: json["delivery_charge"],
        salesComissionPercent: json["sales_comission_percent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address_one": addressOne,
        "address_two": addressTwo,
        "contact_one": contactOne,
        "contact_two": contactTwo,
        "contact_three": contactThree,
        "email": email,
        "pan": pan,
        "facebook": facebook,
        "instagram": instagram,
        "youtube": youtube,
        "logo": logo,
        "delivery_charge": deliveryCharge,
        "sales_comission_percent": salesComissionPercent,
      };
}
