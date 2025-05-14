class OrderDetailsModel {

  OrderDetailsModel(
      {this.sId,
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
        this.iV,
        this.store});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['orderItems'] != null) {
      orderItems = <OrderItems>[];
      json['orderItems'].forEach((v) {
        orderItems!.add(new OrderItems.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    iV = json['__v'];
    store = json['store'] != null ? new Store.fromJson(json['store']) : null;
  }
  String? sId;
  User? user;
  List<OrderItems>? orderItems;
  int? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  int? iV;
  Store? store;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.orderItems != null) {
      data['orderItems'] = this.orderItems!.map((v) => v.toJson()).toList();
    }
    data['totalPrice'] = this.totalPrice;
    data['paymentType'] = this.paymentType;
    data['isPaid'] = this.isPaid;
    data['isDelivered'] = this.isDelivered;
    data['state'] = this.state;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['orderNumber'] = this.orderNumber;
    data['__v'] = this.iV;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    return data;
  }
}

class User {

  User(
      {this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.gender,
        this.phone,
        this.photo,
        this.passwordResetCode,
        this.passwordResetExpires,
        this.resetCodeVerified});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    resetCodeVerified = json['resetCodeVerified'];
  }
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? resetCodeVerified;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['photo'] = this.photo;
    data['passwordResetCode'] = this.passwordResetCode;
    data['passwordResetExpires'] = this.passwordResetExpires;
    data['resetCodeVerified'] = this.resetCodeVerified;
    return data;
  }
}

class OrderItems {

  OrderItems({this.product, this.price, this.quantity, this.sId});

  OrderItems.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    price = json['price'];
    quantity = json['quantity'];
    sId = json['_id'];
  }
  Product? product;
  int? price;
  int? quantity;
  String? sId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['_id'] = this.sId;
    return data;
  }
}

class Product {

  Product(
      {this.sId,
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
        this.iV,
        this.discount,
        this.sold});

  Product.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'].cast<String>();
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    discount = json['discount'];
    sold = json['sold'];
  }
  String? sId;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? discount;
  int? sold;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['imgCover'] = this.imgCover;
    data['images'] = this.images;
    data['price'] = this.price;
    data['priceAfterDiscount'] = this.priceAfterDiscount;
    data['quantity'] = this.quantity;
    data['category'] = this.category;
    data['occasion'] = this.occasion;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['discount'] = this.discount;
    data['sold'] = this.sold;
    return data;
  }
}

class Store {

  Store({this.name, this.image, this.address, this.phoneNumber, this.latLong});

  Store.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    latLong = json['latLong'];
  }
  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  String? latLong;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['latLong'] = this.latLong;
    return data;
  }
}