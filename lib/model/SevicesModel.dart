import 'package:doorway/Model/SubServiceModel.dart';

class ServicesModel {
  int? id;
  int? catId;
  int? subCatId;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? image;
  dynamic price;
  bool? isSelected = false;
  String? time;
  int? quantity;
  List? brands;
  String? hasSubService;
  List? tempSubServices;
  List<SubServiceModel> subServices = [];

  ServicesModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : null;
    catId = map['catId'] != null ? int.parse(map['catId'].toString()) : null;
    subCatId = map['subcategory'] != null
        ? int.parse(map['subcategory']['id'].toString())
        : null;
    title = map['title']?.toString() ?? "";
    arTitle = map['arTitle']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['arDescription']?.toString() ?? "";
    image = map['image']?.toString() ?? "";
    price = map['price'];
    isSelected = map['isSelected'] ?? false;
    time = map['time']?.toString() ?? "";
    quantity =
        map['quantity'] != null ? int.parse(map['quantity'].toString()) : null;
    brands = map['brands'];
    hasSubService = map['has_sub_services']?.toString();
    //tempSubServices = map['tempSubServices'];

    if (hasSubService == "1") {
      map['subservices'].forEach((v) {
        subServices.add(SubServiceModel.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['catId'] = catId;
    data['subCatId'] = subCatId;
    data['title'] = title;
    data['arTitle'] = arTitle;
    data['description'] = description;
    data['arDescription'] = arDescription;
    data['image'] = image;
    data['price'] = price;
    data['isSelected'] = isSelected;
    data['time'] = time;
    data['quantity'] = quantity;
    data['brands'] = brands;
    data['hasSubService'] = hasSubService;
    data['tempSubServices'] = tempSubServices;

    if (subServices.isNotEmpty) {
      data['subServices'] = subServices.map((v) => v.toMap()).toList();
    }
    return data;
  }
}
