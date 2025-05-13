import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

class CountryDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> countries;
  final Map<String, dynamic>? selectedCountry;
  final Function(Map<String, dynamic>?) onCountrySelected;

  const CountryDropdown({
    Key? key,
    required this.countries,
    required this.selectedCountry,
    required this.onCountrySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Map<String, dynamic>>(
          isExpanded: true,
          value: selectedCountry,
          hint: const Text('Select a country'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackColor,
            size: 30,
          ),
          items: countries.map<DropdownMenuItem<Map<String, dynamic>>>((item) {
            return DropdownMenuItem<Map<String, dynamic>>(
              value: item,
              child: Row(
                children: [
                  Text(item['flag'], style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: 10),
                  Text(item['name']),
                ],
              ),
            );
          }).toList(),
          onChanged: onCountrySelected,
        ),
      ),
    );
  }
}
