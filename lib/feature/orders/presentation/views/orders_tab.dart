import 'package:flutter/material.dart';
import 'package:tracking_app/core/services/shared_preference_services.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/feature/orders/domain/entity/order_entity.dart';
import 'package:tracking_app/feature/orders/presentation/views/order_details.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/address_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/flower_order_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/status_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/total_status.dart';

import '../../../../core/router/pages_routes.dart';
import '../../../../core/widgets/custom_app_bar.dart';

class OrdersTab extends StatelessWidget {
   OrdersTab({super.key});

  final List<String> userNames = [
    "Mohamed", "Sara", "Omar", "Layla", "Ahmed",
    "Mona", "Khaled", "Nada", "Youssef", "Fatma"
  ];

  final List<String> storeNames = [
    "Rose Garden", "Tulip Hub", "Daisy Bloom", "Lily Lane", "Petal Place",
    "Blossom Point", "Orchid Oasis", "Sunflower Studio", "Floral Haven", "Lavender Loft"
  ];

  final List<String> cities = [
    "Cairo", "Giza", "Alexandria", "Luxor", "Aswan",
    "Zagazig", "Mansoura", "Tanta", "Fayoum", "Ismailia"
  ];

   final List<String> statusTexts = List.generate(10, (index) => index % 2 == 0 ? "Completed" : "Cancelled");


  @override
  Widget build(BuildContext context) {
    final List<OrderEntity2> orders = List.generate(10, (index) {
      final isCompleted = index % 2 == 0;
      return OrderEntity2(
        orderType: "Flowery Order #${index + 1}",
        id: "#@11112$index",
        status: isCompleted,
        store: AddressEntity(
          label: "Pickup Address",
          name: storeNames[index],
          address: "${cities[index]} - Egypt",
          imgUrl: "",
        ),
        user: AddressEntity(
          label: "User Address",
          name: userNames[index],
          address: "${cities[(index + 3) % 10]} - Egypt",
          imgUrl: "",
        ),
        statusEntity: StatusEntity(
          txt: isCompleted ? "Completed" : "Cancelled",
          flag: isCompleted,
        ),
      );
    });

    // Count status totals
    final int completedCount =
        orders.where((order) => order.statusEntity!.txt == "Completed").length;
    final int cancelledCount = orders.length - completedCount;

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
                  total: cancelledCount,
                  statusWidget: StatusWidget(
                    statusEntity:
                    StatusEntity(txt: "Cancelled", flag: false),
                  ),
                ),
                TotalStatus(
                  total: completedCount,
                  statusWidget: StatusWidget(
                    statusEntity:
                    StatusEntity(txt: "Completed", flag: true),
                  ),
                )],
            ),
            ListView.builder(
              itemCount: orders.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return FlowerOrderWidget(
                  onPress: () {
                    Navigator.pushNamed(context, PagesRoutes.orderTabDetails,arguments: orders[index]);
                  },
                  order: orders[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
