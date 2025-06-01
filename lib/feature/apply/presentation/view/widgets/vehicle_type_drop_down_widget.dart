import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

class VehicleTypeDropdown extends StatelessWidget {
  final String? vehicleType;
  final String? hint;
  final Function(String?) onVehicleTypeSelected;
  final List<dynamic>? vehicleData;
  const VehicleTypeDropdown({
    Key? key,
    required this.vehicleType,
    required this.onVehicleTypeSelected,
    this.vehicleData,
    this.hint,
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
          value: vehicleType,
          hint: Text(hint ?? 'Select a Vehicle Type'),
          //Text('Select a Vehicle Type'),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.blackColor,
            size: 30,
          ),
          items: vehicleData?.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item.id,
              child: Row(
                children: [
                  Text(item.type ?? ''),
                ],
              ),
            );
          }).toList(),
          onChanged: onVehicleTypeSelected,
        ),
      ),
    );
  }
}
