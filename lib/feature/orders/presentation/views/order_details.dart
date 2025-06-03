import 'package:flutter/material.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/address_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/order_details_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/status_widget.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../domain/entity/order_entity.dart';

class OrderTabDetails extends StatelessWidget {
  const OrderTabDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final order = ModalRoute.of(context)!.settings.arguments as OrderEntity2;
    return Scaffold(
      appBar: AppBar(
        title: Text("Order details"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusWidget(statusEntity: order.statusEntity!),
                  Text(
                    order.id!,
                    style: AppTextStyles.inter600_16,
                  )
                ],
              ),
              SizedBox(height: responsiveHeight(16),),
              AddressWidget(
                  address: AddressEntity(
                      label: order.store!.label,
                      name: order.store!.name,
                      address: order.store!.address,
                      imgUrl: order.store!.imgUrl)),
              SizedBox(height: responsiveHeight(16),),
              AddressWidget(
                  address: AddressEntity(
                      label: order.user!.label,
                      name: order.user!.name,
                      address: order.user!.address,
                      imgUrl: order.user!.imgUrl)),
              SizedBox(height: responsiveHeight(24),),

              Text("Order Details "),

              Column(


                children: [
                  OrderDetailsWidget(entity: OrderDetailsEntity(name: "Red roses,15 Pink Rose Bouquet", price: "600EGP", imgUrl: "", amount: "2"))
                  ,OrderDetailsWidget(entity: OrderDetailsEntity(name: "Red roses,15 Pink Rose Bouquet", price: "600EGP", imgUrl: "", amount: "2"))
                ],
              ),



              SizedBox(height: responsiveHeight(24),),

              details("Total", "3000"),
              SizedBox(height: responsiveHeight(24),),

              details("Payment method", "Cash on delivery")
            ],
          ),
        ),
      ),
    );
  }

  Widget details(String txt, String val) {
    return Card(
      color: AppColors.whiteColor,
      elevation: 1.5,
      // make sure the Card's child knows it can be as wide as its parent:
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Text(
                txt,
                style: AppTextStyles.inter500_16,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
            // The value text
            Text(
              val,
              style: AppTextStyles.inter500_14.copyWith(color: AppColors.greyColor),
              // overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

}
