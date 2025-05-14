// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_order_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOrderDetailsDto _$ItemOrderDetailsDtoFromJson(Map<String, dynamic> json) =>
    ItemOrderDetailsDto(
      message: json['message'] as String? ?? '',
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => OrderDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ItemOrderDetailsDtoToJson(
        ItemOrderDetailsDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
    };

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      sId: json['sId'] as String? ?? '',
      user: json['user'] == null
          ? const UserDto()
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      orderItems: (json['orderItems'] as List<dynamic>?)
              ?.map((e) => OrderItemsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0.0,
      paymentType: json['paymentType'] as String? ?? '',
      isPaid: json['isPaid'] as bool? ?? false,
      isDelivered: json['isDelivered'] as bool? ?? false,
      state: json['state'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      iV: (json['iV'] as num?)?.toInt() ?? 0,
      store: json['store'] == null
          ? const StoreDto()
          : StoreDto.fromJson(json['store'] as Map<String, dynamic>),
      shippingAddress: json['shippingAddress'] == null
          ? const ShippingAddressDto()
          : ShippingAddressDto.fromJson(
              json['shippingAddress'] as Map<String, dynamic>),
      paidAt: json['paidAt'] as String? ?? '',
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'sId': instance.sId,
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      'orderNumber': instance.orderNumber,
      'iV': instance.iV,
      'store': instance.store,
      'shippingAddress': instance.shippingAddress,
      'paidAt': instance.paidAt,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      sId: json['sId'] as String? ?? '',
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      photo: json['photo'] as String? ?? '',
      passwordResetCode: json['passwordResetCode'] as String? ?? '',
      passwordResetExpires: json['passwordResetExpires'] as String? ?? '',
      resetCodeVerified: json['resetCodeVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'sId': instance.sId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'passwordResetCode': instance.passwordResetCode,
      'passwordResetExpires': instance.passwordResetExpires,
      'resetCodeVerified': instance.resetCodeVerified,
    };

OrderItemsDto _$OrderItemsDtoFromJson(Map<String, dynamic> json) =>
    OrderItemsDto(
      product: json['product'] == null
          ? const ProductDto()
          : ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      sId: json['sId'] as String? ?? '',
    );

Map<String, dynamic> _$OrderItemsDtoToJson(OrderItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      'sId': instance.sId,
    };

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      sId: json['sId'] as String? ?? '',
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imgCover: json['imgCover'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      price: (json['price'] as num?)?.toInt() ?? 0,
      priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      category: json['category'] as String? ?? '',
      occasion: json['occasion'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      iV: (json['iV'] as num?)?.toInt() ?? 0,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      rateAvg: (json['rateAvg'] as num?)?.toDouble() ?? 0.0,
      rateCount: (json['rateCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'sId': instance.sId,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'iV': instance.iV,
      'discount': instance.discount,
      'sold': instance.sold,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
    };

StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) => StoreDto(
      name: json['name'] as String? ?? '',
      image: json['image'] as String? ?? '',
      address: json['address'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      latLong: json['latLong'] as String? ?? '',
    );

Map<String, dynamic> _$StoreDtoToJson(StoreDto instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'latLong': instance.latLong,
    };

ShippingAddressDto _$ShippingAddressDtoFromJson(Map<String, dynamic> json) =>
    ShippingAddressDto(
      street: json['street'] as String? ?? '',
      city: json['city'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );

Map<String, dynamic> _$ShippingAddressDtoToJson(ShippingAddressDto instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'phone': instance.phone,
    };
