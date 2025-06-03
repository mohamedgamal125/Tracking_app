import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/app_icons.dart';

import '../../../../../core/utils/app_assets.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
    required this.imageFile,
    required this.onPressed,
    this.isImageUploaded = false,
    this.imagePath,
  });
  final File? imageFile;
  final void Function()? onPressed;
  final bool isImageUploaded;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightPinkColor,
            radius: 50,
            backgroundImage:
                imageFile != null
                    ? FileImage(imageFile!)
                    : isImageUploaded
                    ? NetworkImage(imagePath!)
                    : AssetImage(ImageAssets.profileImage),
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: CircleAvatar(
              backgroundColor: AppColors.lightPinkColor,
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(AppIcons.cameraIcon, size: 24,color: AppColors.greyDarkColor,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
