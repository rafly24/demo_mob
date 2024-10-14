import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reset_password_page.dart';

class VerificationController extends GetxController {
  final String email;
  final List<TextEditingController> codeControllers =
      List.generate(6, (index) => TextEditingController());

  VerificationController(this.email);

  void verifyCode() {
    String code = codeControllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      // In a real app, you would verify the code with your backend here
      // For now, we'll just navigate to the ResetPasswordPage
      Get.off(() => ResetPasswordPage());
    } else {
      Get.snackbar('Error', 'Please enter a valid 6-digit code');
    }
  }
}

class VerificationPage extends GetView<VerificationController> {
  final String email;

  VerificationPage({Key? key, required this.email}) : super(key: key) {
    Get.put(VerificationController(email));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text('Verify Email', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Verify Your Email',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter the 6-digit code sent to',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: 40,
                  child: TextField(
                    controller: controller.codeControllers[index],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        FocusScope.of(context).nextFocus();
                      }
                      if (index == 5 && value.isNotEmpty) {
                        controller.verifyCode();
                      }
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.verifyCode,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Verify', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  // Implement resend code logic here
                  Get.snackbar(
                      'Code Resent', 'A new code has been sent to your email',
                      backgroundColor: Colors.green, colorText: Colors.white);
                },
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}