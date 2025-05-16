import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/layout/presentation/cubit/layout_states.dart';
import 'package:tracking_app/layout/presentation/cubit/layout_view_model.dart';

import '../../../core/utils/app_icons.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  LayoutViewModel viewModel = LayoutViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<LayoutViewModel, LayoutStates>(
        bloc: viewModel,
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: viewModel.tabs[viewModel.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: viewModel.currentIndex,
              onTap: (value) {
                viewModel.changeBottomNav(value);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.homeIcon),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.orderIcon),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: Icon(AppIcons.profileIcon),
                  label: 'Profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}