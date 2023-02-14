import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofashoptask1/model/cart_model.dart';
import 'package:sofashoptask1/model/company_details_model.dart';
import 'package:sofashoptask1/model/single_product_model.dart';
import 'package:sofashoptask1/model/single_vendor_model.dart';
import 'package:sofashoptask1/model/special_deal_model.dart';
import 'package:sofashoptask1/model/vendors_model.dart';
import 'package:sofashoptask1/view/home.dart';
import 'dart:convert';

class RemoteService {
  static String baseURL = "https://codeitapps.com/api/";
  static var client = http.Client();
//method
//fetch feature vendors
  static Future<VendorsModel?> fetchVendors() async {
    try {
      var response = await client.get(
          Uri.parse('https://codeitapps.com/api/vendor-information?limit=10'),
          //Uri.parse('baseURL/vendor-information?limit=10'),
          headers: {'Accept': 'application/json'});
      //print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return vendorsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //fetch feature special deal
  static Future<SpecialDealModel?> fetchSpecialDeal() async {
    try {
      var response = await client.get(
          //Uri.parse('baseURL/special-deal?limit=8'),
          Uri.parse('https://codeitapps.com/api/special-deal?limit=8'),
          headers: {'Accept': 'application/json'});
      //print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return specialDealModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //register
  static Future register(Map data) async {
    try {
      var response = await client.post(
          //Uri.parse('baseURL/signup'),
          Uri.parse('https://codeitapps.com/api/signup'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json'
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Account has been Register");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //address
  static Future address(Map data) async {
    try {
      var response = await client.post(
          //Uri.parse('baseURL/signup'),
          Uri.parse('https://codeitapps.com/api/address'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json'
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        Get.snackbar("Success", "your oder place has been successfully saved");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //login
  static Future login(Map data) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var response = await client.post(
          //Uri.parse('baseURL/login'),
          Uri.parse('https://codeitapps.com/api/login'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json'
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        preferences.setString("token", jsonData['token']);
        preferences.setString("name", jsonData['user']['name']);

        Get.offAll(() => const MyHomePage());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //forgot password
  static Future forgotpassword(Map data) async {
    try {
      var response = await client.post(
          //Uri.parse('baseURL/forgot-password'),
          Uri.parse('https://codeitapps.com/api/forgot-password'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json'
          },
          body: jsonEncode(data));
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Your Request has been sent");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //fetch  single vendor  from server
  static Future<SingleVendorModel?> fetchSingleVendor(int id) async {
    try {
      var response =
          await client.get(Uri.parse("baseURL/vendor-information?id=1"));
      // await http.get( Uri.parse("https://codeitapps.com/api/vendor-information?id=1"));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return singleVendorModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //fetch  single Product  from server
  static Future<SingleProductModel?> fetchProduct(int id) async {
    try {
      var response = await client
          .get(Uri.parse("https://codeitapps.com/api/product?productId=$id"));
      // var response = await http.get(Uri.parse("baseURL/product?productId=id"));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return singleProductModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //add to card
  static Future addCard(Map data) async {
    try {
      //var response = await client.post(Uri.parse("baseURL/cart"),
      var response = await client.post(
          Uri.parse("https://codeitapps.com/api/cart"),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json'
          },
          body: jsonEncode(data));
      //print("tara");
      //print(response.body);
      //if (response.statusCode == 201 || response.statusCode == 200) {
      if (response.statusCode == 200) {
        Get.snackbar("message", "Your item has been successfully add in cart");
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

//
//fetch  billing address  from server
  static Future<CompanyDetailsModel?> fetchAddress(int id) async {
    try {
      //var response = await http.get(Uri.parse("baseURL/company?"));
      var response = await client
          .get(Uri.parse("https://codeitapps.com/api/billingAddress"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return companyDetailsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //
  //fetch  company details  from server
  static Future<CompanyDetailsModel?> fetchCompanyDetails(int id) async {
    try {
      //var response = await http.get(Uri.parse("baseURL/company?"));
      var response =
          await client.get(Uri.parse("https://codeitapps.com/api/company?"));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return companyDetailsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //add to cart
  static Future addCart(Map data) async {
    try {
      //print(data);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = await client.post(
          //Uri.parse('baseURL/cart'),
          Uri.parse('https://codeitapps.com/api/cart'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(data));
      print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Item has been add successfully");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //fetch  cart item  from server
  static Future<List<CartModel>?> fetchCart() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = await client
          .get(Uri.parse("https://codeitapps.com/api/cart"), headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return cartModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }

  //place to oder
  static Future PlaceOder(Map data) async {
    try {
      //print(data);
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = await client.post(
          //Uri.parse('baseURL/cart'),
          Uri.parse('https://codeitapps.com/api/oder'),
          headers: {
            'Accept': 'application/json',
            'content-type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(data));
      //print(response.statusCode);
      if (response.statusCode == 200) {
        Get.snackbar("Success", "Your oder has been successfully placed");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
