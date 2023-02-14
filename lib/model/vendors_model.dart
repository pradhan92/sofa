// To parse this JSON data, do
//
//     final vendorsModel = vendorsModelFromJson(jsonString);

import 'dart:convert';

VendorsModel vendorsModelFromJson(String str) =>
    VendorsModel.fromJson(json.decode(str));

String vendorsModelToJson(VendorsModel data) => json.encode(data.toJson());

class VendorsModel {
  VendorsModel({
    this.data,
  });

  List<Datum>? data;

  factory VendorsModel.fromJson(Map<String, dynamic> json) => VendorsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.store,
    this.contactPerson,
    this.mobile,
    this.pan,
    this.vendorTypeId,
    this.vendorType,
    this.countryId,
    this.country,
    this.provinceId,
    this.province,
    this.cityId,
    this.city,
    this.street,
    this.pincode,
    this.logo,
    this.featured,
    this.email,
    this.status,
    this.lat,
    this.lng,
    this.menu,
    this.totalProducts,
  });

  int? id;
  String? store;
  String? contactPerson;
  String? mobile;
  dynamic pan;
  int? vendorTypeId;
  String? vendorType;
  int? countryId;
  String? country;
  int? provinceId;
  String? province;
  int? cityId;
  String? city;
  String? street;
  String? pincode;
  String? logo;
  String? featured;
  String? email;
  String? status;
  double? lat;
  double? lng;
  List<Menu>? menu;
  int? totalProducts;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        store: json["store"],
        contactPerson: json["contact_person"],
        mobile: json["mobile"],
        pan: json["pan"],
        vendorTypeId: json["vendor_type_id"],
        vendorType: json["vendor_type"],
        countryId: json["country_id"],
        country: json["country"],
        provinceId: json["province_id"],
        province: json["province"],
        cityId: json["city_id"],
        city: json["city"],
        street: json["street"],
        pincode: json["pincode"],
        logo: json["logo"],
        featured: json["featured"],
        email: json["email"],
        status: json["status"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
        totalProducts: json["total_products"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": storeValues.reverse[store],
        "contact_person": contactPerson,
        "mobile": mobile,
        "pan": pan,
        "vendor_type_id": vendorTypeId,
        "vendor_type": vendorType,
        "country_id": countryId,
        "country": country,
        "province_id": provinceId,
        "province": province,
        "city_id": cityId,
        "city": city,
        "street": street,
        "pincode": pincode == null ? null : pincode,
        "logo": logo,
        "featured": featured,
        "email": email,
        "status": status,
        "lat": lat,
        "lng": lng,
        "menu": List<dynamic>.from(menu!.map((x) => x.toJson())),
        "total_products": totalProducts,
      };
}

class Menu {
  Menu({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.products,
  });

  int? id;
  String? name;
  String? slug;
  String? image;
  List<Product>? products;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
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
  Unit? unit;
  String? description;
  String? image;
  int? categoryId;
  int? vendorId;
  Store? vendor;
  int? cityId;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        discountPercent: json["discount_percent"],
        sellingPrice: json["selling_price"],
        unit: unitValues.map[json["unit"]],
        description: json["description"],
        image: json["image"],
        categoryId: json["category_id"],
        vendorId: json["vendor_id"],
        vendor: storeValues.map[json["vendor"]],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "discount_percent": discountPercent,
        "selling_price": sellingPrice,
        "unit": unitValues.reverse[unit],
        "description": description == null ? null : description,
        "image": image,
        "category_id": categoryId,
        "vendor_id": vendorId,
        "vendor": storeValues.reverse[vendor],
        "city_id": cityId,
      };
}

enum Unit { PER_PLATE, PER_PIECE, PER_KG, PER_CRATE }

final unitValues = EnumValues({
  "per Crate": Unit.PER_CRATE,
  "per Kg": Unit.PER_KG,
  "per Piece": Unit.PER_PIECE,
  "per Plate": Unit.PER_PLATE
});

enum Store {
  GREEN_PEACE,
  OLIVE_CAFE,
  BARAH_KITCHEN,
  DHARAN_KITCHEN,
  CHICKEN_VALLEY_COLD_STORE
}

final storeValues = EnumValues({
  "Barah Kitchen": Store.BARAH_KITCHEN,
  "Chicken Valley Cold Store": Store.CHICKEN_VALLEY_COLD_STORE,
  "Dharan Kitchen": Store.DHARAN_KITCHEN,
  "Green Peace": Store.GREEN_PEACE,
  "Olive Cafe": Store.OLIVE_CAFE
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
