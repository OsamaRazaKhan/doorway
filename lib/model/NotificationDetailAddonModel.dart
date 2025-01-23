import 'package:doorway/Model/BookOrderListingModel.dart';
import 'package:doorway/Model/LocationModel.dart';

class NotificationDetailAddonModel {
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
  Addons? addons;
  Order? order;

  NotificationDetailAddonModel(
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
      this.addons,
      this.order});

  NotificationDetailAddonModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    module = map['module']?.toString() ?? "";
    type = map['type']?.toString() ?? "";
    typeId = map['type_id']?.toString() ?? "";
    title = map['title']?.toString() ?? "";
    userId = map['user_id']?.toString() ?? "";
    readStatus = map['read_status']?.toString() ?? "";
    readTime = map['read_time']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
    vendor = map['vendor'] != null ? Vendor.fromMap(map['vendor']) : null;
    addons = map['addons'] != null ? Addons.fromMap(map['addons']) : null;
    order = map['order'] != null ? Order.fromMap(map['order']) : null;
  }

  Map<String, dynamic> toMap() {
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
      data['vendor'] = vendor!.toMap();
    }
    if (addons != null) {
      data['addons'] = addons!.toMap();
    }
    if (order != null) {
      data['order'] = order!.toMap();
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

  Vendor.fromMap(Map<String, dynamic> map) {
    name = map['name']?.toString() ?? "";
    arName = map['ar_name']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['ar_description']?.toString() ?? "";
    image = map['image']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['ar_name'] = arName;
    data['description'] = description;
    data['ar_description'] = arDescription;
    data['image'] = image;
    return data;
  }
}

class Addons {
  String? orderId;
  List<AddonDetails>? addonDetails;
  String? totalValue;
  String? vatValue;
  String? finalValue;

  Addons(
      {this.orderId,
      this.addonDetails,
      this.totalValue,
      this.vatValue,
      this.finalValue});

  Addons.fromMap(Map<String, dynamic> map) {
    orderId = map['order_id']?.toString() ?? "";
    if (map['addon_details'] != null) {
      addonDetails = <AddonDetails>[];
      map['addon_details'].forEach((v) {
        addonDetails!.add(AddonDetails.fromMap(v));
      });
    }
    totalValue = map['total_value']?.toString() ?? "";
    vatValue = map['vat_value']?.toString() ?? "";
    finalValue = map['final_value']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    if (addonDetails != null) {
      data['addon_details'] = addonDetails!.map((v) => v.toMap()).toList();
    }
    data['total_value'] = totalValue;
    data['vat_value'] = vatValue;
    data['final_value'] = finalValue;
    return data;
  }
}

class AddonDetails {
  String? id;
  String? addonId;
  String? reason;
  String? amount;
  String? updatedAt;
  String? createdAt;

  AddonDetails(
      {this.id,
      this.addonId,
      this.reason,
      this.amount,
      this.updatedAt,
      this.createdAt});

  AddonDetails.fromMap(Map<String, dynamic> map) {
    id = map['id']?.toString() ?? "";
    addonId = map['addon_id']?.toString() ?? "";
    reason = map['reason']?.toString() ?? "";
    amount = map['amount']?.toString() ?? "";
    updatedAt = map['updated_at']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['addon_id'] = addonId;
    data['reason'] = reason;
    data['amount'] = amount;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
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
  //Null? transaction;
  String? dateTimeDropOff;
  String? additionalCost;
  String? dateTime;
  String? hasAttributes;
  //Null? attributes;
  String? hasFiles;
  //Null? files;
  List<Details>? details;

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
      this.vatIncluded,
      this.vatValue,
      this.finalValue,
      this.total,
      this.type,
      this.notes,
      this.createdAt,
      //this.transaction,
      this.dateTimeDropOff,
      this.additionalCost,
      this.dateTime,
      this.hasAttributes,
      //this.attributes,
      this.hasFiles,
      //this.files,
      this.details});

  Order.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : null;
    status = map['status']?.toString() ?? "";
    isRated = map['is_rated'] != null ? map['is_rated'] : false;
    orderNo = map['order_no']?.toString() ?? "";
    userId = map['user_id']?.toString() ?? "";
    locId = map['loc_id']?.toString() ?? "";
    location =
        map['location'] != null ? LocationModel.fromMap(map['location']) : null;
    catId = map['cat_id']?.toString() ?? "";
    catName = map['cat_name']?.toString() ?? "";
    subCatId = map['sub_cat_id']?.toString() ?? "";
    vendId = map['vend_id']?.toString() ?? "";
    vendName = map['vend_name']?.toString() ?? "";
    vatIncluded = map['vat_included']?.toString() ?? "";
    vatValue = map['vat_value']?.toString() ?? "";
    finalValue = map['final_value']?.toString() ?? "";
    total = map['total']?.toString() ?? "";
    type = map['type']?.toString() ?? "";
    notes = map['notes']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
    dateTimeDropOff = map['date_time_drop_off']?.toString() ?? "";
    additionalCost = map['additional_cost']?.toString() ?? "";
    dateTime = map['date_time']?.toString() ?? "";
    hasAttributes = map['has_attributes']?.toString() ?? "";
    hasFiles = map['has_files']?.toString() ?? "";

    if (map['details'] != null) {
      details = <Details>[];
      map['details'].forEach((v) {
        details!.add(Details.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
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
    data['vat_included'] = vatIncluded;
    data['vat_value'] = vatValue;
    data['final_value'] = finalValue;
    data['total'] = total;
    data['type'] = type;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    //data['transaction'] = this.transaction;
    data['date_time_drop_off'] = dateTimeDropOff;
    data['additional_cost'] = additionalCost;
    data['date_time'] = dateTime;
    data['has_attributes'] = hasAttributes;
    //data['attributes'] = this.attributes;
    data['has_files'] = hasFiles;
    //data['files'] = this.files;
    if (details != null) {
      data['details'] = details!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? subCatId;
  String? serviceId;

  Details({this.id, this.subCatId, this.serviceId});

  Details.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    subCatId = map['sub_cat_id']?.toString() ?? "";
    serviceId = map['service_id']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_cat_id'] = subCatId;
    data['service_id'] = serviceId;
    return data;
  }
}
