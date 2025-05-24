import 'package:flutter/material.dart';
import 'package:tracking_app/core/services/shared_preference_services.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/feature/orders/presentation/views/order_details.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/address_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/flower_order_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/status_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/total_status.dart';

import '../../../../core/router/pages_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
        leading: IconButton(
            onPressed: () {
              print(SharedPreferenceServices.getData("token"));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TotalStatus(
                    total: 4,
                    statusWidget: StatusWidget(txt: "Cancelled", flag: false)),
                TotalStatus(
                    total: 100,
                    statusWidget: StatusWidget(txt: "Completed", flag: true)),
              ],
            ),
            // AddressWidget(
            //     imgUrl: "",
            //     name: "Flowery store",
            //     address: "20th st, Sheikh Zayed, Giza ",
            //     label: "Pick up address",
            // ) ,
            // AddressWidget(
            //     imgUrl: "",
            //     name: "Mohamed",
            //     address: "20th st, Sheikh Zayed, Giza ",
            //     label: "user address",
            // )
            FlowerOrderWidget(
                onPress: () {
                  Navigator.pushNamed(context, PagesRoutes.orderTabDetails);
                },
                addressWidget:  AddressWidget(
              imgUrl: "",
              name: "flowery",
              address: "20th st, Sheikh Zayed, Giza ",
              label: "pickup address",
            ), statusWidget: StatusWidget(txt: "Completed", flag: true,color: AppColors.greenColor,))
           , FlowerOrderWidget(
                onPress: () {
                  Navigator.pushNamed(context, PagesRoutes.orderTabDetails);
                },
                addressWidget:  AddressWidget(
              imgUrl: "",
              name: "Mohamed",
              address: "20th st, Sheikh Zayed, Giza ",
              label: "user address",
            ), statusWidget: StatusWidget(txt: "Cancelled", flag: false,color: AppColors.errorColor,))
          ],
        ),
      ),
    );
  }
}
