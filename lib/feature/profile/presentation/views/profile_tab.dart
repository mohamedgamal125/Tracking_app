import 'package:flutter/material.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/language_widget.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/logout_widget.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/vehicle_information_widget.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/di/injectable_initializer.dart';
import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/router/pages_routes.dart';
import '../cubit/profile_state.dart';
import '../cubit/profile_view_model.dart';
import 'widget/user_information_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProfileViewModel(getIt(), getIt())..doIntent(ProfileClickedIntent()),
      child: SafeArea(
        child: BlocListener<ProfileViewModel, ProfileState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                PagesRoutes.signIn,
                (route) => false,
              );
            } else if (state is ErrorProfileState) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<ProfileViewModel, ProfileState>(
            builder: (context, state) {
              if (state is LoadingProfileState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              } else if (state is ErrorProfileState) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.inter500_16.copyWith(
                      color: AppColors.errorColor,
                    ),
                  ),
                );
              } else if (state is SuccessProfileState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Profile", style: AppTextStyles.inter700_20),
                            IconButton(onPressed: () {

                            }, icon: Icon(Icons.notifications_none_outlined))
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PagesRoutes.editProfile,
                              arguments: state.user!);
                        },
                        child: UserInformationWidget(
                          userData: state.user!,
                        ),
                      ),
                      SizedBox(
                        height: responsiveHeight(8),
                      ),
                      VehicleInformationWidget(
                        userData: state.user!,
                      ),
                      const LanguageWidget(),
                      const LogoutWidget(),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
