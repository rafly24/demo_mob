import 'package:url_launcher/url_launcher.dart';

class WhatsAppService {
  static Future<void> openWhatsAppChat(String phoneNumber) async {
    // Remove any non-digit characters from the phone number
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^\d]+'), '');

    // Construct the WhatsApp URL
    final whatsappUrl = 'https://wa.me/$phoneNumber';

    if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
      await launchUrl(Uri.parse(whatsappUrl));
    } else {
      throw 'Could not launch WhatsApp';
    }
  }
}