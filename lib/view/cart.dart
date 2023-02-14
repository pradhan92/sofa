import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofashoptask1/controller/cart_controller.dart';
import 'package:sofashoptask1/view/checkoutview.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.find<CartController>();
    cartController.getCarts();
    return SafeArea(child: Scaffold(body: Obx((() {
      if (cartController.isLoading.value == true) {
        return Center(child: const CircularProgressIndicator.adaptive());
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cartController.carts.length,
                  itemBuilder: (BuildContext context, int index) {
                    var vendor = cartController.carts[index];
                    return Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "${vendor.vendorName} (${vendor.totalQuantity})"),
                            Text(
                              "Bill Amount:RS.${vendor.billAmount}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            ListView.builder(
                                itemCount: vendor.products.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, int index) {
                                  var product = vendor.products[index];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${product.productName} ${product.qty} x ${product.sellingPrice} = ${product.amount}"),
                                  );
                                }),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: (() {
                                      Get.to(() => CheckOutView(cart: vendor));
                                    }),
                                    child: const Text("CheckOut")),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        );
      }
    }))));
  }
}
