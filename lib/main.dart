import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sofashoptask1/auth/splash.dart';
import 'package:sofashoptask1/binding/controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ControllerBinding(),
      home: const SplashScreen(),
    );
  }
}
