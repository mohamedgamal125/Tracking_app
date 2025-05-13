import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/address_section.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_card.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_step_widget.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_section.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_status_widget.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key, required this.order});
  final OrderEntity order;

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  int index = 0;
  List<String> statusList = [
    'Accepted',
    'Picked',
    ' Out for delivery',
    'Arrived',
    'Delivered'
  ];
  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select((StatesCubit cubit) => cubit.state);
    log(widget.order.createdAt.toString() +
        "+++++++++++++++++++++++++++++++++");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔒 Fixed (non-scrollable)
          CustomStepWidget(
            stepCount: 5,
            currentStep: currentIndex,
          ),
          SizedBox(height: responsiveHeight(24)),
          BlocBuilder<StatesCubit, int>(
            builder: (context, index) {
              return OrderStatusWidget(
                  date: widget.order.createdAt ?? '',
                  statusList: statusList,
                  index: index,
                  orderNumber: widget.order.orderNumber ?? '');
            },
          ),
          SizedBox(height: responsiveHeight(16)),

          // 🔓 Scrollable section starts here
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddressSection(
                    sectionTitle: 'Pickup address',
                    name: widget.order.store?.name ?? '',
                    address: widget.order.store?.address ?? '',
                    phone: widget.order.store!.phoneNumber ?? '',
                  ),
                  SizedBox(height: responsiveHeight(24)),
                  AddressSection(
                    sectionTitle: 'User address',
                    name:
                        '${widget.order.user?.firstName ?? ''} ${widget.order.user?.lastName ?? ''}',
                    address: widget.order.shippingAddress?.street ?? '',
                    phone: widget.order.shippingAddress?.phone ?? '',
                  ),
                  SizedBox(height: responsiveHeight(24)),
                  Text('Order details', style: AppTextStyles.inter500_18),
                  // SizedBox(height: responsiveHeight(16)),
                  // OrderDetailsSection(
                  //     name: 'Red roses,15 Pink Rose Bouquet',
                  //     price: 'EGP 600',
                  //     quantity: '1'),
                  // SizedBox(height: responsiveHeight(8)),
                  // OrderDetailsSection(
                  //     name: 'Red roses,15 Pink Rose Bouquet',
                  //     price: 'EGP 600',
                  //     quantity: '1'),
                  SizedBox(height: responsiveHeight(24)),
                  SizedBox(
                    height: responsiveHeight(150),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.order.orderItems?.length ?? 0,
                        itemBuilder: (context, index) {
                          return OrderDetailsSection(
                              image: widget
                                  .order.orderItems?[index].product?.imgCover ,
                              name: widget.order.orderItems?[index].product
                                      ?.title ??
                                  '',
                              price: widget.order.orderItems?[index].price
                                      .toString() ??
                                  '',
                              quantity: widget.order.orderItems?[index].quantity
                                      .toString() ??
                                  '');
                        }),
                  ),
                  SizedBox(height: responsiveHeight(16)),
                  CustomCard(
                      title: 'Total', value: 'EGP ${widget.order.totalPrice}'),
                  SizedBox(height: responsiveHeight(24)),
                  CustomCard(
                      title: 'Payment method',
                      value: '${widget.order.paymentType}'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
