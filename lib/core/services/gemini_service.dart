import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@injectable
class GeminiService {
  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env['GEMINI_API'] ?? '',

  );
  // Future<List> validateNationalIdCard(
  //   File image, String selectedCountry) async {
  //   final imageBytes = await image.readAsBytes();
  //   List responseList = [];
  //   try {
  //     final content = [
  //       Content.multi([
  //         TextPart(_buildPrompt(selectedCountry)),
  //         DataPart('image/jpeg', imageBytes),
  //       ]),
  //     ];
  //
  //     final response = await model.generateContent(content);
  //     final responseText = response.text ?? "No response";
  //
  //     // Simple parsing (based on our fixed format)
  //     final validMatch =
  //         RegExp(r'Valid:\s*(true|false|unclear)', caseSensitive: false)
  //             .firstMatch(responseText);
  //     final idMatch =
  //         RegExp(r'ID:\s*([0-9]{5,}|Not found|Unclear)', caseSensitive: false)
  //             .firstMatch(responseText);
  //
  //     responseList = [
  //       validMatch?.group(1) ?? "Unknown",
  //       idMatch?.group(1) ?? "Unknown"
  //     ];
  //     // validMatch?.group(1) ?? "Unknown",
  //     // idMatch?.group(1) ?? "Unknown"
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  //   return responseList;
  // }

  String _buildNationalIDPrompt(String country) {
    return '''
You are a vision AI trained to verify National ID cards from any country.

The user uploaded a photo of an official National ID card issued in: $country.

---

### Your Tasks:
1. Determine if the image shows a valid National ID card from $country.  
   🚫 Reject if the image is of a passport, driving license, student ID, or other unrelated document.

2. If valid, extract the national ID number – a unique identifier printed clearly on the card (digits or alphanumeric, based on the country).

---

### Response Format (exactly this structure):
• Country: $country  
• Valid: true / false / unclear  
• ID Number: <id-number> / Not found / Unclear  

---

### Validation Criteria:
Only return "Valid: true" if the image contains:
- The words “National ID”, “Identity Card” or the local-language equivalent used in $country
- An official photo of the cardholder
- A national ID number (e.g., 14-digit in Egypt, Aadhaar in India, SSN in US, etc.)
- Other personal data (e.g., name, birthdate)
- Government symbols or security features (e.g., seal, emblem, QR, barcode)

---

### Handle edge cases:
- ❌ If the document is NOT a national ID →  
  • Valid: false  
  • ID Number: Not applicable

- 🔍 If the image is blurry, dark, cropped →  
  • Valid: unclear  
  • ID Number: Unclear

- ✅ If it is valid but the ID number is not visible →  
  • Valid: true  
  • ID Number: Not found

⚠️ Do not explain or justify. Only return the exact 3-line format above.
''';
  }

  Future<List<String>> validateNationalIdCard(
      File image, String selectedCountry) async {
    final imageBytes = await image.readAsBytes();
    try {
      final content = [
        Content.multi([
          TextPart(_buildNationalIDPrompt(selectedCountry)),
          DataPart('image/jpeg', imageBytes),
        ]),
      ];

      final response = await model.generateContent(content);
      final responseText = response.text ?? "No response";

      final validMatch =
          RegExp(r'Valid:\s*(true|false|unclear)', caseSensitive: false)
              .firstMatch(responseText);
      final idMatch = RegExp(
              r'ID(?: Number)?:\s*([a-zA-Z0-9\-]{5,}|Not found|Unclear|Not applicable)',
              caseSensitive: false)
          .firstMatch(responseText);

      return [
        validMatch?.group(1)?.toLowerCase() ?? "unknown",
        idMatch?.group(1) ?? "unknown",
      ];
    } catch (e) {
      print('Error during ID card validation: $e');
      return ["error", "error"];
    }
  }

  Future<String> validateVehicleLicense(
      File image, String selectedCountry) async {
    final imageBytes = await image.readAsBytes();
    try {
      final content = [
        Content.multi([
          TextPart(_buildDrivingLicensePrompt(selectedCountry)),
          DataPart('image/jpeg', imageBytes),
        ]),
      ];

      final response = await model.generateContent(content);
      final responseText = response.text ?? "No response";

      final validMatch =
          RegExp(r'Valid:\s*(true|false|unclear)', caseSensitive: false)
              .firstMatch(responseText);
      return validMatch?.group(1)?.toLowerCase() ?? "unknown";
    } catch (e) {
      print('Error during vehicle license validation: $e');
      return "error";
    }
  }

  String _buildDrivingLicensePrompt(String country) {
    return '''
You are a vision AI model trained to analyze official documents and distinguish between different types.

The user uploaded an image claiming it is a driving license from the country: $country.

### Your Tasks:
1. Identify whether the image shows a government-issued DRIVING LICENSE from $country.  
   🚫 DO NOT accept national ID cards, passports, residence cards, or any unrelated document.

2. If it is a valid license, extract the driving license number — a unique identifier typically found near the top/front of the card.

---

### Response Format (STRICTLY):
• Country: $country  
• Valid: true / false / unclear  
• License Number: <exact-license-number> / Not found / Unclear  

---

### Validation Checklist:
Only mark "Valid: true" if ALL the following are present:
- The words "Driving License" or official local equivalent in $country's language
- A photo of the license holder
- A license number (numbers or alphanumeric code)
- Issue and expiry dates
- Official seals, holograms, QR codes, or government symbols
- License categories or driving permissions

---

### Handle edge cases as follows:
- If the document is not a driving license (e.g., national ID card, passport, etc.) →  
  • Valid: false  
  • License Number: Not applicable

- If the image is blurry, cropped, or too dark →  
  • Valid: unclear  
  • License Number: Unclear

- If the document is a license but the number is not visible →  
  • Valid: true  
  • License Number: Not found

⚠️ Do not return explanations. Only respond in the required format.
''';
  }

  String generateNationalIdMessage(List<String> result, String country) {
    final isValid = result[0].toLowerCase();
    final id = result[1];

    switch (isValid) {
      case 'true':
        return '✅ National ID card for $country is valid.\n🆔 ID Number: ${id == "Not found" ? "Not visible" : id}true';
      case 'false':
        return '❌ The uploaded image is not a valid national ID card for $country.';
      case 'unclear':
        return '⚠️ Unable to verify the national ID card for $country due to poor image quality. Please upload a clearer photo.';
      default:
        return '❓ Unable to determine the result for the national ID. Please try again.';
    }
  }

  String generateDrivingLicenseMessage(String isValid, String country) {
    switch (isValid.toLowerCase()) {
      case 'true':
        return '✅ The driving license from $country is valid.true';
      case 'false':
        return '❌ The uploaded image is not a valid driving license from $country.';
      case 'unclear':
        return '⚠️ Could not clearly validate the driving license from $country. Please try uploading a better image.';
      default:
        return '❓ Could not determine the result for the driving license. Please try again.';
    }
  }
}
