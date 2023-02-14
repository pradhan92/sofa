import 'package:get/get.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class CartController extends GetxController {
  var carts = [].obs;
  var isLoading = false.obs;

  Future getCarts() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchCart();
      if (data != null) {
        carts.value = data;
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
