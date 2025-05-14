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
  ShippingAddressEntity? shippingAddress;
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
  String? street;
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

final List<ShippingAddressEntity> shippingAddresses = [
  ShippingAddressEntity(
    phone: "+201012345678",
    street: "El-Nabi Daniel Street , Alexadira",
    city: 'Alexandria',
    lat: '31.2058',
    long: '29.8897',
  ),
  ShippingAddressEntity(
    phone: "+201198765432",
    street: "Fouad Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.1997',
    long: '29.8947',
  ),
  ShippingAddressEntity(
    phone: "+20125551212",
    street: "Safeya Zaghloul Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2025',
    long: '29.8967',
  ),
  ShippingAddressEntity(
    phone: "+201501122334",
    street: "Corniche,Alexandria",
    city: 'Alexandria',
    lat: '31.2129',
    long: '29.9176',
  ),
  ShippingAddressEntity(
    phone: "+201099887766",
    street: "Saad Zaghloul Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2048',
    long: '29.8989',
  ),
  ShippingAddressEntity(
    phone: "+201112233445",
    street: "Abbas Mahmoud El-Akkad Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2156',
    long: '29.9423',
  ),
  ShippingAddressEntity(
    phone: "+201234567890",
    street: "Al Iskandar Al Akbar Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2218',
    long: '29.9215',
  ),
  ShippingAddressEntity(
    phone: "+201587654321",
    street: "Salah Salem Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2090',
    long: '29.9050',
  ),
  ShippingAddressEntity(
    phone: "+201023456789",
    street: "El-Horeya Road ,Alexandria",
    city: 'Alexandria',
    lat: '31.2075',
    long: "29.9116",
  ),
  ShippingAddressEntity(
    phone: "+201134567890",
    street: "Mohamed Talaat Noaman Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2287',
    long: '29.9391',
  ),
  ShippingAddressEntity(
    phone: "+201245678901",
    street: "Mohammed Othman Abdel Rabbo Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.1985',
    long: '29.8832',
  ),
  ShippingAddressEntity(
    phone: "+201556789012",
    street: "Attarine Mosque street ,Alexandria",
    city: 'Alexandria',
    lat: '31.1992',
    long: '29.8878',
  ),
  ShippingAddressEntity(
    phone: "+201067890123",
    street: "El Batalsa Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2063',
    long: '29.8925',
  ),
  ShippingAddressEntity(
    phone: "+201178901234",
    street: "El Shohadaa Street ,Alexandria",
    city: 'Alexandria',
    lat: "31.2111",
    long: '29.9088',
  ),
  ShippingAddressEntity(
    phone: "+201289012345",
    street: "Qaisar Street ,Alexandria",
    city: 'Alexandria',
    lat: '31.2030',
    long: '29.8955',
  ),
  ShippingAddressEntity(
    phone: "+201590123456",
    street: "Suez Canal Road ,Alexandria",
    city: 'Alexandria',
    lat: "31.2195",
    long: "29.9612",
  ),
  ShippingAddressEntity(
    phone: "+201001234567",
    street: "Al Ghorfa Al Togaria Street ,Alexandria",
    city: 'Alexandria',
    lat: "31.2082",
    long: "29.9003",
  ),
  ShippingAddressEntity(
    phone: "+201102345678",
    street: "Al Mina' Eastern Street ,Alexandria",
    city: 'Alexandria',
    lat: "31.2051",
    long: "29.8849",
  ),
  ShippingAddressEntity(
    phone: "+201203456789",
    street: "Al Nasr Street ,Alexandria",
    city: 'Alexandria',
    lat: "31.2269",
    long: "29.9487",
  ),
  ShippingAddressEntity(
    phone: "+201504567890",
    street: "Al Shahid Salah Moustafa Street ,Alexandria",
    city: 'Alexandria',
    lat: "31.2138",
    long: "29.9271",
  ),
];
