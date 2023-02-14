import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofashoptask1/auth/login.dart';
import 'package:sofashoptask1/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkAuth() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    //preferences.remove("token");
    print(token);
    if (token != null) {
      Future.delayed(const Duration(seconds: 3), (() {
        Get.offAll(() => const MyHomePage());
      }));
    } else {
      Future.delayed(const Duration(seconds: 3), (() {
        Get.offAll(() => const LoginView());
      }));
    }
  }

  @override
  void initState() {
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Sofa Store"),
      ),
    ));
  }
}
