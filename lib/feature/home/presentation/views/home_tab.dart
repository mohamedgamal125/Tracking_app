import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/home/presentation/cubits/home_states.dart';
import 'package:tracking_app/feature/home/presentation/cubits/home_view_model.dart';
import 'package:tracking_app/feature/home/presentation/views/widgets/order_card.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeViewModel homeViewModel = getIt.get<HomeViewModel>();

  @override
  void initState() {
    homeViewModel.getPendingOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeViewModel,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(16),
          vertical: responsiveHeight(20),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Flowery rider',
                style: AppTextStyles.iMFeel400_20.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: responsiveHeight(16)),
              Expanded(
                child: BlocConsumer<HomeViewModel, HomeState>(
                  listener: (context, state) {
                    if (state is PendingOrdersErrorState) {
                      EasyLoading.showError(state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is PendingOrdersLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is PendingOrdersSuccessState) {
                      return ListView.builder(
                        itemCount: state.pendingOrders?.length ?? 0,
                        itemBuilder: (context, index) {
                          List<OrderEntity> orders = state.pendingOrders ?? [];
                          final order = orders[index];
                          return OrderCard(
                            order: order,
                            onReject: () {
                              orders.removeAt(index);
                              setState(() {});
                            },
                            onAccept: () {},
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available.'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
