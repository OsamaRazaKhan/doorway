class LocationModel {
  int? id;
  bool? isDefault;
  String? nickName;
  String? flat;
  String? building;
  String? address;
  String? lat;
  String? lng;

  LocationModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : 0;
    isDefault = map['isDefault'] != null ? map['isDefault'] as bool : false;
    nickName = map['nick_name']?.toString() ?? "";
    flat = map['flat']?.toString() ?? "";
    building = map['building']?.toString() ?? "";
    address = map['address']?.toString() ?? "";
    lat = map['lat']?.toString() ?? "";
    lng = map['lng']?.toString() ?? "";
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_default'] = isDefault;
    data['nick_name'] = nickName;
    data['flat'] = flat;
    data['building'] = building;
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
