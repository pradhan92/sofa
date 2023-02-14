import 'package:get/get.dart';
import 'package:sofashoptask1/model/vendors_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class VendorController extends GetxController {
  var vendors = VendorsModel(data: []).obs;
  var isLoading = false.obs;

  //get Vendors list
  Future getVendorList() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchVendors();
      if (data != null) {
        vendors.value = data;
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getVendorList();
  }
}
