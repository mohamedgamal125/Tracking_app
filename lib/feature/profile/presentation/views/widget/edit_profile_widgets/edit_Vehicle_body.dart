import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../apply/presentation/cubits/apply_view_model/apply_states.dart';
import '../../../../../apply/presentation/cubits/apply_view_model/apply_view_model.dart';
import '../../../../../apply/presentation/view/widgets/vehicle_type_drop_down_widget.dart';
import '../../../../domain/entity/profile_response_entity.dart';
import '../../../cubit/edite_vehicle_cubit/edit_vehicle_view_model.dart';

class EditVehicleBody extends StatefulWidget {
  const EditVehicleBody({
    super.key,
    required this.editVehicleViewModel,
    required this.userData,
  });

  final EditVehicleViewModel editVehicleViewModel;

  final DriverEntity userData;

  @override
  State<EditVehicleBody> createState() => _EditVehicleBodyState();
}

class _EditVehicleBodyState extends State<EditVehicleBody> {
  String? vehicleType;
  AutovalidateMode validateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    vehicleType = widget.userData.vehicleType;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: validateMode,
          child: Column(
            children: [
              SizedBox(height: responsiveHeight(24)),
              // BlocBuilder<ApplyViewModel, ApplyState>(
              //   builder: (context, state) {
              //     if (state is GetVehiclesLoadingState) {
              //       return const Center(
              //         child: CircularProgressIndicator(
              //             color: AppColors.primaryColor),
              //       );
              //     } else if (state is GetVehiclesSuccessState) {
              //       return VehicleTypeDropdown(
              //         vehicleType: vehicleType,
              //         vehicleData: state.data,
              //         onVehicleTypeSelected: (String? newValue) {
              //           setState(() {
              //             vehicleType = newValue;
              //             log(vehicleType!);
              //           });
              //         },
              //       );
              //     } else {
              //       return Container();
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void checkValidateForTextField() {
    setState(() {
      validateMode = formKey.currentState!.validate()
          ? AutovalidateMode.disabled
          : AutovalidateMode.always;
    });
  }
}
