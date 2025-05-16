import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/feature/profile/domain/entity/profile_response_entity.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/pick_image_widget.dart';

import '../../../cubit/upload_photo_cubit/upload_photo_state.dart';
import '../../../cubit/upload_photo_cubit/upload_photo_view_model.dart';


class EditProfileImageSection extends StatelessWidget {
  final DriverEntity userData;
  final File? imageFile;
  final UploadPhotoViewModel uploadPhotoViewModel;
  final ValueChanged<File> onImageSelected;

  const EditProfileImageSection({
    Key? key,
    required this.userData,
    required this.imageFile,
    required this.uploadPhotoViewModel,
    required this.onImageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadPhotoViewModel, UploadPhotoState>(
      bloc: uploadPhotoViewModel,
      listener: (context, state) {
        switch (state) {
          case UploadPhotoLoadingState():
            EasyLoading.show();
          case UploadPhotoSuccessState():
            EasyLoading.dismiss();
            EasyLoading.showSuccess("Upload photo successfully");
          case UploadPhotoErrorState():
            EasyLoading.dismiss();
            EasyLoading.showError(state.message);
          default:
        }
      },
      child: PickImageWidget(
        isImageUploaded: userData.photo != null,
        imagePath: userData.photo,
        imageFile: imageFile,
        onPressed: () async {
          final pickedFile = await _pickImage();
          if (pickedFile != null) {
            onImageSelected(pickedFile);
            uploadPhotoViewModel.uploadPhoto(pickedFile);
          }
        },
      ),
    );
  }

  static Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
