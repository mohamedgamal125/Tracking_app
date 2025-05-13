import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';

part 'pending_orders_response_dto.g.dart';

@JsonSerializable()
class PendingOrdersResponseDTO {
  final String? message;
  final Metadata? metadata;
  final List<Order>? orders;

  PendingOrdersResponseDTO({
    this.message,
    this.metadata,
    this.orders,
  });

  factory PendingOrdersResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PendingOrdersResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PendingOrdersResponseDTOToJson(this);

  PendingOrdersResponseEntity toEntity() {
    return PendingOrdersResponseEntity(
      message: message,
      orders: orders?.map((order) => order.toEntity()).toList(),
    );
  }
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;

  Metadata({
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Order {
  @JsonKey(name: '_id')
  final String? id;
  final User? user;
  final List<OrderItem>? orderItems;
  final int? totalPrice;
  final ShippingAddress? shippingAddress;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final int? v;
  final Store? store;

  Order({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
    this.shippingAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  OrderEntity toEntity() {
    return OrderEntity(
      id: id,
      user: user?.toEntity(),
      orderItems: orderItems?.map((item) => item.toEntity()).toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
      v: v,
      store: store?.toEntity(),
      shippingAddress: shippingAddress?.toEntity(),
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? passwordResetCode;
  final DateTime? passwordResetExpires;
  final bool? resetCodeVerified;
  final DateTime? passwordChangedAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UserEntity toEntity() {
    return UserEntity(
      lastName: lastName,
      firstName: firstName,
      gender: gender,
      phone: phone,
      email: email,
      id: id,
      photo: photo,
      passwordResetCode: passwordResetCode,
      passwordResetExpires: passwordResetExpires,
      resetCodeVerified: resetCodeVerified,
      passwordChangedAt: passwordChangedAt,
    );
  }
}

@JsonSerializable()
class OrderItem {
  final Product? product;
  final int? price;
  final int? quantity;
  @JsonKey(name: '_id')
  final String? id;

  OrderItem({this.product, this.price, this.quantity, this.id});

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemToJson(this);
  OrderItemEntity toEntity() {
    return OrderItemEntity(
      product: product?.toEntity(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}

@JsonSerializable()
class ShippingAddress {
  final String? street;
  final String? city;
  final String? phone;
  final String? lat;
  final String? long;

  ShippingAddress({
    this.street,
    this.city,
    this.phone,
    this.lat,
    this.long,
  });

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      street: street,
      city: city,
      phone: phone,
      lat: lat,
      long: long,
    );
  }
}

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? discount;
  final int? sold;
  final double? rateAvg;
  final int? rateCount;

  Product({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.discount,
    this.sold,
    this.rateAvg,
    this.rateCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v,
      discount: discount,
      sold: sold,
      rateAvg: rateAvg,
      rateCount: rateCount,
    );
  }
}

@JsonSerializable()
class Store {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  StoreEntity toEntity() {
    return StoreEntity(
      name: name,
      image: image,
      address: address,
      phoneNumber: phoneNumber,
      latLong: latLong,
    );
  }
}
