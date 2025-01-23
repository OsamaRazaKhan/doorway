import 'package:doorway/model/LocationModel.dart';

class OrderModel {
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

  String? hasFiles;

  String? senderName;
  String? receiverName;
  String? message;

  OrderModel(
      {this.id,
      this.status,
      this.isRated,
      this.orderNo,
      this.userId,
      this.locId,
      this.vendName,
      this.location,
      this.catId,
      this.catName,
      this.subCatId,
      this.vendId,
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
      this.hasFiles,
      this.senderName,
      this.receiverName,
      this.message});

  OrderModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    status = map['status']?.toString() ?? "";
    isRated = map['is_rated'] != null ? map['is_rated'] as bool : false;
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
    total = map['final_value']?.toString() ?? "";
    type = map['type']?.toString() ?? "";
    notes = map['notes']?.toString() ?? "";
    createdAt = map['created_at']?.toString() ?? "";
    currentWallColor = map['current_wall_color']?.toString() ?? "";
    newWallColor = map['new_wall_color']?.toString() ?? "";
    addWhiteColorCost = map['add_white_color_cost']?.toString() ?? "";
    needCeilingsPainted = map['need_ceilings_painted']?.toString() ?? "";
    providePaint = map['provide_paint']?.toString() ?? "";
    brandId = map['brand_id']?.toString() ?? "";
    paintCode = map['paint_code']?.toString() ?? "";
    rooms = map['rooms']?.toString() ?? "";
    dateTimeDropOff = map['date_time_drop_off']?.toString() ?? "";
    additionalCost = map['additional_cost']?.toString() ?? "";
    dateTime = map['date_time']?.toString() ?? "";
    hasAttributes = map['has_attributes']?.toString() ?? "";
    hasFiles = map['has_files']?.toString() ?? "";
    senderName = map['sender_name']?.toString() ?? "";
    receiverName = map['receiver_name']?.toString() ?? "";
    message = map['message']?.toString() ?? "";
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
    data['has_files'] = hasFiles;

    data['sender_name'] = senderName;
    data['receiver_name'] = receiverName;
    data['message'] = message;
    return data;
  }
}
