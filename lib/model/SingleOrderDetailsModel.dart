import 'package:doorway/model/LocationModel.dart';

class SingleOrderDetailsModel {
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
  Null transaction;
  String? isLadder;
  String? ladderLength;
  String? dateTime;
  String? hasAttributes;
  Null attributes;
  String? hasFiles;
  List<String>? files;
  List<Details>? details;

  SingleOrderDetailsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;

    status = map['status']?.toString() ?? "";
    orderNo = map['order_no']?.toString() ?? "";
    userId = map['user_id']?.toString() ?? "";
    locId = map['loc_id']?.toString() ?? "";
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
    isLadder = map['is_ladder']?.toString() ?? "";
    ladderLength = map['ladder_length']?.toString() ?? "";
    dateTime = map['date_time']?.toString() ?? "";
    hasAttributes = map['has_attributes']?.toString() ?? "";
    hasFiles = map['has_files']?.toString() ?? "";

    isRated = map['is_rated'] != null ? map['is_rated'] as bool : false;
    location =
        map['location'] != null ? LocationModel.fromMap(map['location']) : null;
    transaction = map['transaction'];
    attributes = map['attributes'];
    if (map['files'] != null) {
      files = <String>[];
      map['files'].forEach((v) {
        files!.add(v);
      });
    }
    if (map['details'] != null) {
      details = <Details>[];
      map['details'].forEach((v) {
        details!.add(new Details.fromMap(v));
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
    if (this.location != null) {
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
    data['transaction'] = transaction;
    data['is_ladder'] = isLadder;
    data['ladder_length'] = ladderLength;
    data['date_time'] = dateTime;
    data['has_attributes'] = hasAttributes;
    data['attributes'] = attributes;
    data['has_files'] = hasFiles;
    data['files'] = files;
    if (details != null) {
      data['details'] = details!.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? serviceId;
  String? subServiceId;
  String? quantity;
  String? brandId;
  String? smallItems;
  String? mediumItems;
  String? largeItems;
  String? isLadder;
  String? ladderLength;
  String? homeTypeId;
  String? bedRooms;
  String? livingRooms;
  String? diningRooms;
  String? maidRooms;
  String? storageRooms;
  String? currentWallColor;
  String? requiredWallColor;
  String? isCeileingColor;
  String? ceileingColor;
  String? dateTime;

  Details(
      {this.id,
      this.serviceId,
      this.subServiceId,
      this.quantity,
      this.brandId,
      this.smallItems,
      this.mediumItems,
      this.largeItems,
      this.isLadder,
      this.ladderLength,
      this.homeTypeId,
      this.bedRooms,
      this.livingRooms,
      this.diningRooms,
      this.maidRooms,
      this.storageRooms,
      this.currentWallColor,
      this.requiredWallColor,
      this.isCeileingColor,
      this.ceileingColor,
      this.dateTime});

  Details.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    serviceId = map['service_id']?.toString() ?? "";
    subServiceId = map['sub_service_id']?.toString() ?? "";
    quantity = map['quantity']?.toString() ?? "";
    brandId = map['brand_id']?.toString() ?? "";
    smallItems = map['small_items']?.toString() ?? "";
    mediumItems = map['medium_items']?.toString() ?? "";
    largeItems = map['large_items']?.toString() ?? "";
    isLadder = map['is_ladder']?.toString() ?? "";
    ladderLength = map['ladder_length']?.toString() ?? "";
    homeTypeId = map['home_type_id']?.toString() ?? "";
    bedRooms = map['bed_rooms']?.toString() ?? "";
    livingRooms = map['living_rooms']?.toString() ?? "";
    diningRooms = map['dining_rooms']?.toString() ?? "";
    maidRooms = map['maid_rooms']?.toString() ?? "";
    storageRooms = map['storage_rooms']?.toString() ?? "";
    currentWallColor = map['current_wall_color']?.toString() ?? "";
    requiredWallColor = map['required_wall_color']?.toString() ?? "";
    isCeileingColor = map['is_ceileing_color']?.toString() ?? "";
    ceileingColor = map['ceileing_color']?.toString() ?? "";
    dateTime = map['date_time']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_id'] = serviceId;
    data['sub_service_id'] = subServiceId;
    data['quantity'] = quantity;
    data['brand_id'] = brandId;
    data['small_items'] = smallItems;
    data['medium_items'] = mediumItems;
    data['large_items'] = largeItems;
    data['is_ladder'] = isLadder;
    data['ladder_length'] = ladderLength;
    data['home_type_id'] = homeTypeId;
    data['bed_rooms'] = bedRooms;
    data['living_rooms'] = livingRooms;
    data['dining_rooms'] = diningRooms;
    data['maid_rooms'] = maidRooms;
    data['storage_rooms'] = storageRooms;
    data['current_wall_color'] = currentWallColor;
    data['required_wall_color'] = requiredWallColor;
    data['is_ceileing_color'] = isCeileingColor;
    data['ceileing_color'] = ceileingColor;
    data['date_time'] = dateTime;
    return data;
  }
}
