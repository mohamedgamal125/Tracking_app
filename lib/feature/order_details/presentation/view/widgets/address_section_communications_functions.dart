part of 'communication_widget.dart';

Future<void> _launchWhatsApp({
  required String phoneNumber,
  String message = '',
}) async {
  final Uri whatsappUri =
      Uri.parse("whatsapp://send?phone=$phoneNumber&text=$message");

  if (await canLaunchUrl(whatsappUri)) {
    await launchUrl(whatsappUri);
  } else {
    await EasyLoading.showError('Could not launch WhatsApp');
  }
}

Future<bool?> _callPhoneNumber(String phoneNumber) async {
  final sanitizedNumber = phoneNumber.replaceAll(' ', '');
  return await FlutterPhoneDirectCaller.callNumber(sanitizedNumber);
}
