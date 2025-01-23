import 'package:doorway/Model/BookOrderListingModel.dart';
import 'package:doorway/model/LocationModel.dart';

class OrderDetailModel {
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
  String? total;
  String? type;
  String? notes;
  String? createdAt;
  int? isladder;
  int? ladderLength;
  String? currentWallColor;
  String? newWallColor;
  String? addWhiteColorCost;
  String? needCeilingsPainted;
  String? providePaint;
  String? brandId;
  String? paintCode;
  String? rooms;
  String? dateTimeDropOff;
  String? additionalCost;
  String? dateTime;
  String? hasAttributes;
  List<Details>? details = [];

  OrderDetailModel(
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
      this.currentWallColor,
      this.newWallColor,
      this.addWhiteColorCost,
      this.needCeilingsPainted,
      this.providePaint,
      this.brandId,
      this.paintCode,
      this.rooms,
      this.dateTimeDropOff,
      this.additionalCost,
      this.dateTime,
      this.hasAttributes,
      this.details});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
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
    total = json['final_value'];
    type = json['type'];
    notes = json['notes'];
    createdAt = json['created_at'];
    currentWallColor = json['current_wall_color'];
    newWallColor = json['new_wall_color'];
    addWhiteColorCost = json['add_white_color_cost'];
    needCeilingsPainted = json['need_ceilings_painted'];
    providePaint = json['provide_paint'];
    brandId = json['brand_id'];
    paintCode = json['paint_code'];
    rooms = json['rooms'];
    dateTimeDropOff = json['date_time_drop_off'];
    additionalCost = json['additional_cost'];
    dateTime = json['date_time'];
    hasAttributes = json['has_attributes'];
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
    data['current_wall_color'] = currentWallColor;
    data['new_wall_color'] = newWallColor;
    data['add_white_color_cost'] = addWhiteColorCost;
    data['need_ceilings_painted'] = needCeilingsPainted;
    data['provide_paint'] = providePaint;
    data['brand_id'] = brandId;
    data['paint_code'] = paintCode;
    data['rooms'] = rooms;
    data['date_time_drop_off'] = dateTimeDropOff;
    data['additional_cost'] = additionalCost;
    data['date_time'] = dateTime;
    data['has_attributes'] = hasAttributes;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? serviceId;
  String? subServiceId;
  String? quantity;

  Details({this.id, this.serviceId, this.subServiceId, this.quantity});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    subServiceId = json['sub_service_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['sub_service_id'] = subServiceId;
    data['quantity'] = quantity;
    return data;
  }
}
