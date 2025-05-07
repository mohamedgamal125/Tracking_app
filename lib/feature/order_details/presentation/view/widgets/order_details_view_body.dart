import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/address_section.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_card.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_step_widget.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_section.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_status_widget.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key});

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStepWidget(
              stepCount: 5,
              currentStep: index,
            ),
            SizedBox(height: responsiveHeight(24)),
            OrderStatusWidget(statusList: statusList, index: index),
            SizedBox(height: responsiveHeight(16)),
            AddressSection(
              sectionTitle: 'Pickup address',
              name: 'Flowerly store',
              address: '20th st, Sheikh Zayed, Giza ',
              // image: ,
            ),
            SizedBox(
              height: responsiveHeight(24),
            ),
            AddressSection(
              sectionTitle: 'User address',
              name: 'omar elsayed',
              address: '20th st, Sheikh Zayed, Giza ',
              // !  use this image in case of user only  image: ,
            ),
            SizedBox(height: responsiveHeight(24)),
            Text('Order details', style: AppTextStyles.inter500_18),
            SizedBox(height: responsiveHeight(16)),
            OrderDetailsSection(
                name: 'Red roses,15 Pink Rose Bouquet',
                price: 'EGP 600',
                quantity: '1'),
            SizedBox(
              height: responsiveHeight(8),
            ),
            OrderDetailsSection(
                name: 'Red roses,15 Pink Rose Bouquet',
                price: 'EGP 600',
                quantity: '1'),

                SizedBox(height: responsiveHeight(24)),
                CustomCard(title: 'Total', value: 'EGP 600'),
                SizedBox(height: responsiveHeight(24)),
                CustomCard(title: 'Payment method', value: 'Cash on delivery'),
          ],
        ),
      ),
    );
  }
}
