import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofashoptask1/service/remote_service.dart';
import 'package:sofashoptask1/view/home.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

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
                TextFormField(
                  controller: password,
                  decoration:
                      const InputDecoration(label: Text("Enter your password")),
                  validator: ((value) =>
                      value!.isEmpty ? 'Password required' : null),
                  keyboardType: TextInputType.emailAddress,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      Map data = {
                        "email": email.text,
                        "password": password.text,
                      };
                      RemoteService.login(data);
                    }
                  },
                  child: const Text("Login"),
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.offAll(() => MyHomePage());
                    },
                    child: Text("skip")),
              ],
            ),
          )),
        ),
      ),
    ));
  }
}
