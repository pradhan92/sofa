import 'package:get/get.dart';
import 'package:sofashoptask1/model/single_vendor_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class SingleVendorController extends GetxController {
  var vendor = SingleVendorModel().obs;
  var isLoading = false.obs;

  //get getSingleVendor
  Future getSingleVendor(int id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchSingleVendor(id);
      if (data != null) {
        vendor.value = data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
