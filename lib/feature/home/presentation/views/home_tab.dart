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
                          final store = order.store;
                          final user = order.user;

                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 12,
                                  spreadRadius: 1,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Flower Order',
                                    style: AppTextStyles.iMFeel400_20),
                                const SizedBox(height: 8),
                                Text('Pickup Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 12,
                                        spreadRadius: 1,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: store?.image != null &&
                                                store!.image!.isNotEmpty
                                            ? NetworkImage(store.image!)
                                            : null,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                      SizedBox(width: responsiveWidth(8)),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(store?.name ?? ''),
                                          Row(
                                            children: [
                                              const Icon(
                                                  Icons.location_on_outlined,
                                                  size: 16),
                                              Text(store?.address ?? ''),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text('User Address',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 12,
                                        spreadRadius: 1,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: user?.photo != null &&
                                                user!.photo!.isNotEmpty
                                            ? NetworkImage(user.photo!)
                                            : null,
                                        backgroundColor: Colors.grey[300],
                                      ),
                                      SizedBox(width: responsiveWidth(8)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${user?.firstName ?? ''} ${user?.lastName ?? ''}'),
                                            if (order.shippingAddress != null)
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 16),
                                                  SizedBox(width: 4),
                                                  Expanded(
                                                    child: Text(
                                                      order.shippingAddress
                                                              ?.street ??
                                                          '',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text('EGP ${order.totalPrice}'),
                                    SizedBox(
                                      width: responsiveWidth(16),
                                    ),
                                    SizedBox(
                                      height: responsiveHeight(36),
                                      width: responsiveWidth(112),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.whiteColor,
                                            side: BorderSide(
                                                color: AppColors.primaryColor),
                                          ),
                                          onPressed: () {
                                            orders.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Text('Reject')),
                                    ),
                                    SizedBox(
                                      width: responsiveWidth(8),
                                    ),
                                    SizedBox(
                                      height: responsiveHeight(36),
                                      width: responsiveWidth(112),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('Accept')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
