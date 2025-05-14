import 'package:equatable/equatable.dart';

class ItemOrderDetailsEntity extends Equatable {
  const ItemOrderDetailsEntity({this.message = '', this.orders = const []});
  final String message;
  final List<OrderEntity> orders;

  @override
  List<Object?> get props => [message, orders];
}

class OrderEntity extends Equatable {
  const OrderEntity({
    this.sId = '',
    this.user = const UserEntity(),
    this.orderItems = const [],
    this.totalPrice = 0.0,
    this.paymentType = '',
    this.isPaid = false,
    this.isDelivered = false,
    this.state = '',
    this.orderNumber = '',
    this.iV = 0,
    this.store = const StoreEntity(),
    this.shippingAddress = const ShippingAddressEntity(),
    this.paidAt = '',
  });
  final String sId;
  final UserEntity user;
  final List<OrderItemsEntity> orderItems;
  final double totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;

  final String orderNumber;
  final int iV;
  final StoreEntity store;
  final ShippingAddressEntity shippingAddress;
  final String paidAt;

  @override
  List<Object?> get props => [
        sId,
        user,
        orderItems,
        totalPrice,
        paymentType,
        isPaid,
        isDelivered,
        state,
        orderNumber,
        iV,
        store,
        shippingAddress,
        paidAt
      ];
}

class UserEntity extends Equatable {
  const UserEntity({
    this.sId = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.gender = '',
    this.phone = '',
    this.photo = '',
    this.passwordResetCode = '',
    this.passwordResetExpires = '',
    this.resetCodeVerified = false,
  });
  final String sId;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String passwordResetCode;
  final String passwordResetExpires;
  final bool resetCodeVerified;

  @override
  List<Object?> get props => [
        sId,
        firstName,
        lastName,
        email,
        gender,
        phone,
        photo,
        passwordResetCode,
        passwordResetExpires,
        resetCodeVerified
      ];
}

class OrderItemsEntity extends Equatable {
  const OrderItemsEntity({
    this.product = const ProductEntity(),
    this.price = 0,
    this.quantity = 0,
    this.sId = '',
  });

  final ProductEntity product;
  final int price;
  final int quantity;
  final String sId;

  @override
  List<Object?> get props => [sId, product, price, quantity];
}

class ProductEntity extends Equatable {
  const ProductEntity({
    this.sId = '',
    this.title = '',
    this.slug = '',
    this.description = '',
    this.imgCover = '',
    this.images = const [],
    this.price = 0,
    this.priceAfterDiscount = 0,
    this.quantity = 0,
    this.category = '',
    this.occasion = '',
    this.createdAt = '',
    this.updatedAt = '',
    this.iV = 0,
    this.discount = 0,
    this.sold = 0,
    this.rateAvg = 0.0,
    this.rateCount = 0,
  });
  final String sId;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final int price;
  final int priceAfterDiscount;
  final int quantity;
  final String category;
  final String occasion;
  final String createdAt;
  final String updatedAt;
  final int iV;
  final int discount;
  final int sold;
  final double rateAvg;
  final int rateCount;

  @override
  List<Object?> get props => [
        sId,
        title,
        slug,
        description,
        imgCover,
        images,
        price,
        priceAfterDiscount,
        quantity,
        category,
        occasion,
        createdAt,
        updatedAt,
        iV,
        discount,
        sold,
        rateAvg,
        rateCount
      ];
}

class StoreEntity extends Equatable {
  const StoreEntity({
    this.name = '',
    this.image = '',
    this.address = '',
    this.phoneNumber = '',
    this.latLong = '',
  });
  final String name;
  final String image;
  final String address;
  final String phoneNumber;
  final String latLong;

  @override
  List<Object?> get props => [name, image, address, phoneNumber, latLong];
}

class ShippingAddressEntity extends Equatable {
  const ShippingAddressEntity({this.street = '', this.city = '', this.phone = ''});
  final String street;
  final String city;
  final String phone;

  @override
  List<Object?> get props => [street, city, phone];
}
