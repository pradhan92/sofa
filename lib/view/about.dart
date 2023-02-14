import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofashoptask1/controller/company_details_controller.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var companyController = Get.find<CompanyDetailsController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (companyController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: Get.size.width,
                    height: 500,
                    child:
                        Text("${companyController.company.value.data!.name}")),
              ],
            ),
          );
        }
      }),
    ));
  }
}
