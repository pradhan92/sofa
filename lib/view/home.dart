import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sofashoptask1/auth/login.dart';
import 'package:sofashoptask1/controller/company_details_controller.dart';
import 'package:sofashoptask1/controller/single_product.dart';
import 'package:sofashoptask1/controller/special_deal_controller.dart';
import 'package:sofashoptask1/controller/vendor_controller.dart';
import 'package:sofashoptask1/view/cart.dart';
import 'package:sofashoptask1/view/single_product.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name;
  GetUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    GetUser();
  }

  @override
  Widget build(BuildContext context) {
    var vendorController = Get.find<VendorController>();
    var specialDealController = Get.find<SpecialDealController>();
    var CDController = Get.find<CompanyDetailsController>();
    var productController = Get.find<ProductController>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: name != null ? Text("welcome $name") : Text("welcome Guest"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => const CartView());
                },
                icon: const Icon(Icons.shopping_cart)),
            IconButton(
                onPressed: (() async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('token');
                  preferences.remove('name');
                  Get.offAll(() => const LoginView());
                }),
                icon: const Icon(Icons.logout_outlined)),
          ],
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Image.network(
          //       'https://cdn.pixabay.com/photo/2018/03/07/22/44/cock-3207342__480.png',
          //       fit: BoxFit.contain,
          //       height: 32,
          //     ),
          //     Container(
          //         padding: const EdgeInsets.all(8.0),
          //         child: const Text(
          //           'Chicken Valley',
          //           style:
          //               TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
          //         ))
          //   ],
          // ),
        ),
        body: Obx(
          () {
            if (vendorController.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          height: 240.0, viewportFraction: 1, autoPlay: true),
                      items: vendorController.vendors.value.data!.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: Image.network("${i.featured}",
                                      fit: BoxFit.cover),
                                ),
                                Positioned(
                                    bottom: 0.0,
                                    child: Container(
                                      height: 40,
                                      width: Get.size.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.blueAccent),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("${i.store}"),
                                          Text(
                                              "${i.country},${i.city},${i.street}"),
                                        ],
                                      ),
                                    )),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    //special deals
                    const ListTile(
                      title: Text("Special Deals"),
                      subtitle: Text("Best Quality deals & products"),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            specialDealController.deals.value.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          var product =
                              specialDealController.deals.value.data![index];
                          return InkWell(
                            onTap: () {
                              productController.getProduct(product.id!);
                              Get.to(() => const SingleProductView());
                            },
                            child: Card(
                              child: Stack(children: [
                                SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.network(
                                      "${product.image}",
                                      fit: BoxFit.cover,
                                    )),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "Save % ${product.discountPercent}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                                Positioned(
                                  left: 2,
                                  bottom: 1,
                                  child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "${product.name}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                              ]),
                            ),
                          );
                        }),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
