import 'package:flutter/material.dart';

class OrderEntity2 {
  final String? orderType;
  final String? id;
  final bool? status;

  final AddressEntity? store;
  final AddressEntity? user;
  final StatusEntity? statusEntity;

  OrderEntity2({
    required this.orderType,
    required this.id,
    required this.status,
    required this.store,
    required this.user,
    required this.statusEntity,
  });
}

class AddressEntity {
  final String ?name;
  final String? address;
  final String ?imgUrl;
  final String? label;

  AddressEntity({required this.label,required this.name, required this.address, required this.imgUrl});
}

class OrderDetailsEntity{
  final String ?name;
  final String? price;
  final String ?imgUrl;
  final String? amount;



  OrderDetailsEntity({required this.name, required this.price, required this.imgUrl,required this.amount});
}
class StatusEntity{

  final String txt;
  final bool flag;
  final Color color ;

  StatusEntity({required this.txt,required this.flag, this.color=Colors.black});
}

