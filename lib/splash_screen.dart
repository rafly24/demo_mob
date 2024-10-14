import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart'; // Make sure you create this file

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => LoginPage()); // Removed const here
    });
  }
}

class SplashScreen extends StatelessWidget {
  final SplashScreenController controller = Get.put(SplashScreenController());

  SplashScreen({Key? key}) : super(key: key); // Removed the const keyword

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/images/R K, alphabet.png', // Ensure this file exists in your project
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
