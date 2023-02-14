import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sofashoptask1/model/cart_model.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class CheckOutView extends StatefulWidget {
  final CartModel cart;
  CheckOutView({Key? key, required this.cart}) : super(key: key);

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController notes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
      child: Form(
        key: key,
        child: Column(
          children: [
            Text("${widget.cart.vendorName}"),
            TextFormField(
              controller: notes,
              decoration: InputDecoration(hintText: 'Notes'),
            ),
            ElevatedButton(
              onPressed: () {
                Map data = {
                  "vendor_id": widget.cart.products![0].vendorId,
                  // "default_address_id":
                  "default_address_id": 16,
                  "total": int.parse(widget.cart.billAmount.toString()) + 50,
                  "delivery_charge": 50,
                  "sales_comission_percent": 10,
                  "grand_total": 170,
                  "status": "pending",
                  "delivery_date_and_time": "as soon as possible",
                  "payment_option_id": 4,
                  "special_instruction": notes.text,
                  "products": widget.cart.products!.map((e) {
                    return {
                      "product_id": e.productId,
                      "qty": e.qty,
                      "amount": e.sellingPrice,
                      "notes": e.notes,
                    };
                  }).toList()
                };
                //print(data);
                RemoteService.PlaceOder(data);
              },
              child: const Text("Place Oder"),
            ),
          ],
        ),
      ),
    )));
  }
}
