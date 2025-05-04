import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

class CountryDropdown extends StatelessWidget {
  final List countries;
  final String? selectedCountry;
  final Function(String?) onCountrySelected;

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
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedCountry,
          hint: Text('Select a country'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackColor,
            size: 30,
          ),
          items: countries.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item['name'],
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
