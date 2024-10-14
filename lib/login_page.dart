import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_penyewa.dart'; // Import the new file we'll create
import 'whatsapp_service.dart'; // Import the WhatsAppService

class LoginPageController extends GetxController {
  void navigateToLoginPenyewa() {
    Get.to(() => LoginPenyewa());
  }

  // Add a method to open WhatsApp chat
  void openWhatsAppSupport() {
    // Replace this with your support phone number
    const String supportPhoneNumber = '+6282172791631';
    WhatsAppService.openWhatsAppChat(supportPhoneNumber);
  }
}

class LoginPage extends StatelessWidget {
  final LoginPageController controller = Get.put(LoginPageController());

   LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Get.back(), // Changed to Get.back()
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Radar Kos',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Login sebagai',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.green),
                title: const Text('Penyewa'),
                onTap: controller.navigateToLoginPenyewa,
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: 'Need Help? '),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: controller.openWhatsAppSupport, // Remove const here
                        child: const Text(
                          'Click Here',
                          style: TextStyle(
                            color: Colors.green,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
