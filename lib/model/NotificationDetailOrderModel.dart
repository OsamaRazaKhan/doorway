class NotificationDetailOrderModel {
  int? id;
  String? module;
  String? type;
  String? typeId;
  String? title;
  String? userId;
  String? readStatus;
  String? readTime;
  String? createdAt;
  Order? order;

  NotificationDetailOrderModel(
      {this.id,
      this.module,
      this.type,
      this.typeId,
      this.title,
      this.userId,
      this.readStatus,
      this.readTime,
      this.createdAt,
      this.order});

  NotificationDetailOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    module = json['module'];
    type = json['type'];
    typeId = json['type_id'];
    title = json['title'];
    userId = json['user_id'];
    readStatus = json['read_status'];
    readTime = json['read_time'];
    createdAt = json['created_at'];
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['module'] = module;
    data['type'] = type;
    data['type_id'] = typeId;
    data['title'] = title;
    data['user_id'] = userId;
    data['read_status'] = readStatus;
    data['read_time'] = readTime;
    data['created_at'] = createdAt;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Order {
  int? id;
  String? orderNo;
  String? totalValue;
  String? addressId;
  String? paymentMethodId;
  String? status;
  List<Details>? details = [];

  Order(
      {this.id,
      this.orderNo,
      this.totalValue,
      this.addressId,
      this.paymentMethodId,
      this.status,
      this.details});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    totalValue = json['total_value'];
    addressId = json['address_id'];
    paymentMethodId = json['payment_method_id'];
    status = json['status'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_no'] = orderNo;
    data['total_value'] = totalValue;
    data['address_id'] = addressId;
    data['payment_method_id'] = paymentMethodId;
    data['status'] = status;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? sellerId;
  Seller? seller;
  String? couponId;
  String? subTotal;
  String? shippingFee;
  String? discountApplied;
  String? discountValue;
  String? finalValue;
  List<SubDetails>? subDetails = [];

  Details(
      {this.id,
      this.sellerId,
      this.seller,
      this.couponId,
      this.subTotal,
      this.shippingFee,
      this.discountApplied,
      this.discountValue,
      this.finalValue,
      this.subDetails});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sellerId = json['seller_id'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
    couponId = json['coupon_id'];
    subTotal = json['sub_total'];
    shippingFee = json['shipping_fee'];
    discountApplied = json['discount_applied'];
    discountValue = json['discount_value'];
    finalValue = json['final_value'];
    if (json['sub_details'] != null) {
      subDetails = <SubDetails>[];
      json['sub_details'].forEach((v) {
        subDetails!.add(SubDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['seller_id'] = sellerId;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    data['coupon_id'] = couponId;
    data['sub_total'] = subTotal;
    data['shipping_fee'] = shippingFee;
    data['discount_applied'] = discountApplied;
    data['discount_value'] = discountValue;
    data['final_value'] = finalValue;
    if (subDetails != null) {
      data['sub_details'] = subDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Seller {
  int? id;
  bool? status;
  bool? isFeatured;
  BasicDetails? basicDetails;
  ContactDetails? contactDetails;
  int? overallRating;
  int? reviewsCount;

  Seller(
      {this.id,
      this.status,
      this.isFeatured,
      this.basicDetails,
      this.contactDetails,
      this.overallRating,
      this.reviewsCount});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    isFeatured = json['is_featured'];
    basicDetails = json['basic_details'] != null
        ? BasicDetails.fromJson(json['basic_details'])
        : null;
    contactDetails = json['contact_details'] != null
        ? ContactDetails.fromJson(json['contact_details'])
        : null;
    overallRating = json['overall_rating'];
    reviewsCount = json['reviews_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['is_featured'] = isFeatured;
    if (basicDetails != null) {
      data['basic_details'] = basicDetails!.toJson();
    }
    if (contactDetails != null) {
      data['contact_details'] = contactDetails!.toJson();
    }
    data['overall_rating'] = overallRating;
    data['reviews_count'] = reviewsCount;
    return data;
  }
}

class BasicDetails {
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? image;
  BasicDetails(
      {this.name,
      this.arName,
      this.description,
      this.arDescription,
      this.image});

  BasicDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    arName = json['ar_name'];
    description = json['description'];
    arDescription = json['ar_description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['ar_name'] = arName;
    data['description'] = description;
    data['ar_description'] = arDescription;
    data['image'] = image;
    return data;
  }
}

class ContactDetails {
  String? email;
  String? phone;
  String? website;

  ContactDetails({this.email, this.phone, this.website});

  ContactDetails.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    data['website'] = website;
    return data;
  }
}

class SubDetails {
  int? id;
  String? productId;
  String? productName;
  String? quantity;
  String? basePrice;
  String? attributesAddition;
  String? shippingFee;
  String? totalPrice;
  String? isRated;
  String? status;
  String? hasAttributes;
  List<Attributes>? attributes = [];
  List<String>? images = [];

  SubDetails(
      {this.id,
      this.productId,
      this.productName,
      this.quantity,
      this.basePrice,
      this.attributesAddition,
      this.shippingFee,
      this.totalPrice,
      this.isRated,
      this.status,
      this.hasAttributes,
      this.attributes,
      this.images});

  SubDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    basePrice = json['base_price'];
    attributesAddition = json['attributes_addition'];
    shippingFee = json['shipping_fee'];
    totalPrice = json['total_price'];
    isRated = json['is_rated'];
    status = json['status'];
    hasAttributes = json['has_attributes'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['base_price'] = basePrice;
    data['attributes_addition'] = attributesAddition;
    data['shipping_fee'] = shippingFee;
    data['total_price'] = totalPrice;
    data['is_rated'] = isRated;
    data['status'] = status;
    data['has_attributes'] = hasAttributes;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['images'] = images;
    return data;
  }
}

class Attributes {
  int? id;
  String? value;
  int? price;

  Attributes({this.id, this.value, this.price});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    data['price'] = price;
    return data;
  }
}
