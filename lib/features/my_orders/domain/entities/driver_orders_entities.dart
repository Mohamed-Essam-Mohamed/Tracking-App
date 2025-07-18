class DriverOrdersEntities {
  DriverOrdersEntities({
    this.message,
    this.orders,
  });
  String? message;
  List<OrdersEntities>? orders;
}

class OrdersEntities {
  OrdersEntities({
    this.id,
    this.driver,
    this.order,
    this.v,
    this.createdAt,
    this.updatedAt,
    this.store,
  });

  String? id;
  String? driver;
  OrderEntities? order;
  num? v;
  String? createdAt;
  String? updatedAt;
  StoreEntities? store;


}


class StoreEntities {
  StoreEntities({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });
  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;
}

class OrderEntities {
  OrderEntities({
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
  });
  String? id;
  UserEntities? user;
  List<OrderItemsEntities>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;
}


class OrderItemsEntities{
  OrderItemsEntities({
    this.product,
    this.price,
    this.quantity,
    this.id
  });
  ProductEntity ? product;
  num? price;
  num? quantity;
  String? id;

}



class ProductEntity {
  ProductEntity({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images, // Add this if needed
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSuperAdmin,
    this.sold,
  });

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images; // Add this if needed
  int? price;
  num? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  bool? isSuperAdmin;
  num? sold;
}


class UserEntities{
  UserEntities({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
  });
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
}
