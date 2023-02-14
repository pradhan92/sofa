import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class OrderPlaceAddress extends StatelessWidget {
  const OrderPlaceAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Form(
            key: key,
            child: Column(
              children: [
                TextFormField(
                  controller: name,
                  decoration:
                      const InputDecoration(label: Text("Enter your name")),
                  validator: ((value) =>
                      value!.isEmpty ? 'name required' : null),
                  keyboardType: TextInputType.text,
                ),
                TextFormField(
                  controller: email,
                  decoration:
                      const InputDecoration(label: Text("Enter your email")),
                  validator: ((value) =>
                      value!.isEmpty ? 'email required' : null),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  controller: phone,
                  decoration: const InputDecoration(
                      label: Text("Enter your phone Number")),
                  validator: ((value) =>
                      value!.isEmpty ? 'phone required' : null),
                  keyboardType: TextInputType.phone,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        Map data = {
                          "name": name.text,
                          "email": email.text,
                          "phone": phone.text,
                        };
                        RemoteService.address(data);
                      }
                    },
                    child: const Text("Register"))
              ],
            ),
          )),
        ),
      ),
    ));
  }
}
