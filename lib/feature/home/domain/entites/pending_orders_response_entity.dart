class PendingOrdersResponseEntity {
  final String? message;
  final List<OrderEntity>? orders;

  PendingOrdersResponseEntity({
    this.message,
    this.orders,
  });
}

class OrderEntity {
  final String? id;
  final UserEntity? user;
  final List<OrderItemEntity>? orderItems;
  final int? totalPrice;
  final ShippingAddressEntity? shippingAddress;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;
  final int? v;
  final StoreEntity? store;

  OrderEntity({
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
}

class UserEntity {
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

  UserEntity({
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
}

class OrderItemEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItemEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });
}

class ShippingAddressEntity {
  final String? street;
  final String? city;
  final String? phone;
  final String? lat;
  final String? long;

  ShippingAddressEntity({
    this.street,
    this.city,
    this.phone,
    this.lat,
    this.long,
  });
}

class ProductEntity {
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

  ProductEntity({
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
}

class StoreEntity {
  final String? name;
  final String? image;
  final String? address;
  final String? phoneNumber;
  final String? latLong;

  StoreEntity({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });
}
