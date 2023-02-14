import 'package:get/get.dart';
import 'package:sofashoptask1/model/special_deal_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class SpecialDealController extends GetxController {
  var deals = SpecialDealModel(data: []).obs;
  var isLoading = false.obs;

  //get Vendors list
  Future getSpecialDeals() async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchSpecialDeal();
      if (data != null) {
        deals.value = data;
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
    getSpecialDeals();
  }
}
