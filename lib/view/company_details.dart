import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofashoptask1/controller/company_details_controller.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var CDController = Get.find<CompanyDetailsController>();
    return SafeArea(child: Scaffold(body: Obx((() {
      if (CDController.isLoading.value == true) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else {
        return SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const ListTile(
                  title: Text(
                "Company Details",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: Get.size.height,
                width: Get.size.width,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('{CompanyDetails.id}'),
                    const Text('{CompanyDetails.name}'),
                    const Text('{CompanyDetails.address_one}'),
                    const Text('{CompanyDetails.address_two}'),
                    const Text('{CompanyDetails.facebook}'),
                    const Text('{CompanyDetails.instagram}'),
                    const Text('{CompanyDetails.youtube}'),
                    const Text('{CompanyDetails.logo}'),
                    const Text('{CompanyDetails.delivery_charge}'),
                    const Text('{CompanyDetails.sales_commission_percent}'),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }))));
  }
}
