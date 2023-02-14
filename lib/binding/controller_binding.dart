import 'package:get/get.dart';
import 'package:sofashoptask1/controller/billing_address_controller.dart';
import 'package:sofashoptask1/controller/cart_controller.dart';
import 'package:sofashoptask1/controller/company_details_controller.dart';
import 'package:sofashoptask1/controller/single_product.dart';
import 'package:sofashoptask1/controller/single_vender_controller.dart';
import 'package:sofashoptask1/controller/special_deal_controller.dart';
import 'package:sofashoptask1/controller/vendor_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VendorController());
    Get.put(SpecialDealController());
    Get.put(SingleVendorController());
    Get.put(ProductController());
    Get.put(CompanyDetailsController());
    Get.put(CartController());
    Get.put(BillingAddressController());
  }
}
