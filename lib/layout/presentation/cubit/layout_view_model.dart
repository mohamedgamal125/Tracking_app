import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/feature/home/presentation/views/home_tab.dart';
import 'package:tracking_app/feature/orders/presentation/views/orders_tab.dart';
import 'package:tracking_app/feature/profile/presentation/views/profile_tab.dart';
import 'package:tracking_app/layout/presentation/cubit/layout_states.dart';

class LayoutViewModel extends Cubit<LayoutStates> {
  LayoutViewModel() : super(LayoutInitialState());

  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    OrdersTab(),
    ProfileTab(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
