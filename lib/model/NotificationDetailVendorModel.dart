import 'package:doorway/Model/BookOrderListingModel.dart';
import 'package:doorway/model/LocationModel.dart';

class NotificationDetailVendorModel {
  int? id;
  String? module;
  String? type;
  String? typeId;
  String? title;
  String? userId;
  String? readStatus;
  String? readTime;
  String? createdAt;
  Vendor? vendor;
  Order? order;

  NotificationDetailVendorModel(
      {this.id,
      this.module,
      this.type,
      this.typeId,
      this.title,
      this.userId,
      this.readStatus,
      this.readTime,
      this.createdAt,
      this.vendor,
      this.order});

  NotificationDetailVendorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    module = json['module'];
    type = json['type'];
    typeId = json['type_id'];
    title = json['title'];
    userId = json['user_id'];
    readStatus = json['read_status'];
    readTime = json['read_time'];
    createdAt = json['created_at'];
    vendor = json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null;
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
    if (vendor != null) {
      data['vendor'] = vendor!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Vendor {
  String? name;
  String? arName;
  String? description;
  String? arDescription;
  String? image;

  Vendor(
      {this.name,
      this.arName,
      this.description,
      this.arDescription,
      this.image});

  Vendor.fromJson(Map<String, dynamic> json) {
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

class Order {
  int? id;
  String? status;
  bool? isRated;
  String? orderNo;
  String? userId;
  String? locId;
  LocationModel? location;
  String? catId;
  String? catName;
  String? subCatId;
  String? vendId;
  String? vendName;
  String? vatIncluded;
  String? vatValue;
  String? finalValue;
  String? total;
  String? type;
  String? notes;
  String? createdAt;
  String? needMaterial;
  String? materialNotes;
  String? needIroning;
  String? cleaners;
  String? dateTime;
  String? hasAttributes;
  List<Attributes>? attributes;
  String? hasFiles;

  // Null? files;
  List<Details>? details = [];

  Order(
      {this.id,
      this.status,
      this.isRated,
      this.orderNo,
      this.userId,
      this.locId,
      this.location,
      this.catId,
      this.catName,
      this.subCatId,
      this.vendId,
      this.vendName,
      this.total,
      this.type,
      this.notes,
      this.createdAt,
      this.needMaterial,
      this.materialNotes,
      this.needIroning,
      this.cleaners,
      this.dateTime,
      this.hasAttributes,
      this.attributes,
      this.hasFiles,
      //this.files,
      this.details});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    isRated = json['is_rated'];
    orderNo = json['order_no'];
    userId = json['user_id'];
    locId = json['loc_id'];
    location = json['location'] != null
        ? LocationModel.fromMap(json['location'])
        : null;
    catId = json['cat_id'];
    catName = json['cat_name'];
    subCatId = json['sub_cat_id'];
    vendId = json['vend_id'];
    vendName = json['vend_name'];
    vatIncluded = json["vat_included"];
    vatValue = json["vat_value"];
    finalValue = json["final_value"];
    total = json['total'];
    type = json['type'];
    notes = json['notes'];
    createdAt = json['created_at'];
    needMaterial = json['need_material'];
    materialNotes = json['material_notes'];
    needIroning = json['need_ironing'];
    cleaners = json['cleaners'];
    dateTime = json['date_time'];
    hasAttributes = json['has_attributes'];
    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      json['attributes'].forEach((v) {
        attributes!.add(Attributes.fromJson(v));
      });
    }
    hasFiles = json['has_files'];

    /// files = json['files'];
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
    data['status'] = status;
    data['is_rated'] = isRated;
    data['order_no'] = orderNo;
    data['user_id'] = userId;
    data['loc_id'] = locId;
    if (location != null) {
      data['location'] = location!.toMap();
    }
    data['cat_id'] = catId;
    data['cat_name'] = catName;
    data['sub_cat_id'] = subCatId;
    data['vend_id'] = vendId;
    data['vend_name'] = vendName;
    data['total'] = total;
    data['type'] = type;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    data['need_material'] = needMaterial;
    data['material_notes'] = materialNotes;
    data['need_ironing'] = needIroning;
    data['cleaners'] = cleaners;
    data['date_time'] = dateTime;
    data['has_attributes'] = hasAttributes;
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    data['has_files'] = hasFiles;
    // data['files'] = this.files;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String? name;
  int? price;
  int? quantity;

  Attributes({this.name, this.price, this.quantity});

  Attributes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    return data;
  }
}

class Details {
  int? id;
  String? subCatId;
  String? serviceId;
  String? subServiceId;
  String? quantity;
  String? covid;
  String? cleaners;
  String? needMaterial;
  String? materialNotes;
  String? needIroning;
  String? dateTime;

  Details(
      {this.id,
      this.subCatId,
      this.serviceId,
      this.subServiceId,
      this.quantity,
      this.covid,
      this.cleaners,
      this.needMaterial,
      this.materialNotes,
      this.needIroning,
      this.dateTime});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCatId = json['sub_cat_id'];
    serviceId = json['service_id'];
    subServiceId = json['sub_service_id'];
    quantity = json['quantity'];
    covid = json['covid'];
    cleaners = json['cleaners'];
    needMaterial = json['need_material'];
    materialNotes = json['material_notes'];
    needIroning = json['need_ironing'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_cat_id'] = subCatId;
    data['service_id'] = serviceId;
    data['sub_service_id'] = subServiceId;
    data['quantity'] = quantity;
    data['covid'] = covid;
    data['cleaners'] = cleaners;
    data['need_material'] = needMaterial;
    data['material_notes'] = materialNotes;
    data['need_ironing'] = needIroning;
    data['date_time'] = dateTime;
    return data;
  }
}
