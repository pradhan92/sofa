import 'package:get/get.dart';
import 'package:sofashoptask1/model/single_product_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class ProductController extends GetxController {
  var product = SingleProductModel(data: []).obs;
  var isLoading = false.obs;

  //get getSingle product
  Future getProduct(int id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchProduct(id);
      if (data != null) {
        product.value = data;
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
