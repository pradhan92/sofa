import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofashoptask1/auth/login.dart';
import 'package:sofashoptask1/controller/single_product.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class SingleProductView extends StatefulWidget {
  const SingleProductView({Key? key}) : super(key: key);

  @override
  State<SingleProductView> createState() => _SingleProductViewState();
}

class _SingleProductViewState extends State<SingleProductView> {
  int qty = 1;
  TextEditingController note = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (productController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    width: Get.size.width,
                    height: 400,
                    child: Image.network(
                      "${productController.product.value.data![0].image}",
                      fit: BoxFit.cover,
                    )),
                ListTile(
                    title: Text(
                        "${productController.product.value.data![0].name}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "RS.${productController.product.value.data![0].sellingPrice}",
                            style: const TextStyle(fontSize: 20)),
                        Html(
                          data:
                              "${productController.product.value.data![0].description}",
                        ),
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                if (qty <= 1) {
                                  qty = 1;
                                } else {
                                  qty--;
                                }

                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                                size: 40,
                              )),
                          SizedBox(
                            width: 10,
                            child: Text(
                              "$qty",
                              style: const TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          IconButton(
                            onPressed: () {
                              qty++;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          var token = preferences.getString('token');
                          Map data = {
                            // see in api add to cart body
                            "productId":
                                productController.product.value.data![0].id,
                            "vendorId": productController
                                .product.value.data![0].vendorId,
                            "quantity": qty,
                            "sellingPrice": productController
                                .product.value.data![0].sellingPrice,
                            "notes": note.text,
                          };
                          if (token != true) {
                            RemoteService.addCard(data);
                          } else {
                            Get.offAll(() => const LoginView());
                          }
                        },
                        child: const Text("add to card")),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: note,
                    decoration: const InputDecoration(
                      hintText: 'Note',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          );
        }
      }),
    ));
  }
}
