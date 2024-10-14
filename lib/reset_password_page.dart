import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'new_password_page.dart';

class ResetPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void sendVerificationCode() {
    if (formKey.currentState!.validate()) {
      // In a real app, you would send the verification code here
      Get.defaultDialog(
        title: 'Verification Code Sent',
        content: Text(
            'We have sent a verification code to ${emailController.text}. Please check your email.'),
        confirm: ElevatedButton(
          onPressed: () {
            Get.back();
            Get.to(() => NewPasswordPage(email: emailController.text));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
          child: Text('OK'),
        ),
      );
    }
  }
}

class ResetPasswordPage extends GetView<ResetPasswordController> {
  ResetPasswordPage({Key? key}) : super(key: key) {
    Get.put(ResetPasswordController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text('Reset Password', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter your email to reset your password',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.sendVerificationCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Send Verification Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}