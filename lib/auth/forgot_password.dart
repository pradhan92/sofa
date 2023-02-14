import 'package:flutter/material.dart';
import 'package:sofashoptask1/service/remote_service.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    //TextEditingController Password = TextEditingController();

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
                  controller: email,
                  decoration:
                      const InputDecoration(label: Text("Enter your email")),
                  validator: ((value) =>
                      value!.isEmpty ? 'email required' : null),
                  keyboardType: TextInputType.text,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (key.currentState!.validate()) {
                        Map data = {
                          "email": email.text,
                        };
                        RemoteService.forgotpassword(data);
                      }
                    },
                    child: const Text("Sent"))
              ],
            ),
          )),
        ),
      ),
    ));
  }
}
