import 'package:get/get.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class BillingAddressController extends GetxController {
  var address = [].obs;
  var isLoading = false.obs;

  Future getAddress(int id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchAddress(id);
      if (data != null) {
        address.value = data as List;
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
