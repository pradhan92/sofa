import 'package:get/get.dart';
import 'package:sofashoptask1/model/company_details_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class CompanyDetailsController extends GetxController {
  var company = CompanyDetailsModel().obs;
  var isLoading = false.obs;

  //get getSingleVendor
  Future getSingleVendor(int id) async {
    try {
      isLoading(true);
      var data = await RemoteService.fetchCompanyDetails(id);
      if (data != null) {
        company.value = data;
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
