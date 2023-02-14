// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.vendorName,
    this.vendorLogo,
    this.billAmount,
    this.totalQuantity,
    this.products,
  });

  String? vendorName;
  String? vendorLogo;
  int? billAmount;
  int? totalQuantity;
  List<Product>? products;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        vendorName: json["vendor_name"],
        vendorLogo: json["vendor_logo"],
        billAmount: json["bill_amount"],
        totalQuantity: json["total_quantity"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendor_name": vendorName,
        "vendor_logo": vendorLogo,
        "bill_amount": billAmount,
        "total_quantity": totalQuantity,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.userId,
    this.productId,
    this.productName,
    this.image,
    this.qty,
    this.amount,
    this.notes,
    this.sellingPrice,
    this.vendorId,
    this.vendorName,
    this.vendorLogo,
  });

  int? id;
  int? userId;
  int? productId;
  String? productName;
  String? image;
  int? qty;
  int? amount;
  String? notes;
  int? sellingPrice;
  int? vendorId;
  String? vendorName;
  String? vendorLogo;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        image: json["image"],
        qty: json["qty"],
        amount: json["amount"],
        notes: json["notes"] == null ? null : json["notes"],
        sellingPrice: json["selling_price"],
        vendorId: json["vendor_id"],
        vendorName: json["vendor_name"],
        vendorLogo: json["vendor_logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "product_name": productName,
        "image": image,
        "qty": qty,
        "amount": amount,
        "notes": notes == null ? null : notes,
        "selling_price": sellingPrice,
        "vendor_id": vendorId,
        "vendor_name": vendorName,
        "vendor_logo": vendorLogo,
      };
}
