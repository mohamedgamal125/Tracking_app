import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/utils/app_icons.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/edit_profile_widgets/edit_profile_view_body.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../layout/presentation/views/layout_screen.dart';
import '../../data/model/profile_response_dto.dart';
import '../../domain/entity/profile_response_entity.dart';
import '../cubit/edit_profile_cubit/edit_profile_view_model.dart';
import '../cubit/upload_photo_cubit/upload_photo_view_model.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  EditProfileViewModel editProfileViewModel = getIt.get<EditProfileViewModel>();
  UploadPhotoViewModel uploadPhotoViewModel = getIt.get<UploadPhotoViewModel>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    late final DriverEntity userData;

    if (args is DriverDTO) {
      userData = args.toEntity();
    } else if (args is DriverEntity) {
      userData = args;
    } else {
      throw Exception("Invalid argument type for EditProfileView");
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => editProfileViewModel),
        BlocProvider(create: (context) => uploadPhotoViewModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(AppIcons.back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LayoutScreen(initialIndex: 2,),
                ),
              );
            },
          ),
          title: Text(
            AppConstants.editProfile,
            style: AppTextStyles.roboto500_18.copyWith(fontSize: 20),
          ),

        ),
        body: EditProfileViewBody(
          editProfileViewModel: editProfileViewModel,
          uploadPhotoViewModel: uploadPhotoViewModel,
          userData: userData,
        ),
      ),
    );
  }
}
