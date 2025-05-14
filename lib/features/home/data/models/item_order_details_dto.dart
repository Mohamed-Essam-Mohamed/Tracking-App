import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/features/home/domain/entities/item_order_details_entity.dart';

part 'item_order_details_dto.g.dart';

@JsonSerializable()
class ItemOrderDetailsDto {
  const ItemOrderDetailsDto({this.message = '', this.orders = const []});
  factory ItemOrderDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ItemOrderDetailsDtoFromJson(json);
  final String message;
  final List<OrderDto> orders;
  // to entity
  ItemOrderDetailsEntity toEntity() => ItemOrderDetailsEntity(
        message: message,
        orders: orders.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class OrderDto {
  const OrderDto({
    this.sId = '',
    this.user = const UserDto(),
    this.orderItems = const [],
    this.totalPrice = 0.0,
    this.paymentType = '',
    this.isPaid = false,
    this.isDelivered = false,
    this.state = '',
    this.orderNumber = '',
    this.iV = 0,
    this.store = const StoreDto(),
    this.shippingAddress = const ShippingAddressDto(),
    this.paidAt = '',
  });
  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
  final String sId;
  final UserDto user;
  final List<OrderItemsDto> orderItems;
  final double totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;
  final String orderNumber;
  final int iV;
  final StoreDto store;
  final ShippingAddressDto shippingAddress;
  final String paidAt;
  // to entity
  OrderEntity toEntity() => OrderEntity(
        sId: sId,
        user: user.toEntity(),
        orderItems: orderItems.map((e) => e.toEntity()).toList(),
        totalPrice: totalPrice,
        paymentType: paymentType,
        isPaid: isPaid,
        isDelivered: isDelivered,
        state: state,
        orderNumber: orderNumber,
        iV: iV,
        store: store.toEntity(),
        shippingAddress: shippingAddress.toEntity(),
        paidAt: paidAt,
      );
}

@JsonSerializable()
class UserDto {
  const UserDto({
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
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
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
  // to entity
  UserEntity toEntity() => UserEntity(
        sId: sId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        phone: phone,
        photo: photo,
        passwordResetCode: passwordResetCode,
        passwordResetExpires: passwordResetExpires,
        resetCodeVerified: resetCodeVerified,
      );
}

@JsonSerializable()
class OrderItemsDto {
  const OrderItemsDto({
    this.product = const ProductDto(),
    this.price = 0,
    this.quantity = 0,
    this.sId = '',
  });

  factory OrderItemsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsDtoFromJson(json);

  final ProductDto product;
  final int price;
  final int quantity;
  final String sId;
  // to entity
  OrderItemsEntity toEntity() => OrderItemsEntity(
        product: product.toEntity(),
        price: price,
        quantity: quantity,
        sId: sId,
      );
}

@JsonSerializable()
class ProductDto {
  const ProductDto({
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
  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
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
  // to entity
  ProductEntity toEntity() => ProductEntity(
        sId: sId,
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
        iV: iV,
        discount: discount,
        sold: sold,
        rateAvg: rateAvg,
        rateCount: rateCount,
      );
}

@JsonSerializable()
class StoreDto {
  const StoreDto({
    this.name = '',
    this.image = '',
    this.address = '',
    this.phoneNumber = '',
    this.latLong = '',
  });
  factory StoreDto.fromJson(Map<String, dynamic> json) => _$StoreDtoFromJson(json);
  final String name;
  final String image;
  final String address;
  final String phoneNumber;
  final String latLong;

  // to entity
  StoreEntity toEntity() => StoreEntity(
        name: name,
        image: image,
        address: address,
        phoneNumber: phoneNumber,
        latLong: latLong,
      );
}

@JsonSerializable()
class ShippingAddressDto {
  const ShippingAddressDto({this.street = '', this.city = '', this.phone = ''});
  factory ShippingAddressDto.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressDtoFromJson(json);
  final String street;
  final String city;
  final String phone;

  // to entity
  ShippingAddressEntity toEntity() => ShippingAddressEntity(
        street: street,
        city: city,
        phone: phone,
      );
}
