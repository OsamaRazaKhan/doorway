class SubServiceModel {
  int? id;
  String? price;
  String? title;
  String? arTitle;
  String? description;
  String? arDescription;
  String? image;
  String? serviceId;
  bool isSelected = false;
  int quantity = 0;

  int? hasAttributes;
  Map<dynamic, dynamic>? attributes;
  List<String> attributesKeys = [];
  List<int> attributesValues = [];

  SubServiceModel(
      {this.arDescription,
      this.arTitle,
      this.description,
      this.id,
      this.image,
      this.price,
      this.serviceId,
      this.isSelected = false,
      this.quantity = 0,
      this.title,
      this.hasAttributes,
      this.attributes}) {
    if (hasAttributes != null && hasAttributes == 1) {
      List keys = attributes!.keys.toList();
      attributesKeys.clear();
      attributesValues.clear();
      //print(attributes);
      for (int c = 0; c < attributes!.keys.length; c++) {
        attributesKeys.add(
            keys[c].toString().substring(0, keys[c].toString().length - 6));
        attributesValues.add(attributes![keys[c].toString()]);
        //print(attributes![keys[c].toString()]);
      }
    }
  }
  SubServiceModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] != null ? int.parse(map['id'].toString()) : null;
    price = map['price']?.toString() ?? "";
    title = map['title']?.toString() ?? "";
    arTitle = map['arTitle']?.toString() ?? "";
    description = map['description']?.toString() ?? "";
    arDescription = map['arDescription']?.toString() ?? "";
    image = map['image']?.toString() ?? "";
    serviceId = map['serviceId']?.toString() ?? "";
    isSelected = map['isSelected'] ?? false;
    quantity =
        map['quantity'] != null ? int.parse(map['quantity'].toString()) : 0;
    hasAttributes = map['hasAttributes'] != null
        ? int.parse(map['hasAttributes'].toString())
        : null;
    attributes = map['attributes'];
    attributesKeys = map['attributesKeys'] != null
        ? List<String>.from(map['attributesKeys'])
        : [];
    attributesValues = map['attributesValues'] != null
        ? List<int>.from(map['attributesValues'])
        : [];
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['price'] = price;
    data['title'] = title;
    data['arTitle'] = arTitle;
    data['description'] = description;
    data['arDescription'] = arDescription;
    data['image'] = image;
    data['serviceId'] = serviceId;
    data['isSelected'] = isSelected;
    data['quantity'] = quantity;
    data['hasAttributes'] = hasAttributes;
    data['attributes'] = attributes;
    data['attributesKeys'] = attributesKeys;
    data['attributesValues'] = attributesValues;
    return data;
  }
}
