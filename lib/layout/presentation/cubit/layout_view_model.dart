import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/feature/home/presentation/views/home_tab.dart';
import 'package:tracking_app/feature/orders/presentation/views/orders_tab.dart';
import 'package:tracking_app/feature/profile/presentation/views/profile_tab.dart';
import 'package:tracking_app/layout/presentation/cubit/layout_states.dart';

class LayoutViewModel extends Cubit<LayoutStates> {
  LayoutViewModel(this.currentIndex) : super(LayoutInitialState());

  int currentIndex = 0;
  final List<Widget> tabs = [
    HomeTab(),
    const OrdersTab(),
    ProfileTab(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(LayoutChangeBottomNavState());
  }
}
