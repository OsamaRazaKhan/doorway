class NotificationDetailProductModel {
  int? id;
  String? module;
  String? type;
  String? typeId;
  String? title;
  String? userId;
  String? readStatus;
  String? readTime;
  String? createdAt;
  SubDetail? subDetail;

  NotificationDetailProductModel(
      {this.id,
      this.module,
      this.type,
      this.typeId,
      this.title,
      this.userId,
      this.readStatus,
      this.readTime,
      this.createdAt,
      this.subDetail});

  NotificationDetailProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    module = json['module'];
    type = json['type'];
    typeId = json['type_id'];
    title = json['title'];
    userId = json['user_id'];
    readStatus = json['read_status'];
    readTime = json['read_time'];
    createdAt = json['created_at'];
    subDetail = json['sub_detail'] != null
        ? SubDetail.fromJson(json['sub_detail'])
        : null;
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
    if (subDetail != null) {
      data['sub_detail'] = subDetail!.toJson();
    }
    return data;
  }
}

class SubDetail {
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

  SubDetail(
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

  SubDetail.fromJson(Map<String, dynamic> json) {
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
