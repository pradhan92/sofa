// To parse this JSON data, do
//
//     final billingAddressModel = billingAddressModelFromJson(jsonString);

import 'dart:convert';

BillingAddressModel billingAddressModelFromJson(String str) =>
    BillingAddressModel.fromJson(json.decode(str));

String billingAddressModelToJson(BillingAddressModel data) =>
    json.encode(data.toJson());

class BillingAddressModel {
  BillingAddressModel({
    this.id,
    this.userId,
    this.countryId,
    this.stateId,
    this.cityId,
    this.addressTitle,
    this.name,
    this.organization,
    this.detailAddressDirection,
    this.mobile,
    this.alternatePhoneNumber,
    this.lat,
    this.lng,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? countryId;
  int? stateId;
  int? cityId;
  String? addressTitle;
  String? name;
  String? organization;
  String? detailAddressDirection;
  String? mobile;
  dynamic alternatePhoneNumber;
  double? lat;
  double? lng;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BillingAddressModel.fromJson(Map<String, dynamic> json) =>
      BillingAddressModel(
        id: json["id"],
        userId: json["user_id"],
        countryId: json["country_id"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        addressTitle: json["address_title"],
        name: json["name"],
        organization: json["organization"],
        detailAddressDirection: json["detail_address_direction"],
        mobile: json["mobile"],
        alternatePhoneNumber: json["alternate_phone_number"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "country_id": countryId,
        "state_id": stateId,
        "city_id": cityId,
        "address_title": addressTitle,
        "name": name,
        "organization": organization,
        "detail_address_direction": detailAddressDirection,
        "mobile": mobile,
        "alternate_phone_number": alternatePhoneNumber,
        "lat": lat,
        "lng": lng,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
