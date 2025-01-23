class NotificationModel {
  String? type;
  int? page;
  int? limit;
  int? pageCount;
  int? totalCount;
  List<NotificationsData>? notifications = [];

  NotificationModel.fromMap(Map<String, dynamic> map) {
    type = map['type']?.toString() ?? "";
    page = map['page'] != null ? int.parse(map['page'].toString()) : 0;
    limit = map['limit'] != null ? int.parse(map['limit'].toString()) : 0;
    pageCount =
        map['page_count'] != null ? int.parse(map['page_count'].toString()) : 0;
    totalCount = map['total_count'] != null
        ? int.parse(map['total_count'].toString())
        : 0;
    if (map['notifications'] != null) {
      notifications = <NotificationsData>[];
      map['notifications'].forEach((v) {
        notifications!.add(NotificationsData.fromMap(v));
      });
    }
  }
}

class NotificationsData {
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
  Product? product;
  Vendor? vendor;

  NotificationsData.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    module = map['module']?.toString() ?? "";
    type = map['type']?.toString() ?? "";
    typeId = map['type_id']?.toString() ?? "";
    title = map['title']?.toString() ?? "";
    userId = map['user_id']?.toString() ?? "";
    readStatus = map['read_status']?.toString() ?? "";
    readTime = map['read_time']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
    order = map['order'] != null ? Order.fromMap(map['order']) : null;
    product = map['product'] != null ? Product.fromMap(map['product']) : null;
    vendor = map['vendor'] != null ? Vendor.fromMap(map['vendor']) : null;
  }
}

class Order {
  int? id;
  String? orderNo;
  String? totalValue;
  String? status;
  String? createdAt;

  Order.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    orderNo = map['order_no']?.toString() ?? "";
    totalValue = map['total_value']?.toString() ?? "";
    status = map['status']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
  }
}

class Product {
  int? id;
  String? productNo;
  String? sellerId;
  String? catId;
  String? subCatId;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? price;
  String? shippingFee;
  String? noOfReviews;
  String? overallRating;
  String? hasImages;
  List<String>? images = [];

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    productNo = map['product_no']?.toString() ?? "";
    sellerId = map['seller_id']?.toString() ?? "";
    catId = map['cat_id']?.toString() ?? "";
    subCatId = map['sub_cat_id']?.toString() ?? "";
    title = map['title']?.toString() ?? "";
    arTitle = map['ar_title']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['ar_description']?.toString() ?? "";
    price = map['price']?.toString() ?? "";
    shippingFee = map['shipping_fee']?.toString() ?? "";
    noOfReviews = map['no_of_reviews']?.toString() ?? "";
    overallRating = map['overall_rating']?.toString() ?? "";
    hasImages = map['has_images']?.toString() ?? "";
    images = map['images'] != null ? List<String>.from(map['images']) : [];
  }
}

class Vendor {
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? image;

  Vendor.fromMap(Map<String, dynamic> map) {
    name = map['name']?.toString() ?? "";
    arName = map['ar_name']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['ar_description']?.toString() ?? "";
    image = map['image']?.toString() ?? "";
  }
}
